import 'package:flutter/material.dart';

class MyUser {
  Image? profileImage;
  MyUser._();
  static final MyUser _user = MyUser._();
  factory MyUser() => _user;

  saveImage(String url){
    profileImage = Image.network(url);
  }
}