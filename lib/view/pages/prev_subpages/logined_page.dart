import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:for_suyeon/utils/authorization/GoogleLogin.dart';
import 'package:for_suyeon/view/pages/prev_page_setting.dart';
import 'package:get/get.dart';

import '../../../const.dart';
import '../../components/common/peanut_love_walnut.dart';
import '../main_page.dart';

class LoginedPage extends StatelessWidget {
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
                    Get.to(() => MainPage());
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
                    bool logoutSuccess = await _logout();
                    if (logoutSuccess) {
                      Get.offAll(() => const PrevPageSetting(alreadySet: true,));
                    }
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

  Future<bool> _logout() async {
    String? loginMethod = await storage.read(key: "loginMethod");
    try {
      if (loginMethod == 'google') {
        GoogleLogin socialLogin = GoogleLogin();
        await socialLogin.logout();
        await storage.delete(key: "loginMethod");
        return true;
      }
      return false;
    } catch (error) {
      print("fail to log out");
      return false;
    }
  }
}
