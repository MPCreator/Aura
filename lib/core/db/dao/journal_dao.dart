import 'package:aura/core/db/app_database.dart';

class DiarioDao {
  Future<int> insertDiario(Map<String, dynamic> diario) async {
    final db = await AppDatabase().database;
    return await db.insert('Diario', diario);
  }

  Future<List<Map<String, dynamic>>> getAllDiarios() async {
    final db = await AppDatabase().database;
    return await db.query('Diario');
  }

  Future<List<Map<String, dynamic>>> getDiariosByUserId(int idUsuario) async {
    final db = await AppDatabase().database;
    return await db
        .query('Diario', where: 'id_usuario = ?', whereArgs: [idUsuario]);
  }

  Future<List<Map<String, dynamic>>> getDiarioById(int id) async {
    final db = await AppDatabase().database;
    return await db.query('Diario', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> updateDiario(int idDiario, Map<String, dynamic> diario) async {
    final db = await AppDatabase().database;
    return await db.update(
      'Diario',
      diario,
      where: 'idDiario = ?',
      whereArgs: [idDiario],
    );
  }

  Future<int> deleteDiario(int idDiario) async {
    final db = await AppDatabase().database;
    return await db.delete(
      'Diario',
      where: 'idDiario = ?',
      whereArgs: [idDiario],
    );
  }
}
