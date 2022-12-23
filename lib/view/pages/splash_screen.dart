import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:for_suyeon/controller/user_controller.dart';
import 'package:for_suyeon/view/pages/prev_page_setting.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

    final prefs = await SharedPreferences.getInstance();
    final bool? alreadyInstall = prefs.getBool('alreadyInstall');
    if (alreadyInstall != true) {
      prefs.setBool('alreadyInstall', true);
    }

    var userController = Get.put(UserController());

    var currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      await userController.getData(currentUser.uid);
      if (userController.user!.nickName != null &&
          userController.user!.profileImage != null) {
        userController.isProfileAlreadySet.value = true;
      }
    }

    s.stop();
    final interval = 1200 - s.elapsedMilliseconds;
    if (interval > 0) {
      await Future.delayed(Duration(milliseconds: interval));
    }

    Get.offAll(
      () => const PrevPageSetting(),
    );
  }
}
