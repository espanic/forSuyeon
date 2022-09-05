import 'package:flutter/material.dart';

import '../../colors.dart';
import '../../const.dart';

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
          ClipRRect(child: Image.asset(imagePath)),
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
