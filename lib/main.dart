import 'package:app_tutorial1/models/constant.dart';
import 'package:app_tutorial1/models/foodlist.dart';
import 'package:app_tutorial1/test/activity_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
          scaffoldBackgroundColor:
              Colors.white24.withOpacity(0.8),
          fontFamily: "Gordita"),
      // home: ActivityScreen(),
      home: Home(),
    );
  }
}
