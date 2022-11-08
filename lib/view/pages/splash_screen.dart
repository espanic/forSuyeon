import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:for_suyeon/user/user.dart';
import 'package:for_suyeon/view/pages/prev_page.dart';
import 'package:for_suyeon/view/pages/prev_page_setting.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../db/data_controller.dart';
import '../../utils/util_functions.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/pw/splash.png"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  Future<void> _initialize() async {
    Stopwatch s = Stopwatch();
    s.start();
    final controller = Get.put(DataController());
    final prefs = await SharedPreferences.getInstance();
    final bool? alreadyInstall = prefs.getBool('alreadyInstall');
    bool? alreadySet = false;
    if (alreadyInstall != true) {
      final content = await loadLetter('assets/example/example.txt');
      var bytes = await rootBundle.load('assets/example/example.jpg');
      final id = DateTime.now().millisecondsSinceEpoch;
      await controller.insertDataInitial(id, content, bytes);
      prefs.setBool('alreadyInstall', true);
    }
    await controller.getData();

    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final userInfoDoc = await FirebaseFirestore.instance
          .collection('user')
          .doc(user.uid).get();
      final userInfo = userInfoDoc.data();
      // single tone
      if (userInfo == null || userInfo['avatarUrl'] == null || userInfo['nickname'] == null) {
        alreadySet = false;
      } else {
        MyUser().saveImage(userInfo['avatarUrl']);
        alreadySet = true;
      }
      print("already set : $alreadySet");

    }

    s.stop();
    final interval = 1200 - s.elapsedMilliseconds;
    if (interval > 0) {
      await Future.delayed(Duration(milliseconds: interval));
    }

    Get.offAll(
      () => PrevPageSetting(alreadySet: alreadySet),
    );
  }
}
