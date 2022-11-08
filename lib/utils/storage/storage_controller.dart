import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

class StorageController {
  static final storageRef = FirebaseStorage.instance.ref();

  StorageController._();

  static final StorageController _controller = StorageController._();

  factory StorageController() => _controller;

  Future<String> uploadFile(File file, String path) async {
    try{
      final ref = storageRef.child(path);
      final uploadTask = ref.putFile(file);
      final snapshot = await uploadTask.whenComplete(() => {});
      final urlDownload = await snapshot.ref.getDownloadURL();
      return urlDownload;
    }catch(e){
      e.printError();
      return "-1";
    }

  }
  

}
