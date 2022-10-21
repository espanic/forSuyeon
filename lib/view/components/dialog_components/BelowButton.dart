import 'package:flutter/material.dart';

class BelowButton extends StatelessWidget {
  final String text1;
  final String? text2;
  final VoidCallback? onPressed1;
  final VoidCallback? onPressed2;

  const BelowButton(
      {Key? key,
      required this.text1,
      this.text2,
      this.onPressed1,
      this.onPressed2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: onPressed1 ?? (){},
          child: Text(
            text1,
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ),
        text2 != null
            ? TextButton(
                onPressed: onPressed2 ?? (){},
                child: Text(
                  text2!,
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              )
            : Container(),
      ],
    );
  }
}
