import 'package:flutter/material.dart';


class ScreenAccount extends StatefulWidget {
  const ScreenAccount({ Key? key }) : super(key: key);

  @override
  _ScreenAccountState createState() => _ScreenAccountState();
}

class _ScreenAccountState extends State<ScreenAccount> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Text('PAGE 1'),
        ),
      ),
    );
  }
}