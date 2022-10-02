import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:for_suyeon/db/db_functions.dart';
import 'package:for_suyeon/db/history_data.dart';
import 'package:for_suyeon/view/components/history_block.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DataController extends GetxController {
  var dataList = <HistoryBlock>[].obs;
  late final Directory appDir;
  late final imageDir;

  @override
  Future<void> onInit() async {
    // _getData().then((value) {
    //   print("getData called");
    // });
    await _initDir();
    await _getData();

    super.onInit();
  }

  Future<void> _initDir() async {
    appDir = await getApplicationDocumentsDirectory();
    imageDir = join(appDir.path, 'history_image');
    await Directory(imageDir).create(recursive: true);
  }

  Future<void> _getData() async {
    var rawData = await DBHelper().loadAllHistory();
    for (var element in rawData) {
      dataList.add(_changeRawToBlock(element));
    }
    sortById();
  }

  Future<void> insertData(int id, String content, File file) async {
    // await file.c(appDir.path + '/history_image/' + '$id.jpg');
    try {
      final newFile = await file.copy(join(imageDir, '$id.jpg'));
      await DBHelper().insertHistoryData(HistoryData(id, content));
      dataList.insert(0, HistoryBlock(id: id, content: content, image: Image.file(newFile)));
    } catch (e) {
      e.printError();
      deleteData(id);
    }
    sortById();
  }

  Future<void> updateData(HistoryBlock original, String content, File? file) async {
    try{
      if(file != null){
        final newFile = await file.copy(join(imageDir,'${original.id}.jpg'));
        original.image = Image.file(file);
      }
      await DBHelper().updateHistory(HistoryData(original.id, content));
      original.content = content;
    }catch(e){
      e.printError();
    }
  }

  Future<void> deleteData(int id) async {
    try {
      dataList.removeWhere((e) => e.id == id);
      final file = File(join(imageDir, '$id.jpg'));
      await file.delete();
      await DBHelper().deleteHistory(id);
    } catch (e) {
      e.printError();
    }
  }

  HistoryBlock _changeRawToBlock(HistoryData raw) {
    final file = File(appDir.path + '/history_image/' + '${raw.id}.jpg');
    return HistoryBlock(
        id: raw.id, content: raw.content, image: Image.file(file));
  }

  HistoryData _changeBlockToHistory(HistoryBlock block) {
    return HistoryData(block.id, block.content);
  }

  void sortById() {
    print("sorting");
    dataList.sort((a, b) => - a.compareTo(b));
  }
}
