import 'package:flutter/material.dart';

class TitleInput extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final Icon prefixIcon;
  final Function(String) validator;

  TitleInput(
      {Key? key,
      required this.hintText,
      required this.controller,
      required this.validator,
      required this.prefixIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (val) {
        return validator(val!);
      },
      decoration: InputDecoration(
          prefixIcon: prefixIcon,
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 2)),
          hintText: hintText ?? ""),
    );
  }
}
