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

  // Future<Expanded> _googleLoginButton(BuildContext context) async {
  //   return Expanded(
  //             flex: 2,
  //             child: Column(
  //               children: [
  //                 Expanded(
  //                   flex: 1,
  //                   child: LoginButton(
  //                     image: Image.asset(
  //                         'assets/app_icons/btn_google_signin_light_focus_web.png',
  //                         fit: BoxFit.contain),
  //                     onTap: () async {
  //                       setState(() {
  //                         showSpinner = true;
  //                       });
  //                       await _googleLogin(context);
  //                     },
  //                   ),
  //                 )
  //               ],
  //             ),
  //           );
  // }
  //
  // Future<void> _googleLogin(BuildContext context) async {
  //   var _socialLogin = GoogleLogin();
  //   try {
  //     var userCredential = await _socialLogin.login();
  //     final user = userCredential.user;
  //     await SignInPage.storage.write(key: "loginMethod", value: 'google');
  //     await FirebaseFirestore.instance.collection('user').doc(user!.uid).update({
  //       'email' : user.email,
  //     });
  //   } catch (error) {
  //     print("google login error");
  //     error.printError();
  //     _showLoginFailDialog(context);
  //   }
  //   showSpinner = false;
  // }

  void _showLoginFailDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          "로그인 오류",
          style: Theme.of(context).textTheme.headline4,
        ),
        content: Text(
          "로그인 오류입니다. ",
          style: Theme.of(context).textTheme.bodyText2,
        ),
        actions: [
          BelowButton(
            text1: "닫기",
            onPressed1: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
