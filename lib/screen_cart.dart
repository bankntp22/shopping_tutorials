import 'package:app_tutorial1/home.dart';
import 'package:app_tutorial1/style/font.dart';
import 'package:flutter/material.dart';

import 'bottomnvg_screen/screen_order.dart';
import 'models/constant.dart';
import 'db/db_sqlite.dart';
import 'models/foodlist.dart';
import './screenselectproduct.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class ScreenCart extends StatefulWidget {
  List<Food> foodlistone;

  ScreenCart({required this.foodlistone});

  @override
  _ScreenCartState createState() => _ScreenCartState();
}

class _ScreenCartState extends State<ScreenCart> {
  double dtotal = 0;
  String? payMent;
  int iQty = 0;

  SqlLiteManager db = SqlLiteManager();

  final payMentQR = "QR ชำระเงิน";
  final payMentCash = 'เงินสด';
  final payMentCreditCard = "บัตรเครดิต/บัตรเดบิต";

  final paymenyTypeQR = 'qrcode';
  final paymentTypeCash = 'cash';
  final paymentTypeCreditCard = 'creditcard';

  getData() async {
    List<Map> listMap = await db.getData();
  }

  sumTotalPrice() {
    for (int i = 0; i < widget.foodlistone.length; i++) {
      double totalprice = 0;
      totalprice = widget.foodlistone[i].total;
      dtotal += totalprice;
    }
  }

  sumqtyScreenCart() {
    for (int i = 0; i < widget.foodlistone.length; i++) {
      int qty = 0;
      qty = widget.foodlistone[i].qty;
      iQty = qty + iQty;
    }
  }

  defaultPayment() {
    setState(() {
      payMent = paymentTypeCash;
    });
  }

  Future<int> _insertItem() async {
    int result = 0;
    String sCode = await getCodeHead();
    for (int i = 0; i < widget.foodlistone.length; i++) {
      String nameProduct = widget.foodlistone[i].title;
      String priceProduct = widget.foodlistone[i].price.toString();
      String qtyProduct = widget.foodlistone[i].qty.toString();
      String totalPriceProduct = widget.foodlistone[i].total.toString();

      Map<String, dynamic> map = {
        Constant.nameProduct: nameProduct,
        Constant.priceProduct: priceProduct,
        Constant.qtyProduct: qtyProduct,
        Constant.totalPriceProduct: totalPriceProduct,
        Constant.codeHead: sCode
      };

      result = await db.insertItem(map);
    }
    return result;
  }

  Future<int> _insertHead() async {
    String sCode = await getCodeHead();
    String sTotal = dtotal.toString();

    Map<String, dynamic> map = {
      Constant.totalPrice: sTotal,
      Constant.payMent: payMent,
      Constant.code: sCode
    };

    return await db.insertHead(map);
  }

  saveTransaction() async {
    int result = 0;
    result = await _insertItem();
    if (result > 0) {
      result = await _insertHead();
    }
    if (result > 0) {}
  }

  Future<String> getCodeHead() async {
    List<Map> listMap = await db.getLastCode();
    String sCode = "1000";
    if (listMap.isNotEmpty) {
      Map map = listMap[0];
      sCode = map[Constant.code];
      int iCode = int.parse(sCode);
      iCode = iCode + 1;
      sCode = iCode.toString();
    }
    return sCode;
  }

