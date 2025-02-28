import 'package:aura/core/utils/date_utils.dart';
import 'package:aura/features/journal/domain/entities/journal.dart';
import 'package:aura/features/journal/domain/repositories/journal_repository.dart';

class InsertDiario {
  final DiarioRepository repository;

  InsertDiario(this.repository);

  Future<int> ejecutar(Diario diario) async {
    if (diario.titulo.isEmpty || diario.texto.isEmpty) {
      throw 'El título y el contenido no pueden estar vacíos.';
    }

    final fechaFormateada = DateFormatter.formatDate(DateTime.now());

    final nuevoDiario = Diario(
      idUsuario: diario.idUsuario,
      titulo: diario.titulo,
      texto: diario.texto,
      fecha: fechaFormateada,
    );

    return await repository.insertDiario(nuevoDiario);
  }
}
