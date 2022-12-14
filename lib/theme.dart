import 'package:flutter/material.dart';

class QadamTheme {
  static Color textColor02 = Color(0xffE8E8E8);
  static Color textColor03 = Color(0xffBDBDBD);
  static Color textColor04 = Color(0xff666666);
  static Color textColor05 = Color.fromRGBO(93, 176, 117, 1);
  static Color textColor06 = Color.fromRGBO(75, 148, 96, 1);
  static Color textColor07 = Color(0xff282c35);

  static TextTheme textTheme = TextTheme(
    bodyText1: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
    headline1: TextStyle(
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    headline2: TextStyle(
      fontSize: 21.0,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
    headline3: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    headline6: TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
  );
  static ThemeData themedata() {
    return ThemeData(
      scaffoldBackgroundColor:textColor07 ,
      brightness: Brightness.dark,
      appBarTheme: AppBarTheme(
        foregroundColor: Colors.white,
        backgroundColor: Colors.grey[900],
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: Colors.white,
        backgroundColor: Colors.green,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Colors.green,
      ),
      textTheme: textTheme,
    );
  }
}
