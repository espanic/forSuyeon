import 'dart:io';

import 'package:flutter/material.dart';
import 'package:for_suyeon/db/data_controller.dart';
import 'package:for_suyeon/view/components/dialog_components/UpdateDialog.dart';
import 'package:get/get.dart';
import '../../../colors.dart';
import '../../../const.dart';

class HistoryBlock extends StatefulWidget {
  final int id;
  String content;
  Image? image;

  HistoryBlock(
      {Key? key, required this.id, required this.content, required this.image})
      : super(key: key);

  @override
  State<HistoryBlock> createState() => _HistoryBlockState();

  int compareTo(HistoryBlock other) {
    return id.compareTo(other.id);
  }
}

class _HistoryBlockState extends State<HistoryBlock> {
  final _dataController = Get.put(DataController());

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
            child: widget.image ??
                const Center(
                  child: Text("이미지를 불러오는데 실패했습니다."),
                ),
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
                  widget.content,
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
              Expanded(
                flex: 1,
                // child: IconButton(
                //   onPressed: () async {
                //     await _dataController.deleteData(id);
                //   },
                //   icon: const Icon(Icons.menu),
                // ),
                child: PopupMenuButton(
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      child: Text(
                        "편집",
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      onTap: () {
                        Future.delayed(
                          const Duration(seconds: 0),
                          () => showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (context) {
                              return UpdateDialog(currentBlock: widget);
                            },
                          ),
                        ).then((value) => {setState(() {})});
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
                                    await _dataController.deleteData(widget.id);
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
