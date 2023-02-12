// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_tutorial1/style/font.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:app_tutorial1/bottomnvg_screen/screen_orderdetailpd.dart';
import 'package:app_tutorial1/db/db_sqlite.dart';
import 'package:app_tutorial1/home.dart';
import 'package:app_tutorial1/models/constant.dart';
import 'package:app_tutorial1/models/foodlist.dart';
import 'package:app_tutorial1/models/model_ordersummary.dart';

import '../models/model_ordersummary.dart';

class ScreenOrder extends StatefulWidget {
  @override
  _ScreenOrderState createState() => _ScreenOrderState();
}

class _ScreenOrderState extends State<ScreenOrder> {
  SqlLiteManager db = SqlLiteManager();
  List<OrderSummary> list = [];

  String iCodeOrder = '';
  Map<String, dynamic> map = Map<String, dynamic>();

  String? sPayment, sTotal;
  var _selectedValue;

  var sGetStatusComplete;

  Future<List<Map<String, dynamic>>> _getListSummaryOrder() async {
    List<Map<String, dynamic>> listMap = await db.getDataNoStatusOrder();
    listMap.forEach(
      (row) {
        String sGetPayment = row[Constant.payMent];
        String sGetTotalPrice = row[Constant.totalPrice];
        String sGetCode = row[Constant.code];

        OrderSummary orderSummarymodel = OrderSummary();
        orderSummarymodel.sPayment = sGetPayment;
        orderSummarymodel.dTotal = sGetTotalPrice;
        orderSummarymodel.sCode = sGetCode;
        list.insert(0, orderSummarymodel);
      },
    );
    if (mounted) {
      setState(() {});
    }
    return listMap;
  }

  getDataTableHead(String sCode) async {
    List<Map<dynamic, dynamic>> listGetdata = await db.getOrder(sCode);
    listGetdata.forEach((row) {
      print(row);
    });
  }

  // getDataStatus (String sCode)async {
  //   List<Map<String,Object?>> listGet = await db.queryDataStatusOrder(sCode);
  //   listGet.forEach((row) {
  //     print(row);
  //    });
  // }

