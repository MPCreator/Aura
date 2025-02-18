import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class AppDatabase {
  static final AppDatabase _instance = AppDatabase._internal();
  factory AppDatabase() => _instance;

  AppDatabase._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    // Delete the database if it exists
    /*
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'app_database.db');
    await deleteDatabase(path);
    */

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = await getDatabasesPath();
    path = join(path, 'app_database.db');

    return await openDatabase(
      path,
      version: 1,
      onConfigure: (db) async {
        await db.execute("PRAGMA foreign_keys = ON");
      },
      onCreate: _createTables,
    );
  }

  Future<void> _createTables(Database db, int version) async {
    await db.execute('''
      CREATE TABLE Usuario (
        idUsuario INTEGER PRIMARY KEY AUTOINCREMENT,
        correo TEXT NOT NULL UNIQUE,
        nombre_usuario TEXT NOT NULL,
        contrasena TEXT NOT NULL,
        pin INTEGER NOT NULL,
        fecha_nacimiento DATE NOT NULL,
        genero TEXT NOT NULL,
        pais TEXT NOT NULL,
        tipo TEXT NOT NULL
      )
    ''');
    await db.execute('''
      CREATE TABLE Emociones (
        idEmocion INTEGER PRIMARY KEY AUTOINCREMENT,
        id_usuario INTEGER NOT NULL,
        emocion TEXT NOT NULL CHECK (emocion IN ('Enojado', 'Triste', 'Normal', 'Feliz', 'Ansioso')),
        intensidad INTEGER NOT NULL CHECK (intensidad BETWEEN 1 AND 5),
        categoria TEXT,
        FOREIGN KEY (id_usuario) REFERENCES Usuario (idUsuario)
      )
    ''');
  }
}