  @override
  void initState() {
    sumTotalPrice();
    getData();
    defaultPayment();
    sumqtyScreenCart();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('ตะกร้าสินค้า', style: StyleFont.fontGoogleMali),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 63, 106, 141),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(8),
          padding: const EdgeInsets.only(
            top: 15,
            right: 2,
            left: 2,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 15),
                    child: Column(
                      children: [
                        Container(
                          color: Colors.grey.shade300,
                          width: double.infinity,
                          padding: EdgeInsets.only(
                              top: 7, bottom: 7, right: 7, left: 15),
                          child: Text(
                            'รายการสินค้าที่สั่งซื้อ',
                            style: StyleFont.fontMali(
                                size: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    height: 300,
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          width: 2,
                          color: Colors.grey.shade400,
                        ),
                        bottom: BorderSide(
                          width: 2,
                          color: Colors.grey.shade400,
                        ),
                      ),
                    ),
                    child: widget.foodlistone.isNotEmpty
                        ? ListView.builder(
                            shrinkWrap: true,
                            itemCount: widget.foodlistone.length,
                            itemBuilder: (context, index) {
                              return Card(
                                  child: ListTile(
                                leading: Container(
                                  width: 50,
                                  height: 50,
                                  color: Colors.blueGrey,
                                  child: Image.asset(
                                    widget.foodlistone[index].imageUrl,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                title: Text(
                                  widget.foodlistone[index].title,
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                                tileColor: Colors.white24,
                                mouseCursor: MouseCursor.defer,
                                subtitle: Text(
                                  "ราคา :  ${widget.foodlistone[index].price.toString()}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                trailing: Column(
                                  children: [
                                    Text(
                                      "จำนวน : ${widget.foodlistone[index].qty}",
                                    ),
                                    const Spacer(),
                                    Text(
                                        "รวม : ${widget.foodlistone[index].total.toStringAsFixed(0)}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6),
                                  ],
                                ),
                              ));
                            },
                          )
                        : const Center(
                            child: Text(
                            'ไม่มีสินค้าที่เลือกลงตะกร้า',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: [
                      Column(
                        children: [
                          Container(
                            color: Colors.grey.shade300,
                            width: double.infinity,
                            padding: EdgeInsets.only(
                                top: 7, bottom: 7, right: 7, left: 15),
                            child: Text(
                              'วิธีการชำระเงิน',
                              style: StyleFont.fontMali(
                                  size: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                      RadioListTile(
                          title: Text(
                            payMentCash,
                            style: StyleFont.fontMali(
                                size: 15, color: Colors.black),
                          ),
                          value: paymentTypeCash,
                          groupValue: payMent,
                          onChanged: (value) {
                            setState(() {
                              payMent = value.toString();
                            });
                          }),
                      RadioListTile(
                          title: Text(payMentQR,
                              style: StyleFont.fontMali(
                                  size: 15, color: Colors.black)),
                          value: paymenyTypeQR,
                          groupValue: payMent,
                          onChanged: (value) {
                            setState(() {
                              payMent = value.toString();
                            });
                          }),
                      RadioListTile(
                          title: Text(payMentCreditCard,
                              style: StyleFont.fontMali(
                                  size: 15, color: Colors.black)),
                          value: paymentTypeCreditCard,
                          groupValue: payMent,
                          onChanged: (value) {
                            setState(() {
                              payMent = value.toString();
                            });
                          }),
                      const SizedBox(
                        height: 5,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.greenAccent.shade700,
                              minimumSize: const Size(double.infinity, 50)),
                          onPressed: () {
                            // ignore: curly_braces_in_flow_control_structures
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                    title: Text(
                                      'ยืนยันที่จะสั่งซื้ออาหารจำวนเงิน ${dtotal.toStringAsFixed(0)} ใช่หรือไม่ ?',
                                      style:
                                          Theme.of(context).textTheme.headline6,
                                    ),
                                    content: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              primary:
                                                  Colors.greenAccent.shade700,
                                            ),
                                            onPressed: () {
                                              saveTransaction();

                                              // Navigator.push(context,
                                              //     MaterialPageRoute(
                                              //   builder: (context) {
                                              //     return Home(
                                              //       screenIndex: 1,
                                              //     );
                                              //   },
                                              // ));
                                              Navigator.pushAndRemoveUntil(
                                                  context, MaterialPageRoute(
                                                builder: (context) {
                                                  return Home(
                                                    screenIndex: 1,
                                                  );
                                                },
                                              ), (route) => false);
                                            },
                                            child: const Text('OK')),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                primary: Colors.redAccent),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text('Cancel')),
                                      ],
                                    ));
                              },
                            );
                          },
                          child: Text(
                            'ORDER NOW (${dtotal.toStringAsFixed(0)}) บาท',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          ))
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }

  buildRadioPayment() {
    return [
      RadioListTile(
          title: Text(payMentQR),
          value: payMentQR,
          groupValue: payMent,
          onChanged: (value) {
            setState(() {
              payMent = value.toString();
            });
          }),
      RadioListTile(
          title: Text(payMentCash),
          value: payMentCash,
          groupValue: payMent,
          onChanged: (value) {
            setState(() {
              payMent = value.toString();
            });
          }),
      RadioListTile(
          title: Text(
            payMentCreditCard,
          ),
          value: payMentCreditCard,
          groupValue: payMent,
          onChanged: (value) {
            setState(() {
              payMent = value.toString();
            });
          }),
    ];
  }

  buildButtonOrderNow() {
    return [
      ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: Colors.greenAccent.shade700,
            minimumSize: const Size(double.infinity, 50)),
        onPressed: () {
          if (payMent == null) {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                    title: Text(
                      'ขออภัย!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.redAccent, fontWeight: FontWeight.bold),
                    ),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'คุณต้องเลือก วิธีการชำระเงินก่อนถึงจะสั่งซื้ออาหารได้',
                          style: TextStyle(fontSize: 19),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.greenAccent.shade700),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('OK')),
                          ],
                        ),
                      ],
                    ));
              },
            );
          } else
            // ignore: curly_braces_in_flow_control_structures
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                    title: Text(
                      'ยืนยันที่จะสั่งซื้ออาหารจำวนเงิน ${dtotal.toStringAsFixed(0)} ใช่หรือไม่ ?',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    content: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.greenAccent.shade700,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                              setState(() {});
                            },
                            child: const Text('OK')),
                        const SizedBox(
                          width: 5,
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.redAccent),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Cancel')),
                      ],
                    ));
              },
            );
        },
        child: Text(
          'ORDER NOW (${dtotal.toStringAsFixed(0)}) บาท',
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
        ),
      ),
    ];
  }
}

Widget buttonOrderNow(BuildContext context, double total, Function insert) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: Colors.greenAccent.shade700,
          minimumSize: Size(double.infinity, 50)),
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
                title: Text(
                  'ยืนยันที่จะสั่งซื้ออาหารจำวนเงิน ${total.toStringAsFixed(0)} ใช่หรือไม่ ?',
                  style: Theme.of(context).textTheme.headline6,
                ),
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.greenAccent.shade700,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                          insert();
                        },
                        child: Text('OK')),
                    SizedBox(
                      width: 5,
                    ),
                    ElevatedButton(
                        style:
                            ElevatedButton.styleFrom(primary: Colors.redAccent),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Cancel')),
                  ],
                ));
          },
        );
      },
      child: Text(
        'ORDER NOW',
        style: TextStyle(fontWeight: FontWeight.bold),
      ));
}
