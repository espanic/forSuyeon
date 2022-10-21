import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:for_suyeon/colors.dart';
import 'package:for_suyeon/const.dart';
import 'package:for_suyeon/utils/image/image_pick.dart';
import 'package:for_suyeon/utils/validation/validate_functions.dart';
import 'package:for_suyeon/view/components/common/custom_text_form_field.dart';
import 'package:for_suyeon/view/pages/prev_page_temp.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/authorization/GoogleLogin.dart';
import '../../components/dialog_components/BelowButton.dart';
import '../../components/dialog_components/icon_text_row.dart';

class FirstSettingPage extends StatefulWidget {
  final String id;

  const FirstSettingPage({Key? key, required this.id}) : super(key: key);

  @override
  State<FirstSettingPage> createState() => _FirstSettingPageState();
}

class _FirstSettingPageState extends State<FirstSettingPage> {
  final prefs = SharedPreferences.getInstance();
  final _imagePick = ImagePick();
  final _formKey = GlobalKey<FormState>();
  File? _imageFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(mainPadVal),
        child: Column(
          children: [
            Center(
              child: Text(
                "설정하기",
                style: Theme.of(context).textTheme.headline2,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  _avatar(),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const CustomTextFormField(
                          label: "닉네임",
                          validator: ValidateFunctions.validateNickname,
                          autoFocus: true,
                        ),
                        CustomTextFormField(
                          label: "ID",
                          initialValue: widget.id,
                          enabled: false,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  _belowButtons()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _belowButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: SizedBox(
            height: 60,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text("설정완료"),
            ),
          ),
        ),
        const SizedBox(
          width: 32,
        ),
        Expanded(
          child: SizedBox(
            height: 60,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey,
              ),
              onPressed: _logout,
              child: const Text("취소"),
            ),
          ),
        )
      ],
    );
  }

  void _logout() async {
    FlutterSecureStorage storage = const FlutterSecureStorage();
    String? loginMethod = await storage.read(key: "loginMethod");
    try {
      if (loginMethod == 'google') {
        GoogleLogin socialLogin = GoogleLogin();
        await socialLogin.logout();
        await storage.delete(key: "loginMethod");
      }
    } catch (error) {
      print("fail to log out");
    }
    Get.offAll(() => const PrevPageTemp());
  }

  Widget _avatar() {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 16),
      child: Center(
        child: GestureDetector(
          onTap: _pickImage,
          child: CircleAvatar(
            backgroundColor: grayBackground,
            backgroundImage: const AssetImage("assets/example/avatar.png"),
            // child: _imageFile != null ? Image.file(_imageFile!) : null,
            foregroundImage: _imageFile != null ? FileImage(_imageFile!) : null,
            radius: 100,
          ),
        ),
      ),
    );
  }

  _pickImage() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SimpleDialogOption(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0),
              child: const IconTextRow(text: "앨범에서 선택하기", icon: Icons.image),
              onPressed: () async {
                _imageFile = await _imagePick.pickImgFromGallery();
                setState(() {
                  Navigator.pop(context);
                });
              },
            ),
            SimpleDialogOption(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0),
              child:
                  const IconTextRow(text: "카메라로 촬영하기", icon: Icons.camera_alt),
              onPressed: () async {
                _imageFile = await _imagePick.pickImgFromCamera();
                setState(() {
                  Navigator.pop(context);
                });
              },
            )
          ],
        ),
        actions: [
          BelowButton(
            text1: "닫기",
            onPressed1: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
