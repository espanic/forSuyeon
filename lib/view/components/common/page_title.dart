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
        Expanded(
          flex: 5,
          child: Text(
            titleText,
            overflow: TextOverflow.clip,
            style: titleStyle ?? Theme.of(context).textTheme.headline2,
          ),
        ),
        imagePath != null
            ? const Spacer(
                flex: 1,
              )
            : Container(),
        imagePath != null
            ? Expanded(
                flex: 3,
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Image.asset(
                      imagePath!,
                      fit: BoxFit.cover,
                      width: 150,
                    ),
                  ],
                ),
              )
            : Container(),
        imagePath != null
            ? const Spacer(
                flex: 1,
              )
            : Container(),
      ],
    );
  }
}
