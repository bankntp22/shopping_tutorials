import 'package:app_tutorial1/style/font.dart';
import 'package:flutter/material.dart';
import 'package:app_tutorial1/models/foodlist.dart';

class HistoryOrder extends StatefulWidget {
  const HistoryOrder({Key? key}) : super(key: key);

  @override
  _HistoryOrderState createState() => _HistoryOrderState();
}

class _HistoryOrderState extends State<HistoryOrder> {
  List<FoodTest> listfoodadd = [];

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
            leading: IconButton(
              color: Colors.white,
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
              ),
            ),
            title: Text(TextName.textTitle, style: StyleFont.textSizeAppbar),
          ),
          body: Container(
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(
                      top: 10,
                      bottom: 10,
                      left: 5,
                      right: 5,
                    ),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 147, 181, 255),
                      // color: Color.fromARGB(255, 193, 208, 240),

                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Container(
                      margin: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ListView.builder(
                        itemCount: listFoodTest.length,
                        itemBuilder: (context, index) {
                          return Container(
                            height: 65,
                            width: double.infinity,
                            color: Colors.lightBlue,
                            margin: EdgeInsets.only(bottom: 5),
                            padding: EdgeInsets.only(right: 5, left: 5),
                            child: Container(
                              child: Row(
                                children: [
                                  Container(
                                    width: 50,
                                    height: 50,
                                    color: Colors.orangeAccent.shade200,
                                    alignment: Alignment.center,
                                    child: Text(listFoodTest[index]
                                        .price
                                        .toStringAsFixed(0)),
                                  ),
                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.all(5),
                                      height: double.infinity,
                                      color: Colors.white,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(listFoodTest[index].title),
                                          Expanded(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                ElevatedButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      // listFoodTest
                                                      //     .removeAt(index);
                                                      // listfoodadd.insert(
                                                      //   index,
                                                      //   listFoodTest[index],
                                                      // );
                                                      listfoodadd.add(
                                                          listFoodTest[index]);
                                                      listFoodTest.remove(
                                                        listFoodTest[index],
                                                      );
                                                      if (index >= 0 &&
                                                          index <
                                                              listFoodTest
                                                                  .length) {
                                                        var item =
                                                            listFoodTest[index];
                                                      }
                                                    });
                                                  },
                                                  child: Text('ลบ'),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
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
}
