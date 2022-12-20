import 'package:validators/validators.dart';

class ValidateFunctions {
  static String? validateNickname(String? val){
    if(val==null || val.isEmpty){
      return "닉네임을 입력해야 합니다.";
    }
    if(val.length > 12){
      "닉네임은 12자 이하이어야 합니다.";
    }
    return null;
  }


  static String? validateEmail(String? val){
    if(val==null || val.isEmpty){
      return "이메일을 입력해야 합니다.";
    }
    if(!isEmail(val)){
      return "이메일 형식이 아닙니다.";
    }
    return null;
  }


  static String? validatePassword(String? val){
    if(val==null || val.isEmpty){
      return "비밀번호를 입력해야 합니다.";
    }
    if(val.length > 15){
      return "비밀번호는 15자이하입니다.";
    }
    return null;
  }
}