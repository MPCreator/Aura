import 'package:aura/core/db/app_database.dart';

class EmocionesDao {
  Future<int> insertEmocion(Map<String, dynamic> emocion) async {
    final db = await AppDatabase().database;
    return await db.insert('Emociones', emocion);
  }

  Future<List<Map<String, dynamic>>> getEmociones() async {
    final db = await AppDatabase().database;
    return await db.query('Emociones');
  }

  Future<List<Map<String, dynamic>>> getEmocionesByUserId(int idUsuario) async {
    final db = await AppDatabase().database;
    return await db
        .query('Emociones', where: 'id_usuario = ?', whereArgs: [idUsuario]);
  }

  Future<int> updateEmocion(int idEmocion, Map<String, dynamic> emocion) async {
    final db = await AppDatabase().database;
    return await db.update('Emociones', emocion,
        where: 'idEmocion = ?', whereArgs: [idEmocion]);
  }

  Future<int> deleteEmocion(int idEmocion) async {
    final db = await AppDatabase().database;
    return await db
        .delete('Emociones', where: 'idEmocion = ?', whereArgs: [idEmocion]);
  }
}
