import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:for_suyeon/theme.dart';
import 'package:for_suyeon/view/pages/prev_page.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      home: PrevPage(),
    );
  }
}
