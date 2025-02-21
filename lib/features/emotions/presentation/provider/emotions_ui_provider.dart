import 'package:aura/features/emotions/domain/usecases/get_emotions_options.dart';
import 'package:flutter/material.dart';

class EmocionesProvider extends ChangeNotifier {
  final GetEmocionesOpciones getEmocionesOpciones;

  List<String> _emociones = [];
  String? _emocionSeleccionada;

  EmocionesProvider(this.getEmocionesOpciones) {
    _cargarEmociones();
  }

  List<String> get emociones => _emociones;
  String? get emocionSeleccionada => _emocionSeleccionada;

  Future<void> _cargarEmociones() async {
    _emociones = await getEmocionesOpciones.execute();

    _emocionSeleccionada = _emociones.contains('Calma')
        ? 'Calma'
        : (_emociones.isNotEmpty ? _emociones.first : null);

    notifyListeners();
  }

  void seleccionarEmocion(String emocion) {
    _emocionSeleccionada = emocion;
    notifyListeners();
  }
}

class EmocionDetalleProvider extends ChangeNotifier {
  int _intensidad = 3; //Intensidad base (1 al 5)
  int get intensidad => _intensidad;
  set intensidad(int value) {
    _intensidad = value;
    notifyListeners();
  }

  // Lista de áreas seleccionadas
  final Set<String> _areasSeleccionadas = {};
  Set<String> get areasSeleccionadas => _areasSeleccionadas;

  // Cambiar la selección de un área
  void toggleArea(String area) {
    if (_areasSeleccionadas.contains(area)) {
      _areasSeleccionadas.remove(area);
    } else {
      _areasSeleccionadas.add(area);
    }
    notifyListeners();
  }

  // Controlador para el campo "Otro"
  final TextEditingController _otroController = TextEditingController();
  TextEditingController get otroController => _otroController;

  @override
  void dispose() {
    _otroController.dispose();
    super.dispose();
  }
}
