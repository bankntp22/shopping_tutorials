// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_tutorial1/bottomnvg_screen/model_item.dart';
import 'package:app_tutorial1/constant.dart';
import 'package:flutter/material.dart';

import 'package:app_tutorial1/db/db_sqlite.dart';

class ScreenOrderDetailpd extends StatefulWidget {
  String sCode;


  ScreenOrderDetailpd({
    Key? key,
    this.sCode = "",
  }) : super(key: key);

  @override
  State<ScreenOrderDetailpd> createState() => _ScreenOrderDetailpdState();
}

class _ScreenOrderDetailpdState extends State<ScreenOrderDetailpd> {
  SqlLiteManager db = SqlLiteManager();
  
  List<ModelItem> list = [];
  
  getData (){
  }

  getDataHead(){}

  getDataItem()async{
     List<Map<dynamic,dynamic>> listgetItem = await db.getItem(widget.sCode);
     listgetItem.forEach((row) { 
      String sGetNameProduct = row[Constant.nameProduct];
      String sGetTotalProduct = row[Constant.totalPrice];
      String sGetQty = row[Constant.qtyProduct];
     });
  }

  var divider = SizedBox(child: Divider(thickness: 2,),height: 30,);

   var buttonStyle = TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.bold,
    );

  var buttonStyle1 = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
    );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'รายละเอียดสินค้าที่สั่งซื้อ',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
            ),
            centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.blue.shade200,
            leading: IconButton(
                onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.keyboard_backspace),
            ),
          ),
          body: Container(
            width: double.infinity,
            child: Column(
              children: [
                Container(
                    margin: EdgeInsets.only(top: 15, bottom: 20),
                    child: Text(
                      'สรุปคำสั่งซื้อ ! ',
                      style: buttonStyle,
                    )),
                Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                    child: Card(
                      color: Colors.white70,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(             
                            padding: EdgeInsets.all(8),         
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'ชื่อสินค้า',
                                    style: buttonStyle1,
                                  ),
                                  Container(
                                    height: 100,
                                  )
                                ],
                              ),       
                               
                              Text(
                                'ราคาสินค้า',
                                style: buttonStyle1,
                              ),
                              Text(
                                'จำนวนสินค้า',
                                style: buttonStyle1,
                              ),
                            ],
                          )),
                        ],
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
