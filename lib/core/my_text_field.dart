import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String hintText;
  final int maxLine;
  final Color borderColor;
  final TextInputType? textInputType;
  final TextEditingController? controller;
  final void Function(String)? onChanged;

  const MyTextField({
    super.key,
    required this.hintText,
    required this.maxLine,
    this.textInputType,
    required this.borderColor,
    this.controller,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      keyboardType: textInputType,
      maxLines: maxLine,
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: hintText,
        hintStyle: const TextStyle(color: Color(0xff333333)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: borderColor)),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: borderColor)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: borderColor)),
      ),
    );
  }
}
