import 'package:for_suyeon/db/history_data.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  DBHelper._();

  static final DBHelper _db = DBHelper._();

  factory DBHelper() => _db;

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDB();
    return _database!;
  }

  initDB() async {
    final databasePath = await getDatabasesPath();
    String path = join(databasePath, "my_database.db");
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
            "CREATE TABLE HistoryData(id INTEGER PRIMARY KEY, content TEXT, imageArray BLOB )");
      },
    );
  }

  Future<void> insertHistoryData(HistoryData data) async {
    final db = await database;
    await db.insert(
      'HistoryData',
      data.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<HistoryData>> loadAllHistory() async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query('HistoryData');
    return List.generate(
      maps.length,
      (i) => HistoryData(
        maps[i]['id'],
        maps[i]['content'],
      ),
    );
  }

  Future<void> updateHistory(HistoryData data) async {
    final db = await database;
    await db.update(
      'HistoryData',
      data.toMap(),
      where: "id = ?",
      whereArgs: [data.id],
    );
  }

  Future<void> deleteHistory(int id) async {
    final db = await database;

    await db.delete(
      "HistoryData",
      where: "id = ?",
      whereArgs: [id],
    );
  }
}
