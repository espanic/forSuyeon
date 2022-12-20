import 'package:for_suyeon/controller/history_data_controller.dart';
import 'package:for_suyeon/controller/letter_page_controller.dart';
import 'package:get/get.dart';

class MainPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LetterPageController());
    Get.lazyPut(() => HistoryDataController());
  }
}