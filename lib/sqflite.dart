import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await _initDB();
    return _database;
  }

  Future<Database> _initDB() async {
    String path = join(await getDatabasesPath(), 'review_database.db');
    return await openDatabase(path, onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE reviews(id INTEGER PRIMARY KEY, image_path TEXT, status TEXT)',
      );
    }, version: 1);
  }

  Future<void> insertReview(String imagePath, String status) async {
    final db = await database;
    await db.insert(
      'reviews',
      {'image_path': imagePath, 'status': status},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
