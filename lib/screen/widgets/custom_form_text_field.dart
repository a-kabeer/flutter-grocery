import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final bool? obscureText;
  final String? Function(String?)? validator;
  final AutovalidateMode? autovalidateMode;
  final FocusNode? focusNode;
  final String? errorText;
  const CustomTextFormField(
      {super.key,
      required this.controller,
      this.hintText,
      this.validator,
      this.obscureText,
      this.autovalidateMode,
      this.focusNode,
      this.errorText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        errorText: errorText,
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(),
        ),
      ),
      obscureText: obscureText ?? false,
      validator: validator,
      autovalidateMode: autovalidateMode,
      focusNode: focusNode,
    );
  }
}
