import 'package:app_tutorial1/models/constant.dart';
import 'package:app_tutorial1/models/foodlist.dart';
import 'package:app_tutorial1/style/font.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'screen_cart.dart';

class Screenselectproduct extends StatefulWidget {
  const Screenselectproduct({Key? key}) : super(key: key);

  @override
  _ScreenselectproductState createState() => _ScreenselectproductState();
}

class _ScreenselectproductState extends State<Screenselectproduct> {
  double dTotalall = 0;
  double dRemovetotal = 0;
  double temptotalprice = 0;
  int iLimitPriceMax = 2000;
  double totalprice = 0;
  double dTotalScreen = 0;
  int qtySum = 0;
  String number = '';
  int i = 0;
  String eieina = '';

  sumTotalPrice() {
    for (int i = 0; i < foodlist.length; i++) {
      double totalprice = 0;
      int iQty = 0;
      totalprice = foodlist[i].total;
      iQty = foodlist[i].qty;
      dTotalall = totalprice + dTotalall;
      qtySum = qtySum + iQty;
      // if(qtySum == 0){
      //   foodlist[i].total = 0;
      //   foodlist[i].qty = 0;
      // }
    }
    setState(() {});
  }

  String formatNumber(int number) {
    var formatter = NumberFormat('#,###.##');
    if (number < 0) {
      formatter = NumberFormat('#,###.##');
    } else if (number > 0) {
      formatter = NumberFormat('#,###.00');
    }
    return formatter.format(number);
  }

  // format() {
  //   number = formatNumber(
  //     dTotalall.toInt(),
  //   );
  // eieina = number;
  // }

