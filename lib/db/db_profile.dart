import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/model_profile.dart';

class SQLiteDatabaseProfile {
  final String databaseName = "profile.db";
  final String tableProfile = "profile";
  int version = 0;

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
    return await openDatabase(path, version: version, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final textType = 'TEXT NOT NULL';
    final TextTypeNotnull = 'TEXT NULL';
    final booltype = 'BOOLEAN NOT NULL';
    final autoIncrement = ' INTEGER AUTOINCREMENT NOT NULL';
    final primaryKey = ' PRIMARY KEY ';
    final String idForeignKey = "FOREIGN KEY";

    ModelProfile modelProfile = ModelProfile();

    await db.execute(
      "CREATE TABLE $tableProfile (${modelProfile.sID} INTEGER PRIMARY KEY, ${modelProfile.sFirstName} TEXT, ${modelProfile.sLastName} TEXT, ${modelProfile.sNumberPhone} TEXT, ${modelProfile.sImages} TEXT, ${modelProfile.sNumberHouse} TEXT, ${modelProfile.sVillage} TEXT, ${modelProfile.sVillageNo} TEXT, ${modelProfile.sLane} TEXT, ${modelProfile.sRoad} TEXT, ${modelProfile.sSubdistrict} TEXT, ${modelProfile.sDistrict} TEXT, ${modelProfile.sProvince} TEXT, ${modelProfile.sPostalCode} TEXT)",
    );
    // await db.execute(
    //         'CREATE TABLE $tableItem (${Constant.id} $idType , ${Constant.codeHead} $textType, ${Constant.nameProduct} $textType, ${Constant.priceProduct} $textType, ${Constant.qtyProduct} $textType, ${Constant.totalPriceProduct} $textType,$idForeignKey (${Constant.codeHead}) REFERENCES $tableHead (${Constant.code}))')
    //         ;

    // await db.execute(
    //     "CREATE TABLE $tableProfile ( ${Constant.totalPrice} $textType, ${Constant.payMent} $textType, ${Constant.code} $textType $primaryKey)");
  }

  Future<int> insertItem (Map<String,dynamic> map) async{
    final db = await database;
    return await db!.insert(tableProfile, map);
  }

  Future<List<Map>> getData () async {
    final db = await database;
    return await db!.query(tableProfile);
  }
}
