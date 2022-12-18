import 'package:diplomayin/constants/constants.dart';
import 'package:diplomayin/models/ocr.dart';

import 'package:sqflite/sqflite.dart';

class DbRepository {
  static Database? database;
  static String table = 'ocr';
  static String columnId = 'id';
  static String json = 'json';
  static String image = 'image';
  static String file = 'file';
  static String timestamp = 'timestamp';

  static String tableTxt = 'ocrTxt';
  static String columnIdTxt = 'idTxt';
  static String jsonTxt = 'jsonTxt';
  static String fileTxt = 'fileTxt';
  static String timestampTxt = 'timestampTxt';

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
          $file text,
          $json text not null,
          $image text,
          $timestamp DATETIME DEFAULT CURRENT_TIMESTAMP)
        ''');

      await db.execute('''
        create table $tableTxt ( 
          $columnIdTxt integer primary key autoincrement, 
          $fileTxt text,
          $jsonTxt text not null,
          $timestampTxt DATETIME DEFAULT CURRENT_TIMESTAMP)
        ''');
    });
  }

  Future<void> closeDB(Database database) async {
    await database.close();
  }

  Future<void> insertData(
      {String? jsonPath, String? filePath, String? imagePath}) async {
    await database?.insert(table, {
      "\"$columnId\"": null,
      "\"$json\"": "$jsonPath",
      "\"$file\"": "$filePath",
      "\"$image\"": "$imagePath",
      "\"$timestamp\"": null
    });
  }

  Future<void> insertDataTxt({String? jsonPathTxt, String? filePathTxt}) async {
    await database?.insert(tableTxt, {
      "\"$columnIdTxt\"": null,
      "\"$jsonTxt\"": "$jsonPathTxt",
      "\"$fileTxt\"": "$filePathTxt",
      "\"$timestampTxt\"": null
    });
  }

  Future<List<Map<String, Object?>>> getData() async {
    return await database!.query(table);
  }

  Future<List<Map<String, Object?>>> getDataTxt() async {
    return await database!.query(tableTxt);
  }
}
