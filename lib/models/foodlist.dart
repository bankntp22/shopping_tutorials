import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextName {
  static String textTitle = 'ประวัติการสั่งซื้อ';
}

class StyleFont {
  static var textSizeAppbar = TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.bold,
  );

  
  
  static var fontGoogleKrub = GoogleFonts.krub(fontSize: 23);
  static var fontGoogleMali = GoogleFonts.mali(fontSize: 23,fontWeight: FontWeight.bold);
  static var fontGoogleMali1 = GoogleFonts.mali(fontSize: 16,fontWeight: FontWeight.bold);
  static var fontGoogleMaliUnBold = GoogleFonts.mali(fontSize: 17,);
  static var fontGoogleMaliSize25 = GoogleFonts.mali(fontSize: 25,);
  static var fontGoogleMaliSize20 = GoogleFonts.mali(fontSize: 18,);

  static TextStyle fontMali ({double size = 17,Color color = Colors.white,FontWeight? fontWeight}){
    return GoogleFonts.mali(fontSize: size,color: color,fontWeight: fontWeight);
  }
}

class WidgetButton {
  static Text buttonTextName(String name) => Text(name,style: StyleFont.fontMali(size: 22),);
  
}

class Food {
  String title;
  int price;
  int qty;
  String imageUrl;
  double total;
  double total1;
  Food(
      {required this.title,
      required this.price,
      required this.qty,
      required this.imageUrl,
      required this.total,
      required this.total1});
}

List<Food> foodlist = [
  Food(
      title: 'ส้มตำ',
      price: 100,
      qty: 0,
      imageUrl: "assets/somtum.png",
      total: 0,
      total1: 0),
  Food(
      title: 'ลาบ',
      price: 70,
      qty: 0,
      imageUrl: "assets/lap.png",
      total: 0,
      total1: 0),
  Food(
      title: 'น้ำตก1',
      price: 45,
      qty: 0,
      imageUrl: "assets/namtok.png",
      total: 0,
      total1: 0),
  Food(
      title: 'น้ำตก2',
      price: 80,
      qty: 0,
      imageUrl: "assets/namtok.png",
      total: 0,
      total1: 0),
  Food(
      title: 'น้ำตก3',
      price: 110,
      qty: 0,
      imageUrl: "assets/namtok.png",
      total: 0,
      total1: 0),
];

class FoodTest {
  String title;
  int price;
  int qty;
  String imageUrl;
  double total;
  double total1;
  FoodTest(
      {required this.title,
      required this.price,
      required this.qty,
      required this.imageUrl,
      required this.total,
      required this.total1});
}

List<FoodTest> listFoodTest = [];
