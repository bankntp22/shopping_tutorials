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
        // appBar: AppBar(
        //   leading: Container(),
        //   actions: [
        //     IconButton(
        //       onPressed: () {},
        //       icon: Icon(
        //         Icons.shop,
        //       ),
        //     ),
        //     IconButton(
        //       onPressed: () {},
        //       icon: Icon(
        //         Icons.restart_alt,
        //       ),
        //     ),
        //   ],
        // ),
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
                    child: Image.network(
                      'https://media.istockphoto.com/id/1086859056/th/%E0%B9%80%E0%B8%A7%E0%B8%84%E0%B9%80%E0%B8%95%E0%B8%AD%E0%B8%A3%E0%B9%8C/%E0%B9%81%E0%B8%9A%E0%B8%99%E0%B9%80%E0%B8%99%E0%B8%AD%E0%B8%A3%E0%B9%8C%E0%B9%81%E0%B8%99%E0%B8%A7%E0%B8%99%E0%B8%AD%E0%B8%99%E0%B8%9E%E0%B8%A3%E0%B9%89%E0%B8%AD%E0%B8%A1%E0%B8%A0%E0%B8%B2%E0%B8%9E%E0%B8%9B%E0%B8%A3%E0%B8%B0%E0%B8%81%E0%B8%AD%E0%B8%9A%E0%B8%81%E0%B8%B2%E0%B8%A3%E0%B9%8C%E0%B8%95%E0%B8%B9%E0%B8%99%E0%B8%A3%E0%B8%B0%E0%B8%9A%E0%B8%B2%E0%B8%A2%E0%B8%AA%E0%B8%B5%E0%B8%82%E0%B8%AD%E0%B8%87%E0%B8%AD%E0%B8%B2%E0%B8%AB%E0%B8%B2%E0%B8%A3%E0%B8%8D%E0%B8%B5%E0%B9%88%E0%B8%9B%E0%B8%B8%E0%B9%88%E0%B8%99%E0%B8%9E%E0%B8%A3%E0%B9%89%E0%B8%AD%E0%B8%A1%E0%B8%82%E0%B9%89%E0%B8%B2%E0%B8%A7%E0%B9%81%E0%B8%A5%E0%B8%B0%E0%B8%9B%E0%B8%A5%E0%B8%B2%E0%B9%81%E0%B8%8B%E0%B8%A5%E0%B8%A1%E0%B8%AD%E0%B8%99%E0%B8%9A%E0%B8%99%E0%B8%88%E0%B8%B2%E0%B8%99-%E0%B9%81%E0%B8%A1.jpg?s=1024x1024&w=is&k=20&c=8BkeJGAdw6xaC2tSJm6ZkwKlfVLQzsOkWB7xpE-w0EM=',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 50,
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
                                      size: 14,
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w600,
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
                                          size: 14,
                                          color: Colors.black54,
                                          fontWeight: FontWeight.w600,
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
                                      size: 14,
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w600,
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
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    width: double.infinity,
                    height: 220,
                    child: Container(
                      child: Column(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'อาหารสุดพิเศษ ! ',
                                style: StyleFont.fontMali(
                                  color: Colors.grey.shade600,
                                  letter: 1.5,
                                  fontWeight: FontWeight.bold,
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
                                      width: 270,
                                      fit: BoxFit.cover,
                                    ),
                                    Image.asset(
                                      'assets/kanom.png',
                                      height: 70,
                                      width: 270,
                                      fit: BoxFit.cover,
                                    ),
                                    Image.asset(
                                      'assets/padkraplao.png',
                                      height: 70,
                                      width: 270,
                                      fit: BoxFit.cover,
                                    ),
                                  ],
                                ),
                              ),
                              // StyleFont.useSizeBox(
                              //   height: 10,
                              // ),
                              // Text(
                              //   'อาหารโปรโมชั่น ! ',
                              //   style: StyleFont.fontMali(
                              //     color: Colors.grey.shade700,
                              //     letter: 1.5,
                              //   ),
                              // ),
                              // SizedBox(
                              //   height: 10,
                              // ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    'See all',
                                  ),
                                ],
                              )
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
