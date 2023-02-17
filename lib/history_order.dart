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
    List<Map<String, dynamic>> getlist =
        await db.getDataNoStatusOrder('is not null or');
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
            backgroundColor: Color.fromARGB(255, 63, 106, 141),
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
            color: Colors.grey.shade300.withOpacity(0.9),
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.blueGrey.shade200.withOpacity(0.9),
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
                                  ),
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
          child: Card(
            elevation: 2,
            child: ListTile(
              leading: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.fastfood,
                      size: 30,
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
                    color: Colors.grey.shade700,
                  ),
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
                        color: Colors.greenAccent.shade700,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              trailing: Column(
                children: [
                  Chip(
                    backgroundColor: sStatus == Constant.completeOrder
                        ? Colors.greenAccent.shade700
                        : Colors.redAccent.shade700,
                    label: Text(
                      sStatus,
                      style: sStatus == Constant.completeOrder
                          ? StyleFont.fontMali(
                              size: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            )
                          : StyleFont.fontMali(
                              size: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
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
