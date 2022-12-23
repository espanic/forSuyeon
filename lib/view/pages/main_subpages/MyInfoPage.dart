import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:for_suyeon/controller/image_pick_controller.dart';
import 'package:for_suyeon/controller/user_controller.dart';
import 'package:for_suyeon/view/pages/prev_subpages/setting_page.dart';
import 'package:get/get.dart';

import '../../../colors.dart';
import '../../../const.dart';
import '../../components/common/custom_text_form_field.dart';

class MyInfoPage extends GetView<UserController> {
  const MyInfoPage({Key? key}) : super(key: key);

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
                  _avatar(context),
                  _formFields(),
                  _belowButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _avatar(BuildContext context) {
    var a = CachedNetworkImageProvider(controller.user!.avatarUrl!);
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 16),
      child: Center(
        child: CircleAvatar(
          foregroundImage: CachedNetworkImageProvider(controller.user!.avatarUrl!),
          radius: 100,
        ),
      ),
    );
  }

  Column _formFields() {
    return Column(
      children: [
         CustomTextFormField(
          label: "닉네임",
          enabled: false,
          initialValue: controller.user!.nickName,
        ),
        CustomTextFormField(
          label: "ID",
          initialValue: controller.user!.id,
          enabled: false,
        ),
        const SizedBox(
          height: 60,
        ),
      ],
    );
  }


  Widget _belowButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: SizedBox(
            height: 60,
            child: ElevatedButton(
              onPressed: (){
                // Get.find<ImagePickController>().clearImageFile();
                // Get.to(const SettingPage());
              },
              child: const Text("수정하기"),
            ),
          ),
        ),
      ],
    );
  }


}