  nextScreenCart(BuildContext context) {
    List<Food> listfoodselect = getfoodselect();
    if (listfoodselect.length == 0) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              'ขออภัย !',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'คุณต้องเลือกอาหารหรือสินค้าก่อน',
                  style: TextStyle(fontSize: 18),
                )
              ],
            ),
          );
        },
      );
    } else {
      Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return ScreenCart(
            foodlistone: listfoodselect,
            
          );
        },
      ));
    }
  }

  List<Food> getfoodselect() {
    List<Food> listfoodselect = [];
    for (int i = 0; i < foodlist.length; i++) {
      int qty = foodlist[i].qty;
      if (qty > 0) {
        listfoodselect.add(foodlist[i]);
      }
    }
    return listfoodselect;
  }

  // sumQty() {
  //   for (int i = 0; i < foodlist.length; i++) {
  //     int sumqty = 0;
  //     sumqty = foodlist[i].qty;
  //     qtySum = sumqty + qtySum;   
  //   }
  // }

  @override
  void initState() {
    sumTotalPrice();
    // sumQty();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Color.fromARGB(255, 63, 106, 141),
              elevation: 1,
              title: Text(
                'อาหารทั้งหมด',
                style: StyleFont.fontGoogleMali,
              ),
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  )),
              actions: [
                Stack(
                  children: [
                    if (qtySum > 0)
                      Container(
                        width: 20,
                        height: 20,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                        child: Text(
                          '$qtySum',
                          style: const TextStyle(color: Colors.black),
                        ),
                      ),
                    IconButton(
                        onPressed: () => nextScreenCart(context),
                        icon: const Icon(Icons.shopping_cart)),
                  ],
                )
              ],
            ),
            body: Container(
              color: Colors.grey.shade300,
              child: Column(
                children: [
                  Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade800,
                        border: Border.all(color: Colors.white, width: 3)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('เมนูทั้งหมด ',
                            style: StyleFont.fontMali(size: 20)),
                        Text('ราคารวม : ${formatNumber(dTotalall.toInt())} ',
                            style: StyleFont.fontMali(
                              size: 22,
                              fontWeight: FontWeight.bold,
                            )),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    child: Container(
                      height: 580,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: foodlist.length,
                        itemBuilder: (context, index) {
                          return Container(
                              // margin: const EdgeInsets.symmetric(
                              //   horizontal: 5,
                              // ),
                              height: 205,
                              width: double.infinity,
                              child: Column(
                                children: [
                                  Card(
                                    shape: ShapeBorder.lerp(
                                        OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.grey.shade400,
                                              width: 5),
                                        ),
                                        OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.grey.shade400,
                                              width: 5),
                                        ),
                                        5),
                                    elevation: 0,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Container(
                                              width: 140,
                                              height: 180,
                                              child: Image.asset(
                                                foodlist[index].imageUrl,
                                                fit: BoxFit.cover,
                                              )),
                                          SizedBox(width: StyleTheme.bg),
                                          Expanded(
                                              child: Container(
                                            margin: const EdgeInsets.symmetric(
                                              vertical: 6,
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      foodlist[index].title,
                                                      style: StyleFont.fontMali(
                                                        color: Colors.black,
                                                        size: 19,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                    if (foodlist[index].qty > 0)
                                                      Chip(
                                                          backgroundColor:
                                                              Colors.greenAccent
                                                                  .shade700,
                                                          label: Row(
                                                            children: [
                                                              const Icon(
                                                                Icons.check,
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                              const Text(
                                                                'เลือกสินค้าแล้ว',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white),
                                                              ),
                                                            ],
                                                          ))

                                                    // IconButton(
                                                    //     splashRadius: 20,
                                                    //     splashColor: Colors.grey,
                                                    //     onPressed: () {
                                                    //       nextScreenCart(
                                                    //           foodlist, context);
                                                    //     },
                                                    //     icon: const Icon(
                                                    //         Icons.shopping_cart))
                                                    // if (foodlist[index].amount > 0)
                                                    //   IconButton(
                                                    //       splashRadius: 15,
                                                    //       onPressed: () {
                                                    //         setState(() {
                                                    //           foodlist[index].amount =
                                                    //               0;
                                                    //           foodlist[index].total = 0;

                                                    //           dTotalall = dTotalall -
                                                    //               foodlist[index]
                                                    //                   .total1;
                                                    //         });
                                                    //       },
                                                    //       icon: const Icon(
                                                    //           Icons.restart_alt))
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  'ราคา:   ${foodlist[index].price}',
                                                  style: StyleFont.fontMali(
                                                      color: Colors.black,
                                                      size: 16),
                                                ),
                                                const Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 6,
                                                      vertical: 20),
                                                  child: SizedBox(
                                                    height: 3,
                                                    child: Divider(
                                                      thickness: 2,
                                                    ),
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    IconButton(
                                                        splashRadius: 15,
                                                        splashColor:
                                                            Colors.greenAccent,
                                                        onPressed: () {
                                                          // addQty();

                                                          if (mounted) {
                                                            setState(() {
                                                              qtySum++;

                                                              temptotalprice =
                                                                  dTotalall +
                                                                      foodlist[
                                                                              index]
                                                                          .price;

                                                              if (temptotalprice <=
                                                                  2000) {
                                                                dTotalall =
                                                                    temptotalprice;

                                                                foodlist[index]
                                                                    .qty++;

                                                                foodlist[index]
                                                                    .total = foodlist[
                                                                            index]
                                                                        .total +
                                                                    foodlist[
                                                                            index]
                                                                        .price;

                                                                // totalprice =
                                                                //     dTotalall;
                                                              } else {
                                                                showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (context) {
                                                                    return AlertDialog(
                                                                      shape: RoundedRectangleBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(16)),
                                                                      title:
                                                                          const Text(
                                                                        'ขออภัย!',
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                20,
                                                                            fontWeight:
                                                                                FontWeight.bold),
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                      ),
                                                                      content:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.min,
                                                                        children: [
                                                                          const Text(
                                                                            'คุณไม่สามารถสั่งอาหารเกินราคา 2000 ได้',
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                          ),
                                                                          const SizedBox(
                                                                            height:
                                                                                10,
                                                                          ),
                                                                          Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.end,
                                                                            children: [
                                                                              Container(
                                                                                width: 80,
                                                                                height: 40,
                                                                                child: ElevatedButton(
                                                                                    onPressed: () {
                                                                                      Navigator.pop(context);
                                                                                    },
                                                                                    child: const Text('OK')),
                                                                              ),
                                                                            ],
                                                                          )
                                                                        ],
                                                                      ),
                                                                    );
                                                                  },
                                                                );
                                                              }
                                                            });
                                                          }

                                                          foodlist[index]
                                                                  .total1 =
                                                              foodlist[index]
                                                                  .total;
                                                        },
                                                        icon: const Icon(
                                                          Icons.add,
                                                          size: 30,
                                                        )),
                                                    const SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text(
                                                      foodlist[index]
                                                          .qty
                                                          .toString(),
                                                      style: const TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                    if (foodlist[index].qty > 0)
                                                      Row(
                                                        children: [
                                                          IconButton(
                                                            splashRadius: 15,
                                                            splashColor: Colors
                                                                .redAccent,
                                                            onPressed: () {
                                                              setState(() {
                                                                qtySum--;
                                                                foodlist[index]
                                                                    .qty--;

                                                                // result = foodlist[index].amount -foodlist[index]
                                                                //         .price;
                                                                foodlist[index]
                                                                    .total = foodlist[
                                                                            index]
                                                                        .total -
                                                                    foodlist[
                                                                            index]
                                                                        .price;

                                                                dTotalall = dTotalall -
                                                                    foodlist[
                                                                            index]
                                                                        .price;
                                                              });
                                                              dRemovetotal =
                                                                  dTotalall;
                                                            },
                                                            icon: const Icon(
                                                              Icons.remove,
                                                              size: 30,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    const Spacer(),
                                                    Text(
                                                      'รวม : ${foodlist[index].total.toStringAsFixed(0)} ',
                                                      style: StyleFont.fontMali(
                                                          color: Colors.black,
                                                          size: 15),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          )),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ));
                        },
                      ),
                    ),
                  ),
                ],
              ),
            )));
  }
}
