import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../models/constant.dart';

class SqlLiteManager {
  final String databaseName = "po.db";
  final String tableHead = 'po_head';
  final String tableItem = 'po_item';
  final String tableStatusOrder = 'po_status';
  int version = 24;

  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    }

    _database = await _initDB('po.db');

    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: version, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final textType = 'TEXT';
    final booltype = 'BOOLEAN';
    final autoIncrement = ' INTEGER AUTOINCREMENT';
    final primaryKey = ' PRIMARY KEY ';
    final String idForeignKey = "FOREIGN KEY";

    // await db.execute(
    //         'CREATE TABLE $tableHead (${Constant.id} $autoIncrement , ${Constant.totalPrice} $textType, ${Constant.payMent} $textType,${Constant.code} $textType $primaryKey)')
    //         ;
    // await db.execute(
    //         'CREATE TABLE $tableItem (${Constant.id} $idType , ${Constant.codeHead} $textType, ${Constant.nameProduct} $textType, ${Constant.priceProduct} $textType, ${Constant.qtyProduct} $textType, ${Constant.totalPriceProduct} $textType,$idForeignKey (${Constant.codeHead}) REFERENCES $tableHead (${Constant.code}))')
    //         ;

    await db.execute(
        "CREATE TABLE $tableHead ( ${Constant.totalPrice} $textType, ${Constant.payMent} $textType, ${Constant.code} $textType $primaryKey, ${Constant.statusOrder} $textType)");
    await db.execute(
        "CREATE TABLE $tableItem ( ${Constant.codeHead} $textType, ${Constant.nameProduct} $textType, ${Constant.priceProduct} $textType, ${Constant.qtyProduct} $textType, ${Constant.totalPriceProduct} $textType, FOREIGN KEY (${Constant.codeHead}) REFERENCES $tableHead (${Constant.code}) )");
    // await db.execute(
    //     "CREATE TABLE $tableStatusOrder ( ${Constant.sCodeStatus} $textType, ${Constant.statusOrder} $textType, FOREIGN KEY (${Constant.sCodeStatus}) REFERENCES $tableHead (${Constant.code}) )");
  }

  Future<List<Map<String, dynamic>>> getData() async {
    final db = await database;
    // String sWhere =
    //     Constant.statusOrder + " != ? and " + Constant.statusOrder + " != ? ";
    // String sWhere = Constant.statusOrder + " is null ";
    // List<String> list = ["null"];
    // List<String> list = [Constant.statusOrder];
    return await db!.query(tableHead);
  }

  Future<int> insertDataStatusOrder(Map<String, Object> map) async {
    final db = await database;
    // String sWhere =
    //     Constant.statusOrder + " != ? and " + Constant.statusOrder + " != ? ";
    // String sWhere = Constant.statusOrder + " is null ";
    // List<String> list = ["null"];
    // List<String> list = [Constant.statusOrder];

    return await db!.insert(tableStatusOrder, map);
  }

  Future<List<Map<String, Object?>>> queryDataStatusOrder(String sCode) async {
    final db = await database;
    // String sWhere =
    //     Constant.statusOrder + " != ? and " + Constant.statusOrder + " != ? ";
    // String sWhere = Constant.statusOrder + " is null ";
    // List<String> list = ["null"];
    // List<String> list = [Constant.statusOrder];
    String sWhere = Constant.code + "= ?";
    List<String> list = [sCode];

    return await db!.query(tableStatusOrder, where: sWhere, whereArgs: list);
  }

  Future<List<Map>> getOrder(String code) async {
    final db = await database;
    String sWhere = Constant.code + "= ?";
    List<String> list = [code];
    return await db!.query(tableHead, where: sWhere, whereArgs: list);
  }

  Future<List<Map>> getItem(String code) async {
    final db = await database;
    String sWhere = Constant.codeHead + "= ?";
    List<String> list = [code];
    return await db!.query(tableItem, where: sWhere, whereArgs: list);
  }

  Future<List<Map>> getLastCode() async {
    final db = await database;
    return await db!
        .query(tableHead, limit: 1, orderBy: "${Constant.code} DESC ");
  }

  Future<int> insertHead(Map<String, dynamic> map) async {
    final db = await database;
    return await db!.insert(tableHead, map);
  }

  Future<int> insertItem(Map<String, dynamic> map) async {
    final db = await database;
    return await db!.insert(tableItem, map);
  }

  Future<int> deleteData() async {
    final db = await database;
    return await db!.delete(tableHead);
  }

  Future<int> updateData(Map<String,dynamic> map,String code) async {
    final db = await database;
    // String sWhere = Constant.code + "= ?";
    String sWhere = "${Constant.statusOrder} = ?";
    List<String> list = [Constant.statusOrder];
    
    return await db!.update(tableHead, map, where: sWhere, whereArgs: list);
  }

  // initDatabase() async {
  //   await openDatabase(join(await getDatabasesPath(), databaseName),
  //       onCreate: (db, version) => db.execute(
  //           'CREATE TABLE $tableDatabase ($idColumn INTEGER PRIMARY KEY, $totalPrice TEXT, $payMent TEXT, name TEXT)'),
  //       version: version);
  // }
}
