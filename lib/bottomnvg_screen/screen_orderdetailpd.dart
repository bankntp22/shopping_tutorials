// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_tutorial1/models/model_head.dart';
import 'package:app_tutorial1/models/model_item.dart';
import 'package:app_tutorial1/models/constant.dart';
import 'package:flutter/material.dart';

import 'package:app_tutorial1/db/db_sqlite.dart';

class ScreenOrderDetailpd extends StatefulWidget {
  String sCode;

  ScreenOrderDetailpd({
    Key? key,
    this.sCode = "",
  }) : super(key: key);

  @override
  State<ScreenOrderDetailpd> createState() => _ScreenOrderDetailpdState();
}

class _ScreenOrderDetailpdState extends State<ScreenOrderDetailpd> {
  SqlLiteManager db = SqlLiteManager();

  List<ModelItem> listItem = [];
  ModelHead mModelHead = ModelHead();

  bool _isRefreshing = false;

  String? selectedValue;

  String? get selected {
    selectedValue = selectStatusOrder.keys.first;
    return selectedValue;
  }

  defaultSelectStatus() {
    setState(() {
      selectedValue = selectStatusOrder.values.first;
    });
  }

  Future<void> _refresh() async {
    setState(() {
      _isRefreshing = true;
    });

    // Simulate a network request
    await Future.delayed(Duration(seconds: 2));
  }

  getData() {
    getDataHead();
    getDataItem();
    defaultSelectStatus();
    setState(() {});
  }

  getDataHead() async {
    List<Map<dynamic, dynamic>> listgetDataHead = await db.getOrder(
      widget.sCode,
    );
    setState(
      () {
        listgetDataHead.forEach(
          (row) {
            String sGetTotalPrice = row[Constant.totalPrice];
            String sGetPayment = row[Constant.totalPrice];
            String sGetCode = row[Constant.code];

            mModelHead.sTotalPrice = sGetTotalPrice;
            mModelHead.sPayMent = sGetPayment;
            mModelHead.sCode = sGetCode;
          },
        );
      },
    );
    // for(int i = 0;i < listgetDataHead.length;i++){
    //   Map map = listgetDataHead[i];
    //   String sCode = map[Constant.code];

    // }
  }

  getDataItem() async {
    List<Map<dynamic, dynamic>> listgetItem = await db.getItem(widget.sCode);
    listgetItem.forEach(
      (row) {
        String sGetNameProduct = row[Constant.nameProduct];
        String sGetTotalProduct = row[Constant.totalPriceProduct];
        String sGetQty = row[Constant.qtyProduct];

        ModelItem sGetModelItem = ModelItem();
        sGetModelItem.sNameProduct = sGetNameProduct;
        sGetModelItem.sTotalPriceProduct = sGetTotalProduct;
        sGetModelItem.sQty = sGetQty;
        listItem.add(sGetModelItem);
      },
    );
  }

  List<DropdownMenuItem> get SelectStatusOrder {
    List<DropdownMenuItem> listselectStatus =
        ['รับสินค้า', 'ยกเลิก'].map<DropdownMenuItem<String>>((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList();
    return listselectStatus;
  }

  Map<String, String> selectStatusOrder = <String, String>{
    'Confirmed': 'รับสินค้า',
    'Cancel': 'ยกเลิก',
  };

  @override
  void initState() {
    getData();
    super.initState();
  }

  var divider = SizedBox(
    child: Divider(
      thickness: 2,
    ),
    height: 30,
  );

  var buttonStyle = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w600,
  );

  var buttonStyle1 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'รายละเอียดสินค้า',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
            ),
            centerTitle: true,
            elevation: 0,
            backgroundColor: Color.fromARGB(255, 63, 106, 141),
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.keyboard_backspace),
            ),
          ),
          body: RefreshIndicator(
            onRefresh: _refresh,
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.all(7),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    color: Colors.amber.shade200,
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(8),
                    child: Text('สรุปคำสั่งซื้อ ! ',
                        style: TextStyle(
                            fontSize: 23, color: Colors.grey.shade800)),
                  ),
                  Column(
                    children: [
                      TypeOrder(),
                      listviewOrder(),
                      SizedBox(
                        height: 10,
                      ),
                      buttonDropdownSelectedStatusOrder()
                    ],
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      if (selectedValue != null)
                        showDialog(
                          context: context,
                          builder: (context) {
                            String textResult = resultText();
                            return AlertDialog(
                              title: Text(
                                '$textResult ${selectedValue} \nออเดอร์นี้',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: selectedValue == 'รับสินค้า'
                                      ? Colors.green
                                      : Colors.red,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              content: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.greenAccent.shade400)),
                                    onPressed: () {},
                                    child: Text(
                                      'ยืนยัน',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  TextButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.redAccent.shade200)),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      'ยกเลิก',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                    },
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                              Colors.greenAccent.shade400,
                              Colors.green.shade400
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        'ยืนยันการสั่งซื้อสินค้า',
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  String resultText() {
    String textResult = '';
    if (selectedValue == 'รับสินค้า') {
      textResult = 'คุณยืนยันที่จะ ';
    } else {
      textResult = 'คุณแน่ใจที่จะ';
    }
    return textResult;
  }

  Container listviewOrder() {
    return Container(
      padding: EdgeInsets.only(left: 20, top: 5, bottom: 5, right: 20),
      height: 350,
      color: Colors.black12,
      child: ListView.builder(
        itemCount: listItem.length,
        itemBuilder: (context, index) {
          double dTotalprice =
              double.parse(listItem[index].sTotalPriceProduct.toString());
          return Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: Text(
                      listItem[index].sNameProduct.toString(),
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: EdgeInsets.only(left: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            listItem[index].sQty.toString(),
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 7,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          '${dTotalprice.toStringAsFixed(0)}',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }

  Container buttonDropdownSelectedStatusOrder() {
    return Container(
      padding: EdgeInsets.all(6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              height: 50,
              child: Text(
                'สถานะ ออเดอร์ : ',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              )),
          Container(
            color: Colors.grey.shade300,
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: DropdownButton<String>(
              value: selectedValue,
              iconSize: 40,
              style: TextStyle(fontSize: 17, color: Colors.black),
              onChanged: (String? newValue) {
                setState(() {
                  selectedValue = newValue;
                  print(selectedValue);
                });
              },
              items: selectStatusOrder.values
                  .map<DropdownMenuItem<String>>((String item) {
                return DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                    ));
              }).toList(),
              selectedItemBuilder: (BuildContext context) {
                return selectStatusOrder.values.map<Widget>((String item) {
                  return Container(
                    alignment: Alignment.centerLeft,
                    constraints: const BoxConstraints(minWidth: 100),
                    child: Text(
                      item,
                      style: const TextStyle(color: Colors.black),
                    ),
                  );
                }).toList();
              },
            ),
          ),
        ],
      ),
    );
  }

  Container TypeOrder() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(color: Colors.blue.shade200),
      padding: EdgeInsets.only(left: 25, top: 5, bottom: 5, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'ชื่อ',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'จำนวน',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'ราคารวม',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
