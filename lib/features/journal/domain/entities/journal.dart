class Diario {
  final int? idDiario;
  final int idUsuario;
  final String titulo;
  final String fecha;
  final String texto;
  final String? etiqueta;

  Diario({
    this.idDiario,
    required this.idUsuario,
    required this.titulo,
    required this.fecha,
    required this.texto,
    this.etiqueta,
  });
}
