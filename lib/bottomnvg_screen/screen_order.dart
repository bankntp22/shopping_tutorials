import 'package:app_tutorial1/home.dart';
import 'package:flutter/material.dart';

class ScreenOrder extends StatefulWidget {
  const ScreenOrder({Key? key}) : super(key: key);

  @override
  _ScreenOrderState createState() => _ScreenOrderState();
}

class _ScreenOrderState extends State<ScreenOrder> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
              leading:
                  IconButton(onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return Home();
                    },));
                  }, icon: Icon(Icons.arrow_back),)),
          backgroundColor: Colors.blueGrey.shade300,
          body: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30))),
            margin: const EdgeInsets.only(top: 15),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Column(
                    children: [
                      const Text(
                        'สรุปคำสั่งซื้อ',
                        style: TextStyle(fontSize: 23),
                      ),
                      const Divider(
                        thickness: 2,
                        height: 30,
                      ),
                      Container(
                          padding: const EdgeInsets.all(8),
                          color: Colors.grey.shade400,
                          width: double.infinity,
                          child: const Text(
                            'วิธีการชำระเงิน',
                            style: TextStyle(fontSize: 17),
                          )),
                      const SizedBox(
                        height: 50,
                      ),
                      Container(
                          padding: const EdgeInsets.all(8),
                          color: Colors.grey.shade400,
                          width: double.infinity,
                          child: const Text(
                            'ราคารวมทั้งหมด',
                            style: TextStyle(fontSize: 17),
                          )),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
