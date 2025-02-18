import 'package:aura/core/db/app_database.dart';

class UsuarioDao {
  // Insertar un nuevo usuario
  Future<int> insertUsuario(Map<String, dynamic> usuario) async {
    final db = await AppDatabase().database;
    return await db.insert('Usuario', usuario);
  }

  // Obtener todos los usuarios
  Future<List<Map<String, dynamic>>> getUsuarios() async {
    final db = await AppDatabase().database;
    return await db.query('Usuario');
  }

  // Obtener un usuario por su ID
  Future<Map<String, dynamic>?> getUsuarioById(int idUsuario) async {
    final db = await AppDatabase().database;
    var result = await db
        .query('Usuario', where: 'idUsuario = ?', whereArgs: [idUsuario]);
    return result.isNotEmpty ? result.first : null;
  }

  // Actualizar un usuario
  Future<int> updateUsuario(int idUsuario, Map<String, dynamic> usuario) async {
    final db = await AppDatabase().database;
    return await db.update('Usuario', usuario,
        where: 'idUsuario = ?', whereArgs: [idUsuario]);
  }

  // Eliminar un usuario
  Future<int> deleteUsuario(int idUsuario) async {
    final db = await AppDatabase().database;
    return await db
        .delete('Usuario', where: 'idUsuario = ?', whereArgs: [idUsuario]);
  }
}
