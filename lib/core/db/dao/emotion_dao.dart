import 'package:aura/core/db/app_database.dart';

class EmocionesDao {
  // Insertar una nueva emoción
  Future<int> insertEmocion(Map<String, dynamic> emocion) async {
    final db = await AppDatabase().database;
    return await db.insert('Emociones', emocion);
  }

  // Obtener todas las emociones
  Future<List<Map<String, dynamic>>> getEmociones() async {
    final db = await AppDatabase().database;
    return await db.query('Emociones');
  }

  // Obtener emociones por el ID de usuario
  Future<List<Map<String, dynamic>>> getEmocionesByUserId(int idUsuario) async {
    final db = await AppDatabase().database;
    return await db
        .query('Emociones', where: 'id_usuario = ?', whereArgs: [idUsuario]);
  }

  // Actualizar una emoción
  Future<int> updateEmocion(int idEmocion, Map<String, dynamic> emocion) async {
    final db = await AppDatabase().database;
    return await db.update('Emociones', emocion,
        where: 'idEmocion = ?', whereArgs: [idEmocion]);
  }

  // Eliminar una emoción
  Future<int> deleteEmocion(int idEmocion) async {
    final db = await AppDatabase().database;
    return await db
        .delete('Emociones', where: 'idEmocion = ?', whereArgs: [idEmocion]);
  }
}
