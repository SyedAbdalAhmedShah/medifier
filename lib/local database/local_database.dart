import 'package:flutter/cupertino.dart';
import 'package:medicine_notifier/model/add_medicine.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static Database? database;
  static int _version = 1;
  static String tableName = 'medicationTable';

  static Future initDB() async {
    if (database != null) {
      debugPrint('Database Already Exisit');
      return database;
    }
    try {
      String path = await getDatabasesPath() + 'medicationTable.db';
      database = await openDatabase(
        path,
        version: _version,
        onCreate: (Database db, int version) {
          print('creating new Database ');
          return db.execute(
            "CREATE TABLE $tableName("
            "id INTEGER PRIMARY KEY AUTOINCREMENT,"
            "tabletName STRING ,"
            " totalTablet INTEGER ,"
            " doctorName STRING, "
            "time STRING)",
          );
        },
      );
    } catch (e) {
      print('Database Exception occured====== ${e.toString()}');
    }
  }

  Future insertData(AddMedicineModel? medicineModel) {
    final insertedrecord = database!.insert(tableName, medicineModel!.toJson());
    print('record inserted into where id = ${insertedrecord} ');
    return insertedrecord;
  }

  static Future<List<Map<String, dynamic>>> getAllRecordFromDb() async {
    final allRecord = await database!.query(tableName);
    print('database record =========   $allRecord');
    return allRecord;
  }
}
