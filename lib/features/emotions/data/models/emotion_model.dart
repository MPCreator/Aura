// data/models/emocion_model.dart

import 'package:aura/features/emotions/domain/entities/emotion.dart';

class EmocionModel {
  final int? idEmocion;
  final int idUsuario;
  final String emocion;
  final int intensidad;
  final String? categoria;

  EmocionModel({
    this.idEmocion,
    required this.idUsuario,
    required this.emocion,
    required this.intensidad,
    this.categoria,
  });

  // Convertir un objeto Map a una instancia de EmocionModel
  factory EmocionModel.fromMap(Map<String, dynamic> map) {
    return EmocionModel(
      idEmocion: map['idEmocion'],
      idUsuario: map['id_usuario'],
      emocion: map['emocion'],
      intensidad: map['intensidad'],
      categoria: map['categoria'],
    );
  }

  // Convertir un EmocionModel a un Map para insertarlo o actualizarlo en la base de datos
  Map<String, dynamic> toMap() {
    return {
      'id_usuario': idUsuario,
      'emocion': emocion,
      'intensidad': intensidad,
      'categoria': categoria,
    };
  }

  // Convertir modelo a entidad de dominio
  Emocion toDomain() {
    return Emocion(
      idEmocion: idEmocion,
      idUsuario: idUsuario,
      emocion: emocion,
      intensidad: intensidad,
      categoria: categoria,
    );
  }

  // Crear un modelo desde una entidad de dominio
  factory EmocionModel.fromDomain(Emocion emocion) {
    return EmocionModel(
      idEmocion: emocion.idEmocion,
      idUsuario: emocion.idUsuario,
      emocion: emocion.emocion,
      intensidad: emocion.intensidad,
      categoria: emocion.categoria,
    );
  }
}
