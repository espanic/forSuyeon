import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:for_suyeon/controller/binding/main_page_binding.dart';
import 'package:for_suyeon/controller/user_controller.dart';
import 'package:get/get.dart';

import '../../../const.dart';
import '../../components/common/peanut_love_walnut.dart';
import '../main_page.dart';

class LoginedPage extends GetView<UserController> {
  static const storage = FlutterSecureStorage();

  const LoginedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Get.to(() => MainPage(), binding: MainPageBinding());
                  },
                  child: const Text(
                    "시작하기",
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                  ),
                  onPressed: () async {
                    await controller.logout();
                  },
                  child: const Text(
                    "로그아웃",
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

}
