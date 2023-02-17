import 'package:app_tutorial1/models/foodlist.dart';
import 'package:app_tutorial1/style/font.dart';
import 'package:flutter/material.dart';

import 'widget_formfield/textformfield.dart';

class ScreenAccount extends StatefulWidget {
  Function function;

  ScreenAccount(this.function);
  @override
  _ScreenAccountState createState() => _ScreenAccountState();
}



class _ScreenAccountState extends State<ScreenAccount> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 63, 106, 141),
        appBar: AppBar(
          title: Text(
            'กรอกข้อมูล',
            style: StyleFont.fontGoogleMali,
          ),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 63, 106, 141),

          elevation: 0,
          // actions: [
          //   IconButton(
          //     onPressed: () {},
          //     icon: Icon(Icons.save,color: Colors.black,),
          //   ),
          // ],
        ),
        body: Textformfield(widget.function),
      ),
    );
  }
}
