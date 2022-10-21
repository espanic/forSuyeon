import 'package:flutter/material.dart';
import 'package:for_suyeon/colors.dart';

ThemeData mainTheme = ThemeData(
  primaryColor: primary,
  scaffoldBackgroundColor: primary,
  iconTheme: const IconThemeData(
    color: secondary,
    size: 32,
  ),
  textTheme: const TextTheme(
    headline1: TextStyle(
        fontFamily: 'SDSamlip',
        color: secondary,
        fontSize: 72,
        fontWeight: FontWeight.bold),
    headline2: TextStyle(
        fontFamily: 'SDSamlip',
        color: secondary,
        fontSize: 54,
        fontWeight: FontWeight.bold),
    headline3:
        TextStyle(color: secondary, fontSize: 48, fontWeight: FontWeight.bold),
    headline4: TextStyle(
        color: Colors.black, fontSize: 32, fontWeight: FontWeight.bold),
    bodyText1: TextStyle(
        fontFamily: "BinggraeSamanco",
        color: Colors.black,
        fontSize: 32,
        fontWeight: FontWeight.bold),
    bodyText2: TextStyle(
        fontFamily: "BinggraeSamanco",
        color: Colors.black,
        fontSize: 24,
        fontWeight: FontWeight.normal),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 10,
      backgroundColor: buttonPrimary,
      minimumSize: const Size(double.infinity, 60),
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
    unselectedItemColor: Colors.grey,
  ),
);
