import 'package:aura/core/db/app_database.dart';

class ArchivoDiarioDao {
  Future<int> insertArchivoDiario(Map<String, dynamic> archivosDiario) async {
    final db = await AppDatabase().database;
    return await db.insert('ArchivosDiario', archivosDiario);
  }

  Future<List<Map<String, dynamic>>> getAllArchivosDiario() async {
    final db = await AppDatabase().database;
    return await db.query('ArchivosDiario');
  }

  Future<List<Map<String, dynamic>>> getArchivosDiarioByUserId(
      int idUsuario) async {
    final db = await AppDatabase().database;
    return await db.query('ArchivosDiario',
        where: 'id_usuario = ?', whereArgs: [idUsuario]);
  }

  Future<int> updateArchivoDiario(
      int idArchivosDiario, Map<String, dynamic> archivosDiario) async {
    final db = await AppDatabase().database;
    return await db.update(
      'ArchivosDiario',
      archivosDiario,
      where: 'idArchivosDiario = ?',
      whereArgs: [idArchivosDiario],
    );
  }

  Future<int> deleteArchivoDiario(int idArchivosDiario) async {
    final db = await AppDatabase().database;
    return await db.delete(
      'ArchivosDiario',
      where: 'idArchivosDiario = ?',
      whereArgs: [idArchivosDiario],
    );
  }
}
