import 'package:flutter/material.dart';
import 'package:for_suyeon/controller/image_pick_controller.dart';
import 'package:for_suyeon/controller/user_controller.dart';
import 'package:get/get.dart';
import '../../../colors.dart';
import '../../../const.dart';
import '../../../utils/validation/validate_functions.dart';
import '../../components/common/custom_text_form_field.dart';
import '../../components/dialog_components/BelowButton.dart';
import '../../components/dialog_components/icon_text_row.dart';

class SettingPage extends StatelessWidget {
  final String? nickname;
  final String? avatarUrl;

  const SettingPage({Key? key, this.nickname, this.avatarUrl})
      : super(key: key);

  ImagePickController get imagePickController => Get.put(ImagePickController());

  UserController get userController => Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final textController = TextEditingController();
    textController.text = nickname ?? "";
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
                  _avatar(context),
                  _formFields(_formKey, textController),
                  _belowButtons(_formKey, textController),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Form _formFields(
      GlobalKey<FormState> _formKey, TextEditingController textController) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
            controller: textController,
            label: "닉네임",
            validator: ValidateFunctions.validateNickname,
            autoFocus: true,
          ),
          Obx(
            () => CustomTextFormField(
              label: "ID",
              initialValue:
                  userController.user != null ? userController.user!.id : "",
              enabled: false,
            ),
          ),
          const SizedBox(
            height: 60,
          ),
        ],
      ),
    );
  }

  Widget _avatar(BuildContext context) {
    const String defaultImagePath = "assets/example/avatar.png";
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 16),
      child: Center(
        child: GestureDetector(
          onTap: () {
            _pickImage(context);
          },
          child: GetBuilder<ImagePickController>(
            init: imagePickController,
            builder: (controller) {
              return CircleAvatar(
                backgroundColor: grayBackground,
                backgroundImage: const AssetImage(defaultImagePath),
                foregroundImage: controller.imageFile != null
                    ? FileImage(controller.imageFile!)
                    : null,
                radius: 100,
              );
            },
          ),
        ),
      ),
    );
  }

  _pickImage(BuildContext context) {
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
                await imagePickController.pickImgFromGallery();
                Navigator.pop(context);
              },
            ),
            SimpleDialogOption(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0),
                child: const IconTextRow(
                    text: "카메라로 촬영하기", icon: Icons.camera_alt),
                onPressed: () async {
                  await imagePickController.pickImgFromCamera();
                  Navigator.pop(context);
                }),
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

  Widget _belowButtons(
      GlobalKey<FormState> formKey, TextEditingController textController) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: SizedBox(
            height: 60,
            child: ElevatedButton(
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  if (imagePickController.imageFile != null) {
                    await userController.saveProfile(
                        textController.text, imagePickController.imageFile!);
                    userController.isProfileAlreadySet.value = true;
                  } else {
                    Get.snackbar("이미지 선택안함.", "이미지를 선택하세요.");
                  }
                }
              },
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
              onPressed: () async {
                await userController.logout();
              },
              child: const Text("취소"),
            ),
          ),
        )
      ],
    );
  }
}
