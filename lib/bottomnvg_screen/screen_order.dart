import 'package:flutter/material.dart';


class ScreenOrder extends StatefulWidget {
  const ScreenOrder({ Key? key }) : super(key: key);

  @override
  _ScreenOrderState createState() => _ScreenOrderState();
}

class _ScreenOrderState extends State<ScreenOrder> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        
        body: Container(
          color: Colors.amberAccent,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            
            children: [
              Center(
                child: Container(
                  child: Text('สรุปคำสั่งซื้อ'),
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}