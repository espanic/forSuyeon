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
}