import 'package:app_tutorial1/models/model_ordersummary.dart';
import 'package:app_tutorial1/bottomnvg_screen/screen_orderdetailpd.dart';
import 'package:app_tutorial1/models/constant.dart';
import 'package:app_tutorial1/db/db_sqlite.dart';
import 'package:app_tutorial1/models/foodlist.dart';
import 'package:app_tutorial1/home.dart';
import 'package:flutter/material.dart';
import '../models/model_ordersummary.dart';

class ScreenOrder extends StatefulWidget {
  @override
  _ScreenOrderState createState() => _ScreenOrderState();
}

class _ScreenOrderState extends State<ScreenOrder> {
  SqlLiteManager db = SqlLiteManager();
  List<OrderSummary> list = [];
  String? sPayment, sTotal;

  _getListSummaryOrder() async {
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
        orderSummarymodel.sCode = sGetCode;
        list.add(orderSummarymodel);
      },
    );
    setState(() {});
  }

  @override
  void initState() {
    _getListSummaryOrder();
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
                        'รายการสั่งซื้อ',
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const Divider(
                        thickness: 2,
                        height: 30,
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                            top: 12, bottom: 12, right: 5, left: 5),
                        width: double.infinity,
                        margin: EdgeInsets.only(bottom: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              sPayment = 'วิธีการชำระเงิน',
                              style: TextStyle(
                                fontSize: 19,
                                color: Colors.grey.shade800,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              sTotal = 'จำนวนเงิน',
                              style: TextStyle(
                                fontSize: 19,
                                color: Colors.grey.shade800,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Column(
                        children: [
                          Container(
                            height: 420,
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                    color: Colors.grey.shade400, width: 3),
                              ),
                            ),
                            child: RefreshIndicator(
                              onRefresh: () async {
                                await Future.delayed(Duration(seconds: 1));
                              },
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: list.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.push(context, MaterialPageRoute(
                                        builder: (context) {
                                          return ScreenOrderDetailpd(
                                            sCode: list[index].sCode,
                                          );
                                        },
                                      ));
                                    },
                                    child: Container(
                                      height: 70,
                                      child: Card(
                                        elevation: 0,
                                        margin: EdgeInsets.only(bottom: 4),
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                list[index]
                                                    .sPayment
                                                    .toString()
                                                    .toUpperCase(),
                                                style: TextStyle(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                "${list[index].sTotal} บาท",
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.w800),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
