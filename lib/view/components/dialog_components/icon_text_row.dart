import 'package:flutter/material.dart';
import 'package:for_suyeon/colors.dart';

class IconTextRow extends StatelessWidget {
  final String text;
  final IconData icon;
  const IconTextRow({Key? key,required this.text,required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(icon, color: buttonLessOpac, size: 32,),
        const SizedBox(width: 8,),
        Text(text),
      ],
    );
  }
}
