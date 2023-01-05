import 'package:app_tutorial1/models/model_ordersummary.dart';
import 'package:app_tutorial1/bottomnvg_screen/screen_orderdetailpd.dart';
import 'package:app_tutorial1/models/constant.dart';
import 'package:app_tutorial1/db/db_sqlite.dart';
import 'package:app_tutorial1/models/foodlist.dart';
import 'package:app_tutorial1/home.dart';
import 'package:flutter/material.dart';
import '../models/model_ordersummary.dart';
import 'package:intl/intl.dart';

class ScreenOrder extends StatefulWidget {
  @override
  _ScreenOrderState createState() => _ScreenOrderState();
}

class _ScreenOrderState extends State<ScreenOrder> {
  SqlLiteManager db = SqlLiteManager();
  List<OrderSummary> list = [];

  String? sPayment, sTotal;

  var _selectedValue;

  _getListSummaryOrder() async {
    List<Map<dynamic, dynamic>> listMap = await db.getData();

    listMap.forEach(
      (row) {
        String sGetPayment = row[Constant.payMent];
        String sGetTotalPrice = row[Constant.totalPrice];
        String sGetCode = row[Constant.code];

        OrderSummary orderSummarymodel = OrderSummary();
        orderSummarymodel.sPayment = sGetPayment;
        orderSummarymodel.dTotal = sGetTotalPrice;
        orderSummarymodel.sCode = sGetCode;

        list.add(orderSummarymodel);
      },
    );
    if (mounted) {
      setState(() {});
    }
  }

  String formatNumber(double number) {
    var formatter = NumberFormat('#,###.##');
    if (number < 0) {
      formatter = NumberFormat('#,###.##');
    } else if (number > 0) {
      formatter = NumberFormat('#,###.00');
    }
    return formatter.format(number);
  }

  String get stringColorRed {
    String fontRed = 'ยกเลิก';
    Text(
      fontRed,
      style: TextStyle(color: Colors.red),
    );

    return fontRed;
  }

  @override
  void initState() {
    _getListSummaryOrder();
    // listSwap();
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Home();
                    },
                  ),
                );
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ),
          ),
          backgroundColor: Colors.lightBlue,
          body: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(25),
                topLeft: Radius.circular(25),
              ),
            ),
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
                        color: Colors.white,
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
                                color: Colors.grey.shade700,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              sTotal = 'จำนวนเงิน',
                              style: TextStyle(
                                fontSize: 19,
                                color: Colors.grey.shade700,
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
                                  color: Colors.white,
                                  width: 3,
                                ),
                              ),
                            ),
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: list.length,
                              itemBuilder: (context, index) {
                                // String sConvert = list[index].dTotal;
                                double pi = double.parse(list[index].dTotal);

                                double axs =
                                    double.parse(pi.toStringAsFixed(0));

                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return ScreenOrderDetailpd(
                                            sCode: list[index].sCode,
                                          );
                                        },
                                      ),
                                    );
                                  },
                                  child: Container(
                                    height: 70,                                  
                                    child: Card(
                                      elevation: 0,
                                      color: Color.fromARGB(255, 201, 235, 235),
                                      margin: EdgeInsets.only(bottom: 4),
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                list[index]
                                                    .sPayment
                                                    .toString()
                                                    .toUpperCase(),
                                                style: TextStyle(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 30,
                                            ),
                                            Text(
                                              "${formatNumber(axs)} ",
                                              style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.w800,
                                              ),
                                            ),
                                            DropdownButton<String>(                                                
                                              value: _selectedValue,
                                              icon: Icon(Icons.more_horiz),                                                                                           
                                              onChanged: (String? newValue) {
                                                setState(() {
                                                  showDialog(
                                                    context: context,
                                                    builder: (context) {
                                                      return AlertDialog(
                                                        content: Text(
                                                            'คุณต้องการจะลบ ออเดอร์นี้ใช่หรือไม่'),
                                                      );
                                                    },
                                                  );
                                                });
                                              },
                                              items: [
                                                stringColorRed,
                                                'ได้รับสินค้า',
                                              ].map<DropdownMenuItem<String>>(
                                                  (String value) {
                                                return DropdownMenuItem<String>(
                                                  value: value,
                                                  child: Text(
                                                    value,
                                                    style: TextStyle(
                                                      color: Colors.red,
                                                    ),
                                                  ),
                                                );
                                              }).toList(),
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
