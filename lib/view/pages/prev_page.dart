import 'package:flutter/material.dart';
import 'package:for_suyeon/const.dart';
import 'package:for_suyeon/db/data_controller.dart';
import 'package:for_suyeon/view/components/peanut_love_walnut.dart';
import 'package:for_suyeon/view/pages/main_page.dart';
import 'package:get/get.dart';

import '../../colors.dart';

class PrevPage extends StatelessWidget {
  PrevPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(mainPadVal),
          child: Column(
            children: [
              PeanutLoveWalnut(
                themeData: Theme.of(context),
              ),
              const Spacer(
                flex: 1,
              ),
              Image.asset(
                "assets/pw/kisses.png",
                fit: BoxFit.cover,
              ),
              const Spacer(
                flex: 1,
              ),
              ElevatedButton(
                onPressed: () {
                  Get.to(() => MainPage());
                },
                child: const Text(
                  "시작하기",
                ),
              ),
              const Spacer(
                flex: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
