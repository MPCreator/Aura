// data/models/archivo_model.dart

import 'package:aura/features/journal/domain/entities/journal_file.dart';

class ArchivoDiarioModel {
  final int? idArchivoDiario;
  final int idDiario;
  final String tipoArchivo; // 'imagen', 'audio', etc.
  final String rutaArchivo;

  ArchivoDiarioModel({
    this.idArchivoDiario,
    required this.idDiario,
    required this.tipoArchivo,
    required this.rutaArchivo,
  });

  // Convertir un objeto Map a una instancia de ArchivoModel
  factory ArchivoDiarioModel.fromMap(Map<String, dynamic> map) {
    return ArchivoDiarioModel(
      idArchivoDiario: map['idArchivo'],
      idDiario: map['idDiario'],
      tipoArchivo: map['tipoArchivo'],
      rutaArchivo: map['rutaArchivo'],
    );
  }

  // Convertir un ArchivoModel a un Map para insertarlo o actualizarlo en la base de datos
  Map<String, dynamic> toMap() {
    return {
      'idDiario': idDiario,
      'tipoArchivo': tipoArchivo,
      'rutaArchivo': rutaArchivo,
    };
  }

  // Convertir modelo a entidad de dominio
  ArchivoDiario toDomain() {
    return ArchivoDiario(
      idArchivo: idArchivoDiario,
      idDiario: idDiario,
      tipoArchivo: tipoArchivo,
      rutaArchivo: rutaArchivo,
    );
  }

  // Crear un modelo desde una entidad de dominio
  factory ArchivoDiarioModel.fromDomain(ArchivoDiario archivo) {
    return ArchivoDiarioModel(
      idArchivoDiario: archivo.idArchivo,
      idDiario: archivo.idDiario,
      tipoArchivo: archivo.tipoArchivo,
      rutaArchivo: archivo.rutaArchivo,
    );
  }
}
