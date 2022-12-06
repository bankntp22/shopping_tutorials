import 'package:app_tutorial1/db/db_sqlite.dart';
import 'package:flutter/material.dart';

class ScreenOrderDetailpd extends StatelessWidget {
  SqlLiteManager db = SqlLiteManager();
  

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
                              Text(
                                'ชื่อสินค้า',
                                style: buttonStyle1,
                              ),        
                              divider,                 
                              Text(
                                'ราคาสินค้า',
                                style: buttonStyle1,
                              ),
                              divider,
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
