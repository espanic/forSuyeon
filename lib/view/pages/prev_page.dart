import 'package:flutter/material.dart';
import 'package:for_suyeon/const.dart';
import 'package:for_suyeon/utils/authorization/GoogleLogin.dart';
import 'package:for_suyeon/utils/authorization/KakaoLogin.dart';
import 'package:for_suyeon/utils/authorization/social_login.dart';
import 'package:for_suyeon/view/components/dialog_components/BelowButton.dart';
import 'package:for_suyeon/view/components/login_buttons/Kakao_button.dart';
import 'package:for_suyeon/view/components/common/peanut_love_walnut.dart';
import 'package:for_suyeon/view/pages/main_page.dart';
import 'package:get/get.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

class PrevPage extends StatefulWidget {
  const PrevPage({Key? key}) : super(key: key);

  @override
  State<PrevPage> createState() => _PrevPageState();
}

class _PrevPageState extends State<PrevPage> {
  late SocialLogin _socialLogin;
  static const storage = FlutterSecureStorage();
  bool isLogin = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _asyncMethod();
    });
  }

  _asyncMethod() async {
    String? prevLoginMethod = await storage.read(key: "prevLoginMethod");
    if (prevLoginMethod == null) {
      return;
    }
    if (prevLoginMethod == 'kakao') {
      _socialLogin = KakaoLogin();
    }
    if (await AuthApi.instance.hasToken()) {
      try {
        var tokenInfo = await UserApi.instance.accessTokenInfo();
        print('token validation: ${tokenInfo.id} ${tokenInfo.expiresIn}');
        setState(() {
          isLogin = true;
        });
      } catch (error) {
        isLogin = false;
        if (error is KakaoException && error.isInvalidTokenError()) {
          print('토큰 만료 $error');
        } else {
          print('토큰 정보 조회 실패 $error');
        }
        try {
          var token = await _socialLogin.login();
          isLogin = true;
        } catch (error) {
          _showLoginFailDialog(context);
          isLogin = false;
        }
      }
    } else {
      print("no token");
      isLogin = false;
    }
    setState(() {});
  }

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
              isLogin
                  ? Column(
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
                          onPressed: _kakaoLogout,
                          child: const Text(
                            "로그아웃",
                          ),
                        )
                      ],
                    )
                  : Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          Expanded(
                            flex : 1,
                            child: LoginButton(
                                onTap: _kakaoLogin,
                                image: Image.asset(
                                    'assets/app_icons/kakao_login_large_wide.png',
                                    fit: BoxFit.contain)),
                          ),
                          Expanded(
                            flex: 1,
                            child: LoginButton(
                              image: Image.asset(
                                  'assets/app_icons/btn_google_signin_light_focus_web.png',
                                  fit: BoxFit.contain),
                              onTap: _googleLogin,
                            ),
                          )
                        ],
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
  void _googleLogin() async {
    _socialLogin = GoogleLogin();
    try{
      await _socialLogin.login();
    }catch(error){
      print("google login error");
    }

  }

  void _kakaoLogout() async {
    try {
      await _socialLogin.logout();
    } catch (e) {
      print("no login prior");
    }
    await storage.delete(key: "prevLoginMethod");
    setState(() {
      isLogin = false;
    });
  }

  void _kakaoLogin() async {
    _socialLogin = KakaoLogin();
    try {
      var token = await _socialLogin.login();
      if (token != null) {
        await storage.write(key: "prevLoginMethod", value: 'kakao');
        setState(() {
          isLogin = true;
        });
      } else {
        _showLoginFailDialog(context);
      }
    } catch (error) {
      await storage.delete(key: "prevLoginMethod");
      setState(() {
        isLogin = false;
      });
    }
  }

  void _showLoginFailDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => _loginFailDialog(context),
    );
  }

  Widget _loginFailDialog(BuildContext context) {
    return AlertDialog(
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
    );
  }
}
