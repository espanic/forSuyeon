import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:for_suyeon/view/pages/prev_subpages/first_setting_page.dart';
import 'package:for_suyeon/view/pages/prev_subpages/logined_page.dart';
import 'package:for_suyeon/view/pages/prev_subpages/sign_in_page.dart';


class PrevPageTemp extends StatelessWidget {
  final bool? alreadySet;
  const PrevPageTemp({Key? key, this.alreadySet}) : super(key: key);

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
          final user = FirebaseAuth.instance.currentUser;
          if(alreadySet == false || alreadySet == null){
            return  FirstSettingPage(id: user!.uid,);
          }
          return const LoginedPage();
        },
      ),
    );
  }

}
