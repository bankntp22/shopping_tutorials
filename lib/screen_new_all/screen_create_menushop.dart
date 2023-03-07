import 'package:app_tutorial1/provider/provider_menushop.dart';
import 'package:app_tutorial1/style/font.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenCreateMenu extends StatelessWidget {
  const ScreenCreateMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProviderMenu(),
      child: ScreenCreateMenushop(),
    );
  }
}

class ScreenCreateMenushop extends StatelessWidget {
  const ScreenCreateMenushop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back_outlined,
              color: Colors.black,
            ),
          ),
        ),
        body: Container(
          width: double.infinity,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildMenuBox(name: 'สร้างร้านค้า'),
                SizedBox(
                  height: 10,
                ),
                buildMenuBox(name: 'สร้างสินค้า'),
                SizedBox(
                  height: 10,
                ),
                buildMenuBox(name: 'ประเภทสินค้า'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container buildMenuBox({String name = 'ไม่ได้กำหนด', Widget? screen}) {
    return Container(
      width: 300,
      height: 100,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 183, 108, 221),
            Color.fromARGB(255, 140, 87, 167),
          ],
          begin: Alignment.topCenter,
          end: Alignment.center
        ),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 3,
          color: Colors.grey.withOpacity(0.5),
        ),
      ),
      child: Text(
        name,
        style: StyleFont.fontMali(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
