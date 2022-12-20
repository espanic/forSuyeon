import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:for_suyeon/controller/history_data_controller.dart';
import 'package:for_suyeon/controller/image_pick_controller.dart';
import 'package:for_suyeon/view/components/dialog_components/update_dialog_temp.dart';
import 'package:get/get.dart';
import '../../../colors.dart';
import '../../../const.dart';
import '../dialog_components/UpdateDialog.dart';

class HistoryBlockTemp extends GetView<HistoryDataController> {
  final String content;
  final Timestamp date;
  final String imageUrl;
  final String id;

  const HistoryBlockTemp(
      {Key? key,
      required this.content,
      required this.imageUrl,
      required this.date,
      required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: whiteHalf,
        borderRadius: BorderRadius.circular(circularRadius),
      ),
      padding: const EdgeInsets.all(photoPadVal),
      margin: const EdgeInsets.all(5),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(imageUrl: imageUrl),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20, bottom: 1),
            height: 1,
            width: double.infinity,
            color: Colors.grey,
          ),
          Row(
            children: [
              Expanded(
                flex: 8,
                child: Text(
                  content,
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
              Expanded(
                flex: 1,
                child: PopupMenuButton(
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      child: Text(
                        "편집",
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      onTap: () async {
                        Future.delayed(
                          const Duration(seconds: 0),
                          () => showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (context) {
                              Get.put(ImagePickController());
                              return UpdateDialogTemp(DialogType.update,
                                  id: id, content: content, imageUrl: imageUrl);
                            },
                          ),
                        );
                      },
                    ),
                    PopupMenuItem(
                      child: Text(
                        "삭제",
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      onTap: () async {
                        Future.delayed(
                          const Duration(seconds: 0),
                          () => showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text("삭제"),
                              content: const Text("정말로 삭제할 건가요?"),
                              actions: [
                                TextButton(
                                  onPressed: () async {
                                    await controller.deleteData(id, imageUrl);
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    "삭제",
                                    style:
                                        Theme.of(context).textTheme.bodyText2,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    "취소",
                                    style:
                                        Theme.of(context).textTheme.bodyText2,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
