import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final GestureTapCallback? onTap;
  final Image image;
  const LoginButton({Key? key, this.onTap, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: image,
      onTap: onTap,
    );
  }
}
