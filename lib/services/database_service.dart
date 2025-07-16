import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tic_tac_toe/models/history.dart';

class DatabaseService {
  static final DatabaseService instance = DatabaseService._internal();
  static Database? _database;

  DatabaseService._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase('game_history.db');
    return _database!;
  }

  Future<Database> _initDatabase(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return openDatabase(
      path,
      version: 2, // 1. Version incremented from 1 to 2
      onCreate: _createDb,
      onUpgrade: _onUpgrade, // 2. onUpgrade callback added
    );
  }

  // This method is called only when the database is created for the first time.
  Future<void> _createDb(Database db, int version) async {
    await db.execute('''
      CREATE TABLE ${History.tableName}(
        ${History.columnId} INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        ${History.columnWinner} TEXT NOT NULL,
        ${History.columnBoardState} TEXT NOT NULL,
        ${History.columnMode} TEXT NOT NULL,
        ${History.columnDate} TEXT NOT NULL
      )
    ''');
  }

  // 3. This method is called when the version is incremented.
  // It allows for migrating the database schema.
  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 2) {
      // If the database is at version 1, we add the 'mode' column.
      // The default value 'CPU' must be in single quotes to be valid SQL.
      await db.execute(
        "ALTER TABLE \${History.tableName} ADD COLUMN \${History.columnMode} TEXT NOT NULL DEFAULT 'CPU'",
      );
    }
  }

  Future<void> insertHistory(History history) async {
    final db = await instance.database;
    await db.insert(History.tableName, history.toMap());
    print(history.toMap());
    print('Jogo salvo com sucesso');
  }

  Future<List<History>> getHistory() async {
    final db = await instance.database;
    final List<Map<String, dynamic>> maps = await db.query(History.tableName);
    print(maps.length);
    print('Mapas:$maps');
    return maps.map((map) => History.fromMap(map)).toList();
  }

  /// Deletes all records from the history table.
  Future<void> clearHistory() async {
    final db = await instance.database;
    await db.delete(History.tableName);
    print('Jogo deletado com sucesso');
  }

  Future<void> close() async {
    final db = await instance.database;
    db.close();
    _database = null;
  }
}
