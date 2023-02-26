import 'package:app_tutorial1/db/db_sqlite.dart';
import 'package:app_tutorial1/models/constant.dart';
import 'package:app_tutorial1/models/model_ordersummary.dart';
import 'package:app_tutorial1/style/font.dart';
import 'package:flutter/material.dart';
import 'package:app_tutorial1/models/foodlist.dart';

class HistoryOrder extends StatefulWidget {
  const HistoryOrder({Key? key}) : super(key: key);

  @override
  _HistoryOrderState createState() => _HistoryOrderState();
}

class _HistoryOrderState extends State<HistoryOrder> {
  List<OrderSummary> listfoodadd = [];

  SqlLiteManager db = SqlLiteManager();

  void getDataHistory() async {
    List<Map<String, dynamic>> getlist = await db.getDataHistoryOrder();
    getlist.forEach((row) {
      String sGetPayment = row[Constant.payMent];
      String sGetTotalPrice = row[Constant.totalPrice];
      String sGetCode = row[Constant.code];
      String sGetStatus = row[Constant.statusOrder] ?? "";

      OrderSummary orderSummarymodel = OrderSummary();
      orderSummarymodel.sPayment = sGetPayment;
      orderSummarymodel.dTotal = sGetTotalPrice;
      orderSummarymodel.sCode = sGetCode;
      orderSummarymodel.sStatus = sGetStatus;
      listfoodadd.insert(0, orderSummarymodel);
    });
    setState(() {});
  }

  @override
  void initState() {
    getDataHistory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xFFF311b92),
            centerTitle: true,
            elevation: 0,
            actions: [Icon(Icons.more_vert)],
            leading: IconButton(
              color: Colors.white,
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
              ),
            ),
            title: Text(
              TextName.textTitle,
              style: StyleFont.fontMali(
                  color: Colors.white, size: 23, fontWeight: FontWeight.w500),
            ),
          ),
          body: Container(
            margin: EdgeInsets.symmetric(vertical: 2),
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    height: 450,
                    child: listfoodadd.length > 0
                        ? ListView.builder(
                            itemCount: listfoodadd.length,
                            itemBuilder: (context, i) {
                              return _buildContainerListtile(
                                listfoodadd[i].sCode,
                                listfoodadd[i].sPayment,
                                listfoodadd[i].sStatus,
                              );
                            },
                          )
                        : Container(
                            width: double.infinity,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'ไม่มีรายการ',
                                  style: StyleFont.fontMali(
                                      size: 28,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column _buildContainerListtile(String sName, String sCode, String sStatus) {
    return Column(
      children: [
        Container(
          height: 90,
          decoration: BoxDecoration(
            border: Border.all(
              width: 3,
              color: Color.fromARGB(255, 224, 224, 224),
            ),
          ),
          child: Card(
            color: Color.fromARGB(255, 109, 101, 226).withOpacity(0.9),
            margin: EdgeInsets.all(0),
            child: ListTile(
              dense: true,
              leading: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.fastfood,
                      size: 30,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
              title: Container(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  "เลขที่ : ${sName}",
                  style: StyleFont.fontMali(
                      size: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
              ),
              subtitle: Container(
                padding: EdgeInsets.only(top: 15),
                height: 55,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      sCode,
                      style: StyleFont.fontMali(
                        size: 17,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              trailing: Column(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: sStatus == Constant.completeOrder
                              ? Text(
                                  'CONFIRM',
                                  style: StyleFont.fontMali(
                                    color: Colors.greenAccent,
                                    fontWeight: FontWeight.w800,
                                    size: 18,
                                  ),
                                )
                              : Container(
                                  child: Text(
                                    'CANCEL',
                                    style: StyleFont.fontMali(
                                      color: Colors.redAccent,
                                      fontWeight: FontWeight.w800,
                                      size: 18,
                                    ),
                                  ),
                                ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
