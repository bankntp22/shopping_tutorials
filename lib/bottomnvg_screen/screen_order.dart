import 'package:app_tutorial1/bottomnvg_screen/model_ordersummary.dart';
import 'package:app_tutorial1/constant.dart';
import 'package:app_tutorial1/db/db_sqlite.dart';
import 'package:app_tutorial1/foodlist.dart';
import 'package:app_tutorial1/home.dart';
import 'package:flutter/material.dart';
import './model_ordersummary.dart';

class ScreenOrder extends StatefulWidget {
  const ScreenOrder({Key? key}) : super(key: key);

  @override
  _ScreenOrderState createState() => _ScreenOrderState();
}

class _ScreenOrderState extends State<ScreenOrder> {
  SqlLiteManager db = SqlLiteManager();

  List<OrderSummary> list = [];

   _getOrderAll() async {
    List<Map<dynamic, dynamic>> listMap = await db.getData();
    listMap.forEach(
      (row) {      
        print(row);
        String sGetPayment = row[Constant.payMent];
        String sGetTotalPrice = row[Constant.totalPrice];
        String sGetCode = row[Constant.code];

        OrderSummary orderSummarymodel = OrderSummary();
        orderSummarymodel.sPayment = sGetPayment;
        orderSummarymodel.sTotal = sGetTotalPrice;
        list.add(orderSummarymodel);
      },
    );
  }

  @override
  void initState() {
    
    super.initState();
  }

 
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return Home();
                    },
                  ));
                },
                icon: Icon(Icons.arrow_back),
              )),
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
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
                          
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        height: 150,
                        
                        width: double.infinity,
                        child: ListView.builder(
                          itemCount: list.length,
                          itemBuilder: (context, index) {
                            return Container(
                              child: Text(list[index].sPayment.toString()),
                            );
                          },),
                      ),
                      Container(
                          padding: const EdgeInsets.all(8),
                          color: Colors.grey.shade400,
                          width: double.infinity,
                          child: const Text(
                            'ราคารวมทั้งหมด',
                            style: TextStyle(fontSize: 17),
                          )),
                      
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        height: 150,
                        
                        width: double.infinity,
                        child: ListView.builder(
                          itemCount: list.length,
                          itemBuilder: (context, index) {
                            return Container(
                              child: Text(list[index].sTotal.toString()),
                            );
                          },),
                      ),
                      
                    ],
                  ),
                ),
                Spacer(),
                ElevatedButton(
                        onPressed: () {
                          _getOrderAll();
                        },
                        child: Text('data'),
                      ),
              ],
            ),
          )),
    );
  }
}
