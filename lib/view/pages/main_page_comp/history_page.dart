import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:for_suyeon/colors.dart';
import 'package:for_suyeon/const.dart';
import 'package:for_suyeon/view/components/page_title.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SizedBox(
        height: 70,
        width: 70,
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: () {},
            mini: false,
            child: const Icon(Icons.add, size: 40,),
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

class HistoryBlock extends StatelessWidget {
  final String imagePath;
  final String comment;

  const HistoryBlock({Key? key, required this.imagePath, required this.comment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: whiteHalf,
        borderRadius: BorderRadius.circular(circularRadius),
      ),
      padding: const EdgeInsets.all(mainPadVal),
      margin: const EdgeInsets.all(5),
      child: Column(
        children: [
          Image.asset(imagePath),
          Row(
            children: [
              Expanded(
                flex: 8,
                child: Text(
                  comment,
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
              Expanded(
                flex: 1,
                child: IconButton(
                  onPressed: () {
                    print("pressed");
                  },
                  icon: const Icon(Icons.menu),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
