import 'package:flutter/material.dart';
import 'package:for_suyeon/colors.dart';

ThemeData mainTheme = ThemeData(
  primaryColor: primary,
  scaffoldBackgroundColor: primary,
  iconTheme: const IconThemeData(
    color: secondary,
    size: 64,
  ),
  textTheme: const TextTheme(
    headline1:
        TextStyle(color: secondary, fontSize: 64, fontWeight: FontWeight.bold),
    headline2:
        TextStyle(color: secondary, fontSize: 54, fontWeight: FontWeight.bold),
    headline3:
        TextStyle(color: secondary, fontSize: 48, fontWeight: FontWeight.bold),
    bodyText1: TextStyle(
        color: Colors.black, fontSize: 24, fontWeight: FontWeight.w600),
    bodyText2: TextStyle(
        color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      primary: buttonPrimary,
      minimumSize: const Size(double.infinity, 40),
      textStyle: const TextStyle(
          color: Colors.white,
          fontSize: 32,
          fontWeight: FontWeight.bold,
          letterSpacing: 6),
      padding: const EdgeInsets.all(8),
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedItemColor: primary,
  ),
);
