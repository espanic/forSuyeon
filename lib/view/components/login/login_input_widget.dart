import 'package:flutter/material.dart';
import 'package:for_suyeon/colors.dart';

class LoginInputWidget extends StatelessWidget {
  final String? hintText;
  final String? errorText;
  final Widget? prefixIcon;
  final double? height;
  final String? topLabel;
  final bool? obscureText;
  final FormFieldSetter<String>? onSaved;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final TextInputType? keyboardType;
  final Key? kKey;
  final TextEditingController? kController;
  final String? kInitialValue;

  const LoginInputWidget({Key? key,
    this.hintText,
    this.prefixIcon,
    this.height = 48.0,
    this.topLabel = "",
    this.obscureText = false,
    required this.onSaved,
    this.keyboardType,
    this.errorText,
    this.onChanged,
    this.validator,
    this.kKey,
    this.kController,
    this.kInitialValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(topLabel!),
        const SizedBox(height: 4.0),
        SizedBox(
          height: 70,
          child: TextFormField(
            cursorColor: buttonPrimary,
            initialValue: kInitialValue,
            controller: kController,
            key: kKey,
            keyboardType: keyboardType,
            onSaved: onSaved,
            onChanged: onChanged,
            validator: validator,
            obscureText: obscureText!,
            decoration: InputDecoration(
              prefixIcon: prefixIcon,
              prefixIconColor: buttonPrimary,

              // enabledBorder: OutlineInputBorder(
              //   borderSide: BorderSide(
              //     color: Color.fromRGBO(74, 77, 84, 0.2),
              //   ),
              // ),
              focusColor: buttonPrimary,
              focusedBorder: const OutlineInputBorder(
                //gapPadding: 16,
                borderSide: BorderSide(
                  color: buttonPrimary,
                ),
              ),
              errorStyle: const TextStyle(  color: Colors.red, fontSize: 10,),
              hintText: hintText,
              hintStyle: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Colors.grey),
              errorText: errorText,
            ),
          ),
        )
      ],
    );
  }
}