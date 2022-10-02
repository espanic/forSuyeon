import 'package:flutter/material.dart';

class PageTitle extends StatelessWidget {
  final String titleText;
  final String? imagePath;
  final TextStyle? titleStyle;

  const PageTitle(
      {Key? key, required this.titleText, this.imagePath, this.titleStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          flex: 4,
          child: Text(
            titleText,
            overflow: TextOverflow.clip,
            style: titleStyle ?? Theme.of(context).textTheme.headline2,
          ),
        ),
        const Spacer(
          flex: 1,
        ),
        Flexible(
          flex: 2,
          child: Column(
            children: [
              const SizedBox(height: 20),
              imagePath != null
                  ? Image.asset(
                      imagePath!,
                      fit: BoxFit.cover,
                      width: 150,
                    )
                  : Container(),
            ],
          ),
        ),
      ],
    );
  }
}
