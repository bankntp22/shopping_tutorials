import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../constant.dart';

class SqlLiteManager {
  final String databaseName = "po.db";
  final String tableHead = 'po_head';
  final String tableItem = 'po_item';
  int version = 15;

 

  static Database? _database;

  Future<Database?> get database async {
    if (_database != null){
      return _database;
    }

    _database = await _initDB('po.db');

    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath,filePath);
    return await openDatabase(path,version: 1,onCreate: _createDB);
  } 

  Future _createDB(Database db,int version) async {
    final textType = 'TEXT NOT NULL';
    final booltype = 'BOOLEAN NOT NULL';
    final autoIncrement = ' INTEGER AUTOINCREMENT NOT NULL';
    final primaryKey = ' PRIMARY KEY ';
    final String idForeignKey = "FOREIGN KEY";

    // await db.execute(
    //         'CREATE TABLE $tableHead (${Constant.id} $autoIncrement , ${Constant.totalPrice} $textType, ${Constant.payMent} $textType,${Constant.code} $textType $primaryKey)')
    //         ;
    // await db.execute(
    //         'CREATE TABLE $tableItem (${Constant.id} $idType , ${Constant.codeHead} $textType, ${Constant.nameProduct} $textType, ${Constant.priceProduct} $textType, ${Constant.qtyProduct} $textType, ${Constant.totalPriceProduct} $textType,$idForeignKey (${Constant.codeHead}) REFERENCES $tableHead (${Constant.code}))')
    //         ;

    await db.execute(
            "CREATE TABLE $tableHead ( ${Constant.totalPrice} $textType, ${Constant.payMent} $textType, ${Constant.code} $textType $primaryKey)")
            ;
    await db.execute(
            "CREATE TABLE $tableItem ( ${Constant.codeHead} $textType, ${Constant.nameProduct} $textType, ${Constant.priceProduct} $textType, ${Constant.qtyProduct} $textType, ${Constant.totalPriceProduct} $textType, FOREIGN KEY (${Constant.codeHead}) REFERENCES $tableHead (${Constant.code}) )")
            ;

  }

  Future<List<Map>> getData () async {
    final db = await database;
    return await db!.query(tableHead);
  }

  Future<List<Map>> getOrder (String code)async{
    final db = await database;
    String sWhere = Constant.code + "= ?";
    List<String> list = [code];
    return await db!.query(tableHead,where: sWhere,whereArgs: list);
  }
  
  Future<List<Map>> getItem ()async{
    final db = await database;
    return await db!.query(tableItem);
  }

  Future<List<Map>> getLastCode ()async{
    final db = await database;
    return await db!.query(tableHead,limit: 1,orderBy: "${Constant.code} DESC ");
  }

  Future<int> insertHead (Map<String,dynamic> map) async{
    final db = await database;
    return await db!.insert(tableHead, map);
  } 

  Future<int> insertItem (Map<String,dynamic> map) async{
    final db = await database;
    return await db!.insert(tableItem, map);
  }

  // Future<int> deleteItem (Map<String,dynamic> map)async{
  //   final db = await database;
  //   return await db!.delete(tableDatabase);
  // }

  

  



  // initDatabase() async {
  //   await openDatabase(join(await getDatabasesPath(), databaseName),
  //       onCreate: (db, version) => db.execute(
  //           'CREATE TABLE $tableDatabase ($idColumn INTEGER PRIMARY KEY, $totalPrice TEXT, $payMent TEXT, name TEXT)'),
  //       version: version);
  // }
}
