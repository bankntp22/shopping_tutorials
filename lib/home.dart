import 'package:app_tutorial1/foodlist.dart';
import 'package:app_tutorial1/screen_cart.dart';
import 'package:flutter/material.dart';

import 'bottomnvg_screen/screen_account.dart';

import 'bottomnvg_screen/screen_home.dart';
import 'bottomnvg_screen/screen_order.dart';
import 'menu_list.dart';
import 'screenselectproduct.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  static List<Widget> listMenu = [ScreenHome(), ScreenOrder(), ScreenAccount()];

  void _updatedIndex(int value) {
    setState(() {
      _currentIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white70,
      // appBar: AppBar(
      //   title: Text('หมวดหมู่อาหาร'),
      //   elevation: 1,
      //   centerTitle: true,
      //   leading: Icon(Icons.person),
      //   backgroundColor: Colors.transparent,
      //   actions: [
      //     IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart))
      //   ],
      // ),
      body: listMenu.elementAt(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.amber[800],
        backgroundColor: Colors.white,
        onTap: _updatedIndex,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'ORDER'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_balance_wallet), label: 'Accounting'),
        ],
      ),
    ));
  }
}

class MenuFood extends StatelessWidget {
  const MenuFood({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return Screenselectproduct();
              },
            ));
          },
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.blueGrey.shade700),
            margin: EdgeInsets.only(
              top: 10,
              right: 10,
              left: 10,
            ),
            width: 140,
            height: 140,
            child: Column(
              children: [Expanded(child: Image.asset('assets/breakfast.png'))],
            ),
          ),
        ),
        Text(
          'อาหาร',
          style: Theme.of(context).textTheme.headline6,
        )
      ],
    );
  }
}
