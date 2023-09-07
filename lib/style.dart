import 'package:flutter/material.dart';

const Color white = Color.fromARGB(255, 255, 255, 255);
const Color whiteBlack = Color.fromARGB(255, 198, 196, 196);
const Color black = Color.fromARGB(255, 0, 0, 0);
const Color blue = Color.fromARGB(255, 30, 94, 255);
const Color green = Color.fromARGB(255, 38, 255, 30);
const Color baseColor = Color.fromARGB(255, 255, 154, 30);
const Color appBarBackground = Color.fromARGB(255, 42, 255, 244);
const Color cardTopColor = Color.fromARGB(255, 0, 203, 254);
const Color cardBottomColor = Color.fromARGB(255, 254, 54, 54);
const Color cardTicketSideColor = Color.fromARGB(255, 255, 255, 255);
const Color cardTicketTextColor = Color.fromARGB(255, 255, 255, 255);

const Color gradation1 = Color.fromARGB(255, 63, 136, 253);
const Color gradation2 = Color.fromARGB(255, 200, 255, 47);

class Styles {
  static Color textColor = const Color(0xFF3b3b3b);
  static TextStyle textStyle =
      TextStyle(fontSize: 16, color: textColor, fontWeight: FontWeight.w500);
  static TextStyle hedLineStyle1 =
      TextStyle(fontSize: 26, color: textColor, fontWeight: FontWeight.bold);
  static TextStyle hedLineStyle2 =
      TextStyle(fontSize: 21, color: textColor, fontWeight: FontWeight.bold);
  static TextStyle hedLineStyle3 = TextStyle(
      fontSize: 17, color: Colors.grey.shade500, fontWeight: FontWeight.bold);
  static TextStyle hedLineStyle4 = TextStyle(
      fontSize: 14, color: Colors.grey.shade500, fontWeight: FontWeight.w500);
  static TextStyle restStyle =
      TextStyle(fontSize: 12, color: black, fontWeight: FontWeight.w500);

  static TextStyle cardTextStyle1 = TextStyle(
      color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.bold);

  static TextStyle cardTextStyle2 =
      TextStyle(color: Colors.white, fontSize: 15.0);
  static TextStyle cardTextStyle3 = TextStyle(
      color: Colors.white, fontSize: 12.0, fontWeight: FontWeight.bold);
  static TextStyle cardTextStyle4 =
      TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold);

  static LinearGradient cardColor = LinearGradient(
      begin: FractionalOffset.topLeft,
      end: FractionalOffset.bottomRight,
      colors: [
        gradation1.withOpacity(0.6),
        gradation2.withOpacity(0.6),
      ],
      stops: const [
        0.0,
        1.0,
      ]);

  static BoxDecoration cardDecoration = BoxDecoration(
    color: white,
    borderRadius: BorderRadius.circular(10),
    gradient: Styles.cardColor,
    boxShadow: [
      Styles.shadowCard,
    ],
  );
  static BoxDecoration attendanceListDecoration = BoxDecoration(
    color: white,
    borderRadius: BorderRadius.circular(10),
    boxShadow: [
      Styles.shadowCard,
    ],
  );

  static BoxShadow shadowCard = BoxShadow(
    color: whiteBlack, // シャドウの色
    spreadRadius: 2, // シャドウの拡がり具合
    blurRadius: 5, // シャドウのぼかし具合
    offset: Offset(0, 3), // シャドウの位置
  );
}
