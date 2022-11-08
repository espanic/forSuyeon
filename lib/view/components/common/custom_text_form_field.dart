import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String label;
  final onSaved;
  final validator;
  final initialValue;
  final controller;
  final bool enabled;
  final bool autoFocus;

  const CustomTextFormField({
    Key? key,
    required this.label,
    this.enabled = true,
    this.onSaved,
    this.controller,
    this.validator, this.initialValue,  this.autoFocus = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          TextFormField(
            initialValue: initialValue,
            controller: controller,
            onSaved: onSaved,
            validator: validator,
            enabled: enabled,
            autofocus: autoFocus,

          )
        ],
      ),
    );
  }
}
