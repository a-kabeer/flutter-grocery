import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

const FlexSchemeData myCustomScheme = FlexSchemeData(
  name: 'My Custom Scheme',
  description: 'A custom color scheme for the Grocery App.',
  light: FlexSchemeColor(
    primary: Color(0xFF53B175),
    primaryContainer: Color(0xFFA7D7C5),
    secondary: Color(0xFF005D57),
    secondaryContainer: Color(0xFF4BB6A9),
    tertiary: Color(0xFF8F7A66),
    tertiaryContainer: Color(0xFFD5C3B6),
  ),
  dark: FlexSchemeColor(
    primary: Color(0xFF53B175),
    primaryContainer: Color(0xFF1D5C47),
    secondary: Color(0xFF66A5A0),
    secondaryContainer: Color(0xFF004843),
    tertiary: Color(0xFF6E5646),
    tertiaryContainer: Color(0xFF423429),
  ),
);
