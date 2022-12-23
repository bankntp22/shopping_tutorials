import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/model_profile.dart';

class SQLiteDatabaseProfile {
  final String databaseName = "profile.db";
  final String tableProfile = "profile";
  int version = 7;
  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await _initDB("profile.db");
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 7, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final textType = 'TEXT NOT NULL';
    final textNull = 'TEXT NULL';
    final booltype = 'BOOLEAN NOT NULL';
    final autoIncrement = ' INTEGER AUTOINCREMENT NOT NULL';
    final primaryKey = ' PRIMARY KEY ';
    final String idForeignKey = "FOREIGN KEY";

    ModelProfile modelProfile = ModelProfile();

    await db.execute(
        "CREATE TABLE $tableProfile ( ${modelProfile.sID} $textType, ${modelProfile.sFirstName} $textType, ${modelProfile.sLastName} $textType, ${modelProfile.sNumberPhone} $textType, ${modelProfile.sNumberHouse} $textType, ${modelProfile.sVillage} $textType, ${modelProfile.sVillageNo} $textType, ${modelProfile.sLane} $textType, ${modelProfile.sRoad} $textType, ${modelProfile.sSubdistrict} $textType, ${modelProfile.sDistrict} $textType, ${modelProfile.sProvince} $textType, ${modelProfile.sPostalCode} $textType, ${modelProfile.sNickName} $textType)");
    // await db.execute(
    //         'CREATE TABLE $tableItem (${Constant.id} $idType , ${Constant.codeHead} $textType, ${Constant.nameProduct} $textType, ${Constant.priceProduct} $textType, ${Constant.qtyProduct} $textType, ${Constant.totalPriceProduct} $textType,$idForeignKey (${Constant.codeHead}) REFERENCES $tableHead (${Constant.code}))')
    //         ;

    // await db.execute(
    //     "CREATE TABLE $tableProfile ( ${Constant.totalPrice} $textType, ${Constant.payMent} $textType, ${Constant.code} $textType $primaryKey)");
  }

  Future<int> insertItem(Map<String, dynamic> map) async {
    final db = await database;
    return await db!.insert(tableProfile, map);
  }

  Future<List<Map>> getData() async {
    final db = await database;
    return await db!.query(tableProfile);
  }
  
}
