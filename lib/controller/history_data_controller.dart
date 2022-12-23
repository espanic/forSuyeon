import 'dart:io';

import 'package:for_suyeon/domain/repository/history_data_repository.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:get/get.dart';

import '../model/history_data.dart';

class HistoryDataController extends GetxController {
  final _repository = HistoryDataRepository();
  final RxList<HistoryData> _dataList = <HistoryData>[].obs;

  List<HistoryData> get dataList => _dataList;

  @override
  void onInit() {
    super.onInit();
    _dataList.bindStream(_repository.streamData());
  }

  Future<bool> createData(String content, DateTime dateTime, String uid,  File imageFile)async {
    try{
      await _repository.createData(content, dateTime,uid,  imageFile);
      return true;
    }catch(e){
      return false;
    }
  }
  Future<bool> updateData(String content, String id, String imageUrl, File? imageFile)async {
    try{
      await _repository.updateData(content, id, imageUrl, imageFile);
      return true;
    }catch(e){
      return false;
    }
  }


  Future<bool> deleteData(String id, String imageUrl) async {
    try {
      await _repository.deleteData(id, imageUrl);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> saveImage(String imageUrl) async {
    try{
      await GallerySaver.saveImage(imageUrl);
      Get.snackbar("이미지 저장", "성공했습니다.");
    }catch(e){
      Get.snackbar("이미지 저장 오류", "실패했습니다.");
    }




  }

}
