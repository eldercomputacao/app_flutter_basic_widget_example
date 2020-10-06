import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelperEstoque {
  static final DatabaseHelperEstoque instancia =
      DatabaseHelperEstoque._constructor();
  DatabaseHelperEstoque._constructor();

  Database _db;
  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await _initDb();
    return _db;
  }

  Future<Database> _initDb() async {
    String path = await getDatabasesPath();
    String pathDb = join(path, 'estoque.db');
    print(pathDb);

    return await openDatabase(
      pathDb,
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
    print('(onDowngrade) > [oldVersion: $oldVersion, newVersion: $newVersion]');
  }

  FutureOr<void> _onUpgrade(Database db, int oldVersion, int newVersion) {
    print('(onUpgrade) > [oldVersion: $oldVersion, newVersion: $newVersion]');
    String sql = '''
      ALTER TABLE produtos ADD marca TEXT
    ''';
    db.execute(sql);
    print(sql);
  }

  FutureOr<void> _onConfigure(Database db) {
    print('(onConfigure)');
  }

  FutureOr<void> _onCreate(Database db, int version) {
    print('(onCreate) > [version: $version]');
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

  FutureOr<void> _onOpen(Database db) {
    print('(onOpen)');
  }

  Future<void> close() {
    _db.close();
  }
}
