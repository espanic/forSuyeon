

import 'dart:io';

import 'package:image_picker/image_picker.dart';
class ImagePick {
  late final ImagePicker _imagePicker;
  static final ImagePick _instance = ImagePick._();

  factory ImagePick() => _instance;

  ImagePick._(){
    _imagePicker = ImagePicker();
  }

  Future<File?> pickImgFromGallery() async {
    final XFile? image = await _imagePicker.pickImage(source: ImageSource.gallery);
    return image != null ? File(image!.path): null;
  }

  Future<File?> pickImgFromCamera() async {
    final XFile? image = await _imagePicker.pickImage(source: ImageSource.camera);
    return image != null ? File(image!.path): null;
  }
}