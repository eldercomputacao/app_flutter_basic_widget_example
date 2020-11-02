import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._constructor();
  DatabaseHelper._constructor();
  factory DatabaseHelper() => _instance;

  Database _database;
  Future<Database> getDatabase() async {
    if (_database != null) {
      return _database;
    }
    _database = await _initDatabase();
    return _database;
  }

  Future<Database> _initDatabase() async {
    String path = await getDatabasesPath();
    String pathDatabase = join(path, 'estoque1.db');
    print(pathDatabase);
    return await openDatabase(
      pathDatabase,
      version: 2,
      onConfigure: _onConfigure,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
      onDowngrade: _onDowngrade,
      onOpen: _onOpen,
      readOnly: false,
      singleInstance: true,
    );
  }

  FutureOr<void> _onDowngrade(db, oldVersion, newVersion) {
    print(
        'Método -> onDowngrade [oVersion: $oldVersion, nVersion: $newVersion]');
  }

  FutureOr<void> _onUpgrade(Database db, int oldVersion, int newVersion) {
    print('Método -> onUpgrade [oVersion: $oldVersion, nVersion: $newVersion]');
    String sql = 'ALTER TABLE produtos ADD marca TEXT';
    db.execute(sql);
    print(sql);
  }

  FutureOr<void> _onCreate(Database db, int version) {
    print('Método -> onCreate [version: $version]');
    String sql = '''
      CREATE TABLE produtos(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nome TEXT,
        preco REAL,
        quantidade INTEGER
      )
    ''';
    db.execute(sql);
    print(sql);
  }

  FutureOr<void> _onOpen(db) {
    print('Método -> onOpen');
  }

  FutureOr<void> _onConfigure(db) {
    print('Método -> onConfigure');
  }

  Future<void> close() async {
    await _database.close();
  }
}
