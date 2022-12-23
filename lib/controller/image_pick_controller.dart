import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickController extends GetxController {
  final _imagePicker = ImagePicker();
  final _imageCropper = ImageCropper();
  File? _imageFile;
  Image? _image;
  final RxBool _haveImage = false.obs;

  bool get haveImage => _haveImage.value;

  Image? get image => _image;

  File? get imageFile => _imageFile;

  void clearImageFile() {
    _imageFile = null;
    _image = null;
    _haveImage.value = false;
  }

  Future<void> pickImgFromGallery() async {
    final XFile? imageXFile =
        await _imagePicker.pickImage(source: ImageSource.gallery);
    if (imageXFile != null) {
      CroppedFile? croppedFile = await _cropImage(imageXFile.path);
      if (croppedFile != null) {
        _imageFile = File(croppedFile.path);
        _image = Image.file(_imageFile!);
        _haveImage.value = true;
        update();
      }
    }
  }

  Future<void> pickImgFromCamera() async {
    final XFile? imageXFile =
        await _imagePicker.pickImage(source: ImageSource.camera);
    if (imageXFile != null) {
      CroppedFile? croppedFile = await _cropImage(imageXFile.path);
      if (croppedFile != null) {
        _imageFile = File(croppedFile.path);
        _image = Image.file(_imageFile!);
        _haveImage.value = true;
        update();
      }
    }
  }

  Future<CroppedFile?> _cropImage(String path) async {
    return await _imageCropper.cropImage(
      sourcePath: path,
      aspectRatioPresets: [
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.ratio4x3,

      ],
      compressQuality: 50,
    );
  }

}
