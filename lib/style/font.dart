import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StyleTheme {
  static final Color bgColor = Colors.blueGrey.shade400;
  static double bg = 16.0;
}

class StyleFont {
  static var textSizeAppbar = TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.bold,
  );

  static var fontGoogleKrub = GoogleFonts.krub(fontSize: 23);
  static var fontGoogleMali =
      GoogleFonts.mali(fontSize: 23, fontWeight: FontWeight.bold);
  static var fontGoogleMali1 =
      GoogleFonts.mali(fontSize: 16, fontWeight: FontWeight.bold);
  static var fontGoogleMaliUnBold = GoogleFonts.mali(
    fontSize: 17,
  );
  static var fontGoogleMaliSize25 = GoogleFonts.mali(
    fontSize: 25,
  );
  static var fontGoogleMaliSize20 = GoogleFonts.mali(
    fontSize: 18,
  );

  static TextStyle fontMali(
      {double size = 17,
      Color color = Colors.white,
      FontWeight? fontWeight,
      double? letter}) {
    return GoogleFonts.mali(
      fontSize: size,
      color: color,
      fontWeight: fontWeight,
      letterSpacing: letter,
    );
  }

  static Text buttonTextName(String name) => Text(
        name,
        style: StyleFont.fontMali(size: 22),
      );
}

class ContainerStyle {
  static styleContainer(Widget widget, Color color,
      {EdgeInsets? margin, EdgeInsets? padding}) {
    return Container(
      child: widget,
      color: color,
      margin: margin,
      padding: padding,
    );
  }
}
