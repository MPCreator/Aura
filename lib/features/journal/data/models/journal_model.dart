import 'package:aura/features/journal/domain/entities/journal.dart';

class DiarioModel {
  final int? idDiario;
  final int idUsuario;
  final String titulo;
  final String fecha;
  final String texto;
  final String? etiqueta;

  DiarioModel({
    this.idDiario,
    required this.idUsuario,
    required this.titulo,
    required this.fecha,
    required this.texto,
    this.etiqueta,
  });

  // Convertir un objeto Map a una instancia de DiarioModel
  factory DiarioModel.fromMap(Map<String, dynamic> map) {
    return DiarioModel(
      idDiario: map['idDiario'],
      idUsuario: map['id_usuario'],
      titulo: map['titulo'],
      fecha: map['fecha'],
      texto: map['texto'],
      etiqueta: map['etiqueta'],
    );
  }

  // Convertir un DiarioModel a un Map para insertarlo o actualizarlo en la base de datos
  Map<String, dynamic> toMap() {
    return {
      'id_usuario': idUsuario,
      'titulo': titulo,
      'fecha': fecha,
      'texto': texto,
      'etiqueta': etiqueta,
    };
  }

  // Convertir modelo a entidad de dominio
  Diario toDomain() {
    return Diario(
      idDiario: idDiario,
      idUsuario: idUsuario,
      titulo: titulo,
      fecha: fecha,
      texto: texto,
      etiqueta: etiqueta,
    );
  }

  // Crear un modelo desde una entidad de dominio
  factory DiarioModel.fromDomain(Diario diario) {
    return DiarioModel(
      idDiario: diario.idDiario,
      idUsuario: diario.idUsuario,
      titulo: diario.titulo,
      fecha: diario.fecha,
      texto: diario.texto,
      etiqueta: diario.etiqueta,
    );
  }
}
