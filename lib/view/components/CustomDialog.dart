import 'dart:io';

import 'package:flutter/material.dart';
import 'package:for_suyeon/colors.dart';
import 'package:for_suyeon/view/components/icon_text_row.dart';
import 'package:image_picker/image_picker.dart';

import '../../const.dart';

class CustomDialog extends StatefulWidget {
  const CustomDialog({Key? key}) : super(key: key);

  @override
  State<CustomDialog> createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  final ImagePicker _picker = ImagePicker();
  final _textController = TextEditingController();
  XFile? _pickedImage;

  @override
  Widget build(BuildContext context) {
    ;
    return AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      insetPadding: const EdgeInsets.all(mainPadVal),
      scrollable: true,
      title: Text(
        "사진 등록하기",
        style: Theme.of(context).textTheme.headline4,
      ),
      content: _pickedImage == null ? _beforePickImage() : _afterPickImage(),
      actions: [_belowButtons(context)],
    );
  }

  Widget _belowButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        _pickedImage != null
            ? TextButton(
                onPressed: () {},
                child: Text("확인", style: Theme.of(context).textTheme.bodyText2,),
              )
            : Container(),
        TextButton(
          onPressed: () {
            _pickedImage = null;
            Navigator.pop(context);
          },
          child: const Text("닫기"),
        )
      ],
    );
  }

  Widget _afterPickImage() {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Image(
            fit: BoxFit.cover,
            image: FileImage(File(_pickedImage!.path)),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Form(
          child: TextFormField(
            maxLines: 4,
            controller: _textController,
            autofocus: true,
            cursorColor: buttonPrimary,
            decoration: const InputDecoration(
              labelText: "내용을 입력하세요.",
              labelStyle: TextStyle(color: buttonPrimary),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: buttonPrimary),
              ),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: buttonPrimary)),
            ),
          ),
        ),
      ],
    );
  }

  Widget _beforePickImage() {
    return Column(
      mainAxisSize: MainAxisSize.min,

      children: [
        SimpleDialogOption(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0),
          child: const IconTextRow(text: "앨범에서 선택하기", icon: Icons.image),
          onPressed: _pickImgFromGallery,
        ),
        SimpleDialogOption(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0),
          child: const IconTextRow(text: "카메라로 촬영하기", icon: Icons.camera_alt),
          onPressed: _pickImgFromCamera,
        ),
        // Container(
        //   decoration: const BoxDecoration(
        //     color: grayBackground,
        //     borderRadius: BorderRadius.all(Radius.circular(5),),
        //   ),
        //   padding: const EdgeInsets.only(left: 50, right: 50, top: 50, bottom: 50),
        //   child: const Text("사진을 선택하세요."),
        // ),
      ],
    );
  }

  void _pickImgFromGallery() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        print("setstate");
        _pickedImage = image;
      });
    }
  }

  void _pickImgFromCamera() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      _pickedImage = image;
    }
  }
}
