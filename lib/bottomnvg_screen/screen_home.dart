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
          margin: EdgeInsets.symmetric(vertical: 30),
          child: GridView.builder(
            itemCount: listmenu.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (context, index) {
              return Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  listmenu[index].pageWidget));
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.white54,
                      ),
                      width: 160,
                      height: 130,
                      // height: 165,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(14),
                              child: Image.asset(
                                listmenu[index].imageUrl,
                                fit: BoxFit.cover,
                                width: 90,
                                height: 90,
                              )),
                        ],
                      ),
                    ),
                  ),
                  Text(listmenu[index].title,
                      style: StyleFont.fontMali(
                          size: 19,
                          fontWeight: FontWeight.bold,
                          color: Colors.black))
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
