import 'package:for_suyeon/utils/authorization/social_login.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

class KakaoLogin implements SocialLogin {
  @override
  Future<OAuthToken?> login() async {
    try {
      bool isInstalled = await isKakaoTalkInstalled();
      if (isInstalled) {
        var token = await UserApi.instance.loginWithKakaoTalk();
        return token;
      } else {
        try {
          var token = await UserApi.instance.loginWithKakaoAccount();
          return token;
        } catch (error) {
          return null;
        }
      }
    } catch (error) {
      return null;
    }
  }

  @override
  Future<bool> logout() async {
    try {
      await UserApi.instance.unlink();
      return true;
    } catch (error) {
      return false;
    }
  }
}
