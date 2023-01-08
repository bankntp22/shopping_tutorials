import 'package:flutter/material.dart';

import '../history_order.dart';
import '../screenselectproduct.dart';

class MenuList {
  String title;
  String imageUrl;
  Widget pageWidget;

  MenuList(
      {required this.imageUrl, required this.title, required this.pageWidget});
}

List<MenuList> listmenu = [
  MenuList(
      imageUrl: "assets/somtum.png",
      title: "อาหารทั้งหมด",
      pageWidget: Screenselectproduct()),
  MenuList(
      imageUrl: "assets/history-order.png",
      title: "ประวัติการสั่งซื้อ",
      pageWidget: HistoryOrder()),
  // MenuList(imageUrl: "assets/whan.png", title: "ขนมหวาน"),
  // MenuList(imageUrl: "assets/kanom.png", title: "ขนมคบเคี้ยว"),
  // MenuList(imageUrl: "assets/kk.png", title: "เครื่องดื่ม"),
  // MenuList(imageUrl: "assets/kk.png", title: "เครื่องดื่ม"),
];
