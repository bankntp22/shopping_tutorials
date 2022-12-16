import 'package:app_tutorial1/models/constant.dart';
import 'package:flutter/material.dart';

import 'home.dart';
import 'screenselectproduct.dart';
import 'test.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  

  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: Colors.blueGrey.shade600,),
        scaffoldBackgroundColor: Colors.white70,
        fontFamily: "Gordita"
        ),

      home: Home(),
    );
  }
}


