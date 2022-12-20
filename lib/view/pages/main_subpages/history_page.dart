import 'package:flutter/material.dart';
import 'package:for_suyeon/colors.dart';
import 'package:for_suyeon/const.dart';
import 'package:for_suyeon/controller/history_data_controller.dart';
import 'package:for_suyeon/view/components/common/page_title.dart';
import 'package:for_suyeon/view/components/dialog_components/update_dialog_temp.dart';
import 'package:for_suyeon/view/components/history/history_block_temp.dart';
import 'package:get/get.dart';

class HistoryPage extends GetView<HistoryDataController> {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  return const UpdateDialogTemp(DialogType.create);
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
                child: ListView.builder(
                  itemCount: controller.dataList.length +1 ,
                  itemBuilder: (context, index) {
                    // bottom margin
                    if(index == controller.dataList.length){
                      return const SizedBox(height: 70);
                    }
                    var data = controller.dataList[index];
                    return HistoryBlockTemp(
                        content: data.content,
                        imageUrl: data.imageUrl,
                        date: data.date,
                      id: data.id,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
