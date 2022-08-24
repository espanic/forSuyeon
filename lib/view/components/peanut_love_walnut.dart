import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PeanutLoveWalnut extends StatelessWidget {
  final ThemeData themeData;

  const PeanutLoveWalnut({Key? key, required this.themeData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "월넛",
          style: themeData.textTheme.headline1,
        ),
        Icon(CupertinoIcons.heart, color: themeData.iconTheme.color, size: themeData.iconTheme.size,),
        Text(
          "피넛",
          style: themeData.textTheme.headline1,
        ),
      ],
    );
  }
}
