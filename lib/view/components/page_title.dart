import 'package:flutter/material.dart';

class PageTitle extends StatelessWidget {
  final String titleText;
  final String imagePath;
  final TextStyle? titleStyle;

  const PageTitle(
      {Key? key,
      required this.titleText,
      required this.imagePath,
      this.titleStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          titleText,
          style: titleStyle ?? Theme.of(context).textTheme.headline2,
        ),
        const Spacer(),
        Column(
          children: [
            const SizedBox(height: 20),
            Image.asset(
              imagePath,
              fit: BoxFit.contain,
              width: 150,
            ),
          ],
        ),
      ],
    );
  }
}
