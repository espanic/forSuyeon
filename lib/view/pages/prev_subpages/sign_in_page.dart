import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:for_suyeon/view/components/login/login_box.dart';
import '../../../const.dart';
import '../../components/dialog_components/BelowButton.dart';
import '../../components/common/peanut_love_walnut.dart';

class SignInPage extends StatefulWidget {
  static const storage = FlutterSecureStorage();

  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(mainPadVal),
        child: ListView(
          children: [
            PeanutLoveWalnut(
              themeData: Theme.of(context),
            ),
            const SizedBox(height: 8),
            Image.asset(
              "assets/pw/kisses.png",
              fit: BoxFit.cover,
            ),
            const LoginBox(),
          ],
        ),
      ),
    );
  }

}
