import 'package:flutter/material.dart';
import 'package:for_suyeon/colors.dart';
import 'package:for_suyeon/const.dart';
import 'package:for_suyeon/view/components/CustomDialog.dart';
import 'package:for_suyeon/view/components/history_block.dart';
import 'package:for_suyeon/view/components/page_title.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {


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
            PageTitle(
              titleText: "추억앨범",
              imagePath: "assets/pw/yu.png",
              titleStyle: Theme.of(context).textTheme.headline3,
            ),
            Expanded(
              child: ListView(
                children: const [
                  HistoryBlock(
                      imagePath: "assets/sample_image/img1.png",
                      comment: "추억이다 ㅋㅋㅋ 아 정말 너무 좋았고 또 가고 싶은 그런걸 일알ㅇㄴㄹㄴㄹㄴ"),
                  HistoryBlock(
                      imagePath: "assets/sample_image/img2.png",
                      comment: "추억이다 ㅋㅋㅋ"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


}
