import 'package:flutter/material.dart';
import 'package:grocerystacked/utils/app_color.dart';

class GlobalTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final bool? obscureText;
  final String? Function(String?)? validator;
  final AutovalidateMode? autovalidateMode;
  final FocusNode? focusNode;
  final String? errorText;
  const GlobalTextFormField(
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
          borderSide: BorderSide(),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: AppColor.secondary,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: AppColor.primary,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: AppColor.error,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: AppColor.outline,
          ),
        ),
      ),
      obscureText: obscureText ?? false,
      validator: validator,
      autovalidateMode: autovalidateMode,
      focusNode: focusNode,
    );
  }
}