  String formatNumber(double number) {
    var formatter = NumberFormat('#,###.##');
    if (number < 0) {
      formatter = NumberFormat('#,###.##');
    } else if (number > 0) {
      formatter = NumberFormat('#,###.##');
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

  Future<int> updateRecordComplete(String code) async {
    int iresult = 0;
    map[Constant.statusOrder] = Constant.completeOrder;
    print('Confirm');
    iresult = await db.updateData(map, code);
    return iresult;
  }

  Future<int> updateRecordCancel(String code) async {
    map[Constant.statusOrder] = Constant.cancelOrder;
    print('Cancel');

    return db.updateData(map, code);
  }

  Future<int> insertRecordComplete(String code) async {
    Map<String, Object> map = Map<String, Object>();

    map[Constant.statusOrder] = Constant.completeOrder;
    print('Confirm');
    return db.insertDataStatusOrder(map);
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
            title: Text(
              'รายการสั่งซื้อ',
              style: StyleFont.fontMali(size: 25, fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
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
                size: 25,
                color: Colors.white,
              ),
            ),
          ),
          // backgroundColor: Color.fromARGB(255, 26, 140, 192),
          backgroundColor: Color.fromARGB(255, 63, 106, 141),
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
                      const Divider(
                        thickness: 2,
                        height: 20,
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
                              style: StyleFont.fontMali(
                                size: 19,
                                color: Colors.grey.shade700,
                              ),
                            ),
                            Text(
                              sTotal = 'จำนวนเงิน',
                              style: StyleFont.fontMali(
                                size: 19,
                                color: Colors.grey.shade700,
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
                            child: listviewOrder(),
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

  listviewOrder() {
    return list.length > 0
        ? ListView.builder(
            shrinkWrap: true,
            itemCount: list.length,
            itemBuilder: (context, index) {
              // String sConvert = list[index].dTotal;
              double pi = double.parse(list[index].dTotal);
              iCodeOrder = list[index].sCode;
              double axs = double.parse(pi.toStringAsFixed(0));

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
                  getDataTableHead(list[index].sCode);
                },
                child: Container(
                  height: 110,
                  child: Card(
                    elevation: 0,
                    color: Color.fromARGB(255, 186, 192, 211),
                    // color: Color.fromARGB(255, 201, 235, 235),
                    // color: Color.fromARGB(255, 255, 193, 101),
                    margin: EdgeInsets.only(bottom: 6),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  list[index].sPayment.toString().toUpperCase(),
                                  style: StyleFont.fontMali(
                                    size: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Text(
                                "\$ ${formatNumber(axs)}  ",
                                style: StyleFont.fontMali(
                                  size: 19,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              // Container(
                              //   height: 50,
                              //   child: DropdownButton<String>(
                              //       value: _selectedValue,
                              //       icon: Icon(Icons.more_horiz),
                              //       isDense: true,
                              //       onChanged:
                              //           (String? newValue) {
                              //         setState(() {
                              //           showDialog(
                              //             context: context,
                              //             builder: (context) {
                              //               return AlertDialog(
                              //                 title: Text(
                              //                   'คุณแน่ใจที่จะ ',
                              //                   textAlign:
                              //                       TextAlign
                              //                           .center,
                              //                 ),
                              //                 content: Text(
                              //                   newValue
                              //                       .toString(),
                              //                 ),
                              //               );
                              //             },
                              //           );
                              //         });
                              //       },
                              //       items: [
                              //         DropdownMenuItem(
                              //           value: 'ยกเลิก',
                              //           child: Container(
                              //             width: 50,
                              //             child: Text(
                              //               'ยกเลิก',
                              //               style: TextStyle(
                              //                 color: Colors
                              //                     .redAccent,
                              //                 fontWeight:
                              //                     FontWeight.bold,
                              //               ),
                              //             ),
                              //           ),
                              //         ),
                              //         DropdownMenuItem(
                              //           value:
                              //               'แน่ใจที่จะรับสินค้า',
                              //           child: Container(
                              //             width: 50,
                              //             child: Text(
                              //               'รับสินค้า',
                              //               style: TextStyle(
                              //                 fontWeight:
                              //                     FontWeight.bold,
                              //               ),
                              //             ),
                              //           ),
                              //         ),
                              //       ]),
                              // ),
                            ],
                          ),
                          Spacer(),
                          buttonConfirmandCancelOrder(
                            indexCode: list[index].sCode,
                            updateConfirm: () async {
                              await updateRecordComplete(list[index].sCode);
                            },
                            updateCancel: () =>
                                updateRecordCancel(list[index].sCode),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          )
        : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'ไม่มีรายการที่กำลังสั่งซื้อ',
                style: StyleFont.fontMali(size: 20, color: Colors.black),
              ),
            ],
          );
  }
}

class buttonConfirmandCancelOrder extends StatefulWidget {
  String indexCode = '';

  Function updateConfirm;
  Function updateCancel;
  buttonConfirmandCancelOrder({
    Key? key,
    required this.indexCode,
    required this.updateConfirm,
    required this.updateCancel,
  }) : super(key: key);

  @override
  State<buttonConfirmandCancelOrder> createState() =>
      _buttonConfirmandCancelOrderState();
}

class _buttonConfirmandCancelOrderState
    extends State<buttonConfirmandCancelOrder> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Text(
                'ออเดอร์ ${widget.indexCode}',
                style:
                    StyleFont.fontMali(size: 16, fontWeight: FontWeight.w500),
              ),
            ),
            Row(
              children: [
                ElevatedButton.icon(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Color.fromARGB(255, 10, 212, 54))),
                  onPressed: () async {
                    await showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text(
                            'คุณยืนยันที่จะรับสินค้า ? ',
                            textAlign: TextAlign.center,
                          ),
                          content: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                    Colors.greenAccent.shade700,
                                  ),
                                ),
                                onPressed: () async {
                                  await widget.updateConfirm();

                                  Navigator.pop(context);
                                },
                                child: Text('ยืนยัน'),
                              ),
                              SizedBox(
                                width: 7,
                              ),
                              ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                    Colors.redAccent.shade700,
                                  ),
                                ),
                                onPressed: () {},
                                child: Text('ยกเลิก'),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                    setState(() {});
                  },
                  icon: Icon(Icons.check),
                  label: Text(
                    'รับสินค้า',
                    style: TextStyle(fontSize: 17),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                ElevatedButton.icon(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Color.fromARGB(255, 255, 72, 72))),
                  onPressed: () {
                    setState(() {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text(
                              'คุณแน่ใจที่จะลบออเดอร์นี้  ? ',
                              textAlign: TextAlign.center,
                            ),
                            content: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                      Colors.greenAccent.shade700,
                                    ),
                                  ),
                                  onPressed: () {
                                    widget.updateCancel();
                                    Navigator.pop(context);
                                  },
                                  child: Text('ยืนยัน'),
                                ),
                                SizedBox(
                                  width: 7,
                                ),
                                ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                      Colors.redAccent.shade700,
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: Text('ยกเลิก'),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    });
                  },
                  icon: Icon(Icons.cancel),
                  label: Text('ยกเลิก', style: TextStyle(fontSize: 17)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
