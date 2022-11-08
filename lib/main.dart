import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:for_suyeon/const.dart';
import 'package:for_suyeon/theme.dart';
import 'package:for_suyeon/view/pages/splash_screen.dart';
import 'package:get/get.dart';
import 'package:kakao_flutter_sdk_common/kakao_flutter_sdk_common.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  KakaoSdk.init(nativeAppKey: nativeAppKey);
  Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: mainTheme,
      title: "anniversary app for Suyeon",
      home: const SplashScreen(),
    );
  }
}
