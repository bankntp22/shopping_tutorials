import 'package:flutter/material.dart';

import 'widget_formfield/textformfield.dart';

class ScreenAccount extends StatefulWidget {
  // Function function;

  // ScreenAccount(this.function);
  @override
  _ScreenAccountState createState() => _ScreenAccountState();
}

Column TextFormfield(String name) {
  return Column(
    children: [
      TextFormField(
        decoration: InputDecoration(
          isDense: true,
          hintText: name,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: Colors.green,
              width: 2,
            ),
          ),
        ),
      ),
      SizedBox(
        height: 5,
      )
    ],
  );
}

class _ScreenAccountState extends State<ScreenAccount> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white70,
        appBar: AppBar(
          title: Text(
            'กรอกข้อมูล',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          // actions: [
          //   IconButton(
          //     onPressed: () {},
          //     icon: Icon(Icons.save,color: Colors.black,),
          //   ),
          // ],
        ),
        body: Textformfield(),
      ),
    );
  }
}
