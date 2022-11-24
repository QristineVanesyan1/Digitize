import 'package:diplomayin/constants/constants.dart';
import 'package:diplomayin/models/ocr.dart';

import 'package:sqflite/sqflite.dart';

class DbRepository {
  static Database? database;
  static String table = 'ocr';
  static String columnId = 'id';
  static String path = 'path';
  static String isFavorite = 'is_favorite';
  static String image = 'image';
  static String timestamp = 'timestamp';
  static Future<Database?> getDb() async {
    database ??= await openDB();
    return database;
  }

  static Future<Database> openDB() async {
    return await openDatabase('${Constants.appTitle}.db', version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
        create table $table ( 
          $columnId integer primary key autoincrement, 
          $path text not null,
          $image text not null,
          $isFavorite boolean not null,
          $timestamp DATETIME DEFAULT CURRENT_TIMESTAMP)
        ''');
    });
  }

  Future<void> closeDB(Database database) async {
    await database.close();
  }

  Future<void> insertData(String filePath, String imagePath) async {
    await database?.insert(table,
        {columnId: null, path: filePath, image: imagePath, timestamp: null});
  }

  Future<List<Map<String, Object?>>> getData() async {
    return await database!.query(table);
  }
}
