import 'package:app_tutorial1/models/foodlist.dart';
import 'package:app_tutorial1/screen_cart.dart';
import 'package:app_tutorial1/screen_new_all/screen_profile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'bottomnvg_screen/screen_account.dart';

import 'bottomnvg_screen/screen_home.dart';
import 'bottomnvg_screen/screen_order.dart';
import 'models/menu_list.dart';
import 'screenselectproduct.dart';

class Home extends StatefulWidget {
  int screenIndex = 0;

  Home({
    this.screenIndex = 0,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static List<Widget> listMenu = [
    // ScreenHome(),
    // ScreenOrder(),
    // ScreenAccount(updatedIndex(0))
  ];

  void updatedIndex(int value) {
    setState(() {
      widget.screenIndex = value;
    });
  }

  Color get getContainer {
    return Colors.blueAccent.shade400;
  }

  @override
  void initState() {
    listMenu = [
      ScreenHome(),
      ScreenOrder(),
      ProfileScreen(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Colors.white70,
        // backgroundColor: Color(0xFFF424242),
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
        body: listMenu.elementAt(widget.screenIndex),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: Colors.grey.shade400,
              ),
            ),
          ),
          child: NavigationBar(
            height: 65,
            // selectedItemColor: Colors.black,
            backgroundColor: Colors.white,

            elevation: 5,
            onDestinationSelected: (value) {
              setState(() {
                widget.screenIndex = value;
              });
            },
            selectedIndex: widget.screenIndex,
            // onTap: updatedIndex,
            // currentIndex: widget.screenIndex,
            destinations: const [
              NavigationDestination(
                  icon: Icon(
                    Icons.home_rounded,
                    color: Colors.blueAccent,
                  ),
                  label: 'Home'),
              NavigationDestination(
                  icon: Icon(Icons.mark_as_unread, color: Colors.blueAccent),
                  label: 'ORDER'),
              NavigationDestination(
                  icon: Icon(Icons.person, color: Colors.blueAccent),
                  label: 'Profile'),
            ],
          ),
        ),
      ),
    );
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
              children: [
                Expanded(
                  child: Image.asset('assets/breakfast.png'),
                ),
              ],
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
