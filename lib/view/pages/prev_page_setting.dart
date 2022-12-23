import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:for_suyeon/controller/user_controller.dart';
import 'package:for_suyeon/view/pages/prev_subpages/logined_page.dart';
import 'package:for_suyeon/view/pages/prev_subpages/setting_page.dart';
import 'package:for_suyeon/view/pages/prev_subpages/sign_in_page.dart';
import 'package:get/get.dart';

class PrevPageSetting extends GetView<UserController> {
  const PrevPageSetting({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(() {
        if (controller.firebaseUser == null) {
          return const SignInPage();
        }
        if (!controller.isProfileAlreadySet.value) {
          return const SettingPage();
        }
        return const LoginedPage();
      }),
    );

  }
}
