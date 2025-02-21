class Emocion {
  final int? idEmocion;
  final int idUsuario;
  final String emocion;
  final int intensidad;
  final String? categoria;

  Emocion({
    this.idEmocion,
    required this.idUsuario,
    required this.emocion,
    required this.intensidad,
    this.categoria,
  });
}
