import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

abstract class SocialLogin {
  Future<Object?> login();

  Future<bool> logout();
}
