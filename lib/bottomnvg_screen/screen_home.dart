import 'package:app_tutorial1/bottomnvg_screen/screen_order.dart';
import 'package:app_tutorial1/history_order.dart';
import 'package:app_tutorial1/models/foodlist.dart';
import 'package:app_tutorial1/style/font.dart';
import 'package:flutter/material.dart';

import '../models/menu_list.dart';
import '../screenselectproduct.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  _ScreenHomeState createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 100,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.blueAccent.shade400,
                          Colors.blueGrey.shade500,
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 70,
                      right: 27,
                      left: 27,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    width: double.infinity,
                    height: 300,
                    padding: EdgeInsets.all(15),
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(15),
                      child: Column(
                        children: [
                          // GridView.builder(
                          //   itemCount: listmenu.length,
                          //   gridDelegate:
                          //       SliverGridDelegateWithFixedCrossAxisCount(
                          //     crossAxisCount: 2,

                          //   ),
                          //   itemBuilder: (context, index) {
                          //     return Container(
                          //       width: 50,
                          //       height: 50,
                          //       color: Colors.blue,
                          //     );
                          //   },
                          // ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) {
                                            return Screenselectproduct();
                                          },
                                        ),
                                      );
                                    },
                                    child: Container(
                                      width: 65,
                                      height: 65,
                                      decoration: BoxDecoration(
                                        color: Colors.grey.withOpacity(0.10),
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          width: 2,
                                          color: Colors.grey.shade200,
                                        ),
                                      ),
                                      child: Image.asset('assets/somtum.png'),
                                    ),
                                  ),
                                  Text(
                                    'เมนู',
                                    style: StyleFont.fontMali(
                                      letter: 2.5,
                                      size: 15,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Column(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) {
                                                return HistoryOrder();
                                              },
                                            ),
                                          );
                                        },
                                        child: Container(
                                          width: 65,
                                          height: 65,
                                          padding: EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                            color:
                                                Colors.grey.withOpacity(0.10),
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              width: 2,
                                              color: Colors.grey.shade200,
                                            ),
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(37),
                                            child: Image.asset(
                                              "assets/history-order.png",
                                            ),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        'ประวัติ',
                                        style: StyleFont.fontMali(
                                          letter: 2.5,
                                          size: 15,
                                          color: Colors.black54,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) {
                                            return ScreenOrder();
                                          },
                                        ),
                                      );
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(5),
                                      width: 65,
                                      height: 65,
                                      decoration: BoxDecoration(
                                        color: Colors.grey.withOpacity(0.10),
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          width: 2,
                                          color: Colors.grey.shade200,
                                        ),
                                      ),
                                      child: Image.asset("assets/order.png"),
                                    ),
                                  ),
                                  Text(
                                    'ออเดอร์',
                                    style: StyleFont.fontMali(
                                      letter: 2.5,
                                      size: 15,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ],
                              ),
                              // Row(
                              //   children: [
                              //     Column(
                              //       children: [
                              //         Container(
                              //           width: 65,
                              //           height: 65,
                              //           decoration: BoxDecoration(
                              //             color: Colors.grey.withOpacity(0.10),
                              //             shape: BoxShape.circle,
                              //           ),
                              //         ),
                              //         Text('ออเดอร์'),
                              //       ],
                              //     )
                              //   ],
                              // ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 385,
                      right: 27,
                      left: 27,
                    ),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    width: double.infinity,
                    height: 250,
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Text(
                                'อาหารสุดพิเศษ ! ',
                                style: StyleFont.fontMali(
                                  color: Colors.grey.shade700,
                                  letter: 1.5,
                                ),
                              ),
                              StyleFont.useSizeBox(
                                height: 5,
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    Image.asset(
                                      'assets/breakfast.png',
                                      height: 70,
                                      width: 150,
                                      fit: BoxFit.cover,
                                    ),
                                    Image.asset(
                                      'assets/kanom.png',
                                      height: 70,
                                      width: 150,
                                      fit: BoxFit.cover,
                                    ),
                                    Image.asset(
                                      'assets/padkraplao.png',
                                      height: 70,
                                      width: 150,
                                      fit: BoxFit.cover,
                                    ),
                                  ],
                                ),
                              ),
                              StyleFont.useSizeBox(
                                height: 5,
                              ),
                              Text(
                                'อาหารโปรโมชั่น ! ',
                                style: StyleFont.fontMali(
                                  color: Colors.grey.shade700,
                                  letter: 1.5,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        // body: Container(
        //   margin: EdgeInsets.symmetric(vertical: 30),
        //   child: GridView.builder(
        //     itemCount: listmenu.length,
        //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        //         crossAxisCount: 2),
        //     itemBuilder: (context, index) {
        //       return Column(
        //         children: [
        //           GestureDetector(
        //             onTap: () {
        //               Navigator.push(
        //                   context,
        //                   MaterialPageRoute(
        //                       builder: (context) =>
        //                           listmenu[index].pageWidget));
        //             },
        //             child: Container(
        //               padding: EdgeInsets.all(10),
        //               decoration: BoxDecoration(
        //                 borderRadius: BorderRadius.circular(13),
        //                 color: Colors.white,
        //                 border: Border.all(
        //                   color: Colors.grey.shade500.withOpacity(0.2),
        //                   width: 5,
        //                 ),
        //               ),
        //               width: 160,
        //               height: 130,
        //               // height: 165,
        //               child: Column(
        //                 mainAxisAlignment: MainAxisAlignment.center,
        //                 children: [
        //                   ClipRRect(
        //                       borderRadius: BorderRadius.circular(14),
        //                       child: Image.asset(
        //                         listmenu[index].imageUrl,
        //                         fit: BoxFit.cover,
        //                         width: 90,
        //                         height: 90,
        //                       )),
        //                 ],
        //               ),
        //             ),
        //           ),
        //           Text(
        //             listmenu[index].title,
        //             style: StyleFont.fontMali(
        //               size: 17,
        //               fontWeight: FontWeight.bold,
        //               color: Colors.black.withOpacity(0.5),
        //             ),
        //           ),
        //         ],
        //       );
        //     },
        //   ),
        // ),
      ),
    );
  }
}
