import 'package:flutter/material.dart';
import 'package:for_suyeon/theme.dart';
import 'package:for_suyeon/view/pages/prev_page.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      checkerboardOffscreenLayers: true,
      debugShowCheckedModeBanner: false,
      theme: mainTheme,
      home: const PrevPage(),
    );
  }
}
