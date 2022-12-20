import 'package:flutter/material.dart';

class LetterThumbNail extends StatelessWidget {
  final String title;
  final String subTitle;
  final String assetName;
  final GestureTapCallback? onTap;

  const LetterThumbNail({Key? key, required this.title,required this.subTitle, required this.assetName, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: onTap,
        leading: CircleAvatar(
          backgroundImage: AssetImage(assetName),
        ),
        title: Text(title),
        subtitle: Text(subTitle),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}
