import 'package:flutter/material.dart';
import 'package:for_suyeon/controller/history_data_controller.dart';
import 'package:for_suyeon/controller/image_pick_controller.dart';
import 'package:get/get.dart';
import '../../../colors.dart';
import '../../../const.dart';
import 'BelowButton.dart';
import 'icon_text_row.dart';

enum DialogType { create, update }

class UpdateDialogTemp extends GetView<ImagePickController> {
  final String? content;
  final String? id;
  final String? imageUrl;
  final DialogType type;

  const UpdateDialogTemp(this.type,
      {Key? key, this.content, this.id, this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String typeTitle = "등록";
    if (type == DialogType.update) {
      assert(id != null && imageUrl != null, id != null);
      typeTitle = "편집";
    }
    var width = MediaQuery.of(context).size.width;
    final textController = TextEditingController();
    textController.text = content ?? "";
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      insetPadding: const EdgeInsets.all(mainPadVal),
      scrollable: true,
      title: Text(
        "사진 $typeTitle하기",
        style: Theme.of(context).textTheme.headline4,
      ),
      content: GetX<ImagePickController>(
        init: controller,
        builder: (controller) {
          if (controller.haveImage) {
            return _afterPickImage(textController);
          }
          return _beforePickImage(width, textController);
        },
      ),
      actions: [
        _belowButtons(context, textController),
      ],
    );
  }

  Widget _beforePickImage(double width, TextEditingController textController) {
    return SizedBox(
      width: width - 100,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SimpleDialogOption(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0),
            child: const IconTextRow(text: "앨범에서 선택하기", icon: Icons.image),
            onPressed: () async {
              await controller.pickImgFromGallery();
            },
          ),
          SimpleDialogOption(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0),
            child: const IconTextRow(text: "카메라로 촬영하기", icon: Icons.camera_alt),
            onPressed: () async {
              await controller.pickImgFromCamera();
            },
          ),
          const SizedBox(
            height: 10,
          ),
          Form(
            child: TextFormField(
              maxLines: 3,
              controller: textController,
              autofocus: false,
              cursorColor: buttonPrimary,
              decoration: const InputDecoration(
                labelText: "내용을 입력하세요.",
                labelStyle: TextStyle(color: buttonPrimary),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: buttonPrimary),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: buttonPrimary),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _afterPickImage(TextEditingController textController) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: controller.image,
        ),
        const SizedBox(
          height: 10,
        ),
        Form(
          child: TextFormField(
            maxLines: 4,
            controller: textController,
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

  Widget _belowButtons(
      BuildContext context, TextEditingController textController) {
    return BelowButton(
      text1: "확인",
      text2: "취소",
      onPressed1: () async {
        var historyDataController = Get.find<HistoryDataController>();
        if (type == DialogType.update) {
          await historyDataController.updateData(
              textController.text, id!, imageUrl!, controller.imageFile);
          controller.clearImageFile();
        } else {
          if (controller.imageFile != null) {
            historyDataController.createData(
                textController.text, DateTime.now(), controller.imageFile!);
          }else{
            Get.snackbar("오류", "이미지를 선태하세요!");
          }
        }
        Navigator.pop(context);
      },
      onPressed2: () {
        controller.clearImageFile();
        Navigator.pop(context);
      },
    );
  }
}
