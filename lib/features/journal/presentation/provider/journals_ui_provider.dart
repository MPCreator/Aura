import 'package:aura/core/utils/date_utils.dart';
import 'package:aura/features/journal/domain/entities/journal.dart';
import 'package:aura/features/journal/domain/usercases/get_journals.dart';
import 'package:aura/features/journal/domain/usercases/insert_journal.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DiarioProvider extends ChangeNotifier {
  final GetDiarios getDiarios;
  final InsertDiario insertDiario;

  List<Diario> _diarios = [];
  List<Diario> get diarios => _diarios;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  DiarioProvider(this.getDiarios, this.insertDiario);

  Diario? get latestDiario {
    if (_diarios.isEmpty) return null;
    return _diarios.reduce((current, next) {
      final currentDate = DateFormatter.parseDate(current.fecha);
      final nextDate = DateFormatter.parseDate(next.fecha);
      return nextDate.isAfter(currentDate) ? next : current;
    });
  }

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  /// Método para traer todos los diarios de un usuario sin agruparlos
  Future<void> fetchDiariosByUser(int userId) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _diarios = await getDiarios(userId);
    } catch (e) {
      _errorMessage = "Error al obtener los diarios del usuario.";
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// Método privado que agrupa la lista de diarios por mes
  Map<String, List<Diario>> _agruparDiariosPorMes(List<Diario> diarios) {
    final Map<String, List<Diario>> agrupados = {};

    for (final diario in diarios) {
      final date = DateFormatter.parseDate(diario.fecha);
      final mes = DateFormat.MMMM('es').format(date);

      if (!agrupados.containsKey(mes)) {
        agrupados[mes] = [];
      }
      agrupados[mes]!.add(diario);
    }
    return agrupados;
  }

  /// Getter que retorna los diarios agrupados por mes, calculado al momento de ser solicitado.
  Map<String, List<Diario>> get diariosPorMes =>
      _agruparDiariosPorMes(_diarios);

  Future<int> addDiario(Diario diario) async {
    setLoading(true);
    try {
      final id = await insertDiario.ejecutar(diario);
      // Si es necesario, refrescamos la lista de diarios
      await fetchDiariosByUser(diario.idUsuario);
      return id;
    } catch (error) {
      debugPrint('Error saving diario: $error');
      rethrow;
    } finally {
      setLoading(false);
    }
  }
}
