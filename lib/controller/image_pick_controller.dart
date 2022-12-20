import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickController extends GetxController {
  final _imagePicker = ImagePicker();
  File? _imageFile;
  Image? _image;
  final RxBool _haveImage = false.obs;

  bool get haveImage => _haveImage.value;
  Image? get image => _image;
  File? get imageFile=> _imageFile;

  void clearImageFile() {
    _imageFile = null;
    _image = null;
    _haveImage.value =false;
  }



  Future<void> pickImgFromGallery() async {
    final XFile? imageXFile = await _imagePicker.pickImage(source: ImageSource.gallery);
    if (imageXFile != null) {
      _imageFile = File(imageXFile.path);
      _image = Image.file(_imageFile!);
      _haveImage.value =true;
    }
  }

  Future<void> pickImgFromCamera() async {
    final XFile? imageXFile = await _imagePicker.pickImage(source: ImageSource.camera);
    if (imageXFile != null) {
      _imageFile = File(imageXFile.path);
      _image = Image.file(_imageFile!);
      _haveImage.value =true;
    }
  }
}