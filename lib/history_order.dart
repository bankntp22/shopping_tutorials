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
            backgroundColor: Colors.white,
            centerTitle: true,
            elevation: 0,
            leading: IconButton(
              color: Colors.black,
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
              ),
            ),
          ),
          body: Container(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.greenAccent,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                    ),
                    gradient: LinearGradient(
                      colors: [
                        Colors.greenAccent.shade700,
                        Colors.green.shade400,
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'ประวัติการสั่งซื้อ',
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 250,
                  margin:
                      EdgeInsets.only(top: 15, bottom: 15, left: 10, right: 10),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 193, 240, 195),
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
                                                        index < listFoodTest.length) {
                                                      var item = listFoodTest[index];
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
                Container(
                  height: 250,
                  margin:
                      EdgeInsets.only(top: 15, bottom: 15, left: 10, right: 10),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 193, 240, 195),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Container(
                    margin: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ListView.builder(
                      itemCount: listfoodadd.length,
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
                                                    listFoodTest.remove(
                                                      listFoodTest[index],
                                                    );
                                                    listfoodadd.add(
                                                        listFoodTest[index]);
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
