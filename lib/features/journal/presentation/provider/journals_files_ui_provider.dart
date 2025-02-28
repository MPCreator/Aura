import 'dart:io';

import 'package:aura/features/journal/domain/entities/journal_file.dart';
import 'package:aura/features/journal/domain/usercases/get_file_type.dart';
import 'package:aura/features/journal/domain/usercases/get_journal_files.dart';
import 'package:aura/features/journal/domain/usercases/insert_journal_file.dart';
import 'package:flutter/material.dart';

class ArchivoDiarioProvider extends ChangeNotifier {
  final GetArchivosDiario getArchivosDiario;
  final InsertArchivoDiario insertArchivoDiario;
  final GetTipoArchivo getTipoArchivo;

  ArchivoDiarioProvider(
      this.getArchivosDiario, this.insertArchivoDiario, this.getTipoArchivo);

  Future<void> addArchivoDiario(int diarioId, File archivo) async {
    final tipoArchivo = getTipoArchivo.obtenerTipoArchivo(archivo.path);
    final nuevoArchivo = ArchivoDiario(
      idDiario: diarioId,
      tipoArchivo: tipoArchivo,
      rutaArchivo: archivo.path,
    );

    await insertArchivoDiario.ejecutar(nuevoArchivo);
    notifyListeners();
  }
}
