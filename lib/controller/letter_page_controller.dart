import 'package:flutter/services.dart';
import 'package:get/get.dart';


class LetterPageController extends GetxController {

  final RxString _letter = "".obs;
  String get letter => _letter.value;



  Future<void> loadLetter(String path) async {
     _letter.value = await rootBundle.loadString(path);
  }

  void clearLetter(){
    _letter.value = "";
  }
}