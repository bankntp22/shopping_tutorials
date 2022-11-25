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
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Text('สรุปคำสั่งซื้อ',style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),),
                  Divider(color: Colors.black,thickness: 1,),
                  SizedBox(height: 10,),
                  Container(
                    height: 200,
                    color: Colors.amber,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('วิธีการจ่ายเงิน'),
                        Text('ราคารวมสินค้า'),
                        
                      ],
                    )),
                  
                  
                ],
              ),

            ),
          ],
        )
      ),
    );
  }
}