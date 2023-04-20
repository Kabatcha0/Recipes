import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:recipes_app/shared/style/style.dart';

ThemeData light = ThemeData(
  appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle.dark),
  backgroundColor: Colors.black,
  primarySwatch: Colors.orange,
  scaffoldBackgroundColor: Colors.white,
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Style.background,
      unselectedItemColor: Colors.grey[700]),
  textTheme: const TextTheme(),
);
ThemeData dark = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.black,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.light),
    backgroundColor: Colors.white,
    primarySwatch: Colors.orange,
    textTheme: const TextTheme(),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.black,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey[500]));
