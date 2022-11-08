import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:for_suyeon/view/pages/prev_subpages/first_setting_page.dart';
import 'package:for_suyeon/view/pages/prev_subpages/logined_page.dart';
import 'package:for_suyeon/view/pages/prev_subpages/sign_in_page.dart';

class PrevPageSetting extends StatelessWidget {
  final bool? alreadySet;

  const PrevPageSetting({Key? key, this.alreadySet}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const SignInPage();
          }
          if (snapshot.hasError) {
            print("login error!");
            return const SignInPage();
          }

          if (alreadySet == null || alreadySet == false) {
            return const FirstSettingPage();
          }
          return const LoginedPage();
        },
      ),
    );
  }
}