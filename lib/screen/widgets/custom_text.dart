import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String? text;
  final Color? color;
  final double? fontSize;
  final FontStyle? fontStyle;
  final String? fontFamily;
  final FontWeight? fontWeight;
  const CustomText(
      {super.key,
      required this.text,
      this.color,
      this.fontSize,
      this.fontStyle,
      this.fontFamily,
      this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? '',
      style: TextStyle(
          color: color ?? Colors.white,
          fontSize: fontSize,
          fontStyle: fontStyle,
          fontFamily: fontFamily,
          fontWeight: fontWeight),
    );
  }
}
