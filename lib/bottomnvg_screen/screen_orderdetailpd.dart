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

  String? _selectedValue;

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
    fontSize: 25,
    fontWeight: FontWeight.bold,
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
              '?????????????????????????????????????????????????????????????????????????????????',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
            ),
            centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.blue.shade200,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.keyboard_backspace),
            ),
            actions: [
              Container(
                height: 50,
                margin: EdgeInsets.only(right: 15, top: 5, left: 5, bottom: 5),
                child: DropdownButton<String>(
                  value: _selectedValue,
                  icon: Icon(
                    Icons.more_horiz,
                    size: 40,
                    color: Colors.black,
                  ),
                  isDense: true,
                  onChanged: (String? newValue) {
                    setState(() {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text(
                              '??????????????????????????????????????? ',
                              textAlign: TextAlign.center,
                            ),
                            content: Text(
                              newValue.toString(),
                            ),
                          );
                        },
                      );
                    });
                  },
                  items: [
                    DropdownMenuItem(
                      value: '??????????????????',
                      child: Container(
                        width: 50,
                        child: Text(
                          '??????????????????',
                          style: TextStyle(
                            color: Colors.redAccent,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    DropdownMenuItem(
                      value: '?????????????????????????????????????????????????????????',
                      child: Container(
                        width: 50,
                        child: Text(
                          '???????????????????????????',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          body: RefreshIndicator(
            onRefresh: _refresh,
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.all(10),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    color: Colors.amber.shade200,
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(8),
                    child: Text(
                      '?????????????????????????????????????????? ! ',
                      style: buttonStyle,
                    ),
                  ),
                  Column(
                    children: [
                      TypeOrder(),
                      listviewOrder(),
                    ],
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('?????????????????????????????????????????? 2 ????????????????????????'),
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
                              Colors.greenAccent.shade200,
                              Colors.green.shade400
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        '?????????????????????????????????????????????????????????????????????',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
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

  Container listviewOrder() {
    return Container(
      padding: EdgeInsets.only(left: 20, top: 5, bottom: 5, right: 20),
      height: 300,
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          listItem[index].sQty.toString(),
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ],
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
              )
            ],
          );
        },
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
            '????????????',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '???????????????',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '?????????????????????',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
