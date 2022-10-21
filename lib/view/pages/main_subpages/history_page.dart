import 'package:flutter/material.dart';
import 'package:for_suyeon/colors.dart';
import 'package:for_suyeon/const.dart';
import 'package:for_suyeon/db/data_controller.dart';
import 'package:for_suyeon/view/components/dialog_components/CustomDialog.dart';
import 'package:for_suyeon/view/components/common/page_title.dart';
import 'package:get/get.dart';

class HistoryPage extends StatelessWidget {
  HistoryPage({Key? key}) : super(key: key);
  final _dataController = Get.put(DataController());

  @override
  Widget build(BuildContext context) {
    print("history page build");
    return Scaffold(
      floatingActionButton: SizedBox(
        height: 70,
        width: 70,
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  // _pickedImage = null;
                  return const CustomDialog();
                },
              );
            },
            mini: false,
            child: const Icon(
              Icons.add,
              size: 40,
            ),
            backgroundColor: buttonPrimary,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(mainPadVal),
        child: Column(
          children: [
            const PageTitle(
              titleText: "추억앨범",
              imagePath: "assets/pw/nineteen.png",
            ),
            const SizedBox(
              height: 8,
            ),
            Obx(
              () => Expanded(
                child: ListView(
                  children: [
                    ..._dataController.dataList,
                    const SizedBox(
                      height: 70,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
