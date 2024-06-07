import 'package:flutter/material.dart';

class AppColor {
  static const Map<int, Color> _greenSwatch = {
    50: Color.fromRGBO(83, 177, 117, .1),
    100: Color.fromRGBO(83, 177, 117, .2),
    200: Color.fromRGBO(83, 177, 117, .3),
    300: Color.fromRGBO(83, 177, 117, .4),
    400: Color.fromRGBO(83, 177, 117, .5),
    500: Color.fromRGBO(83, 177, 117, .6),
    600: Color.fromRGBO(83, 177, 117, .7),
    700: Color.fromRGBO(83, 177, 117, .8),
    800: Color.fromRGBO(83, 177, 117, .9),
    900: Color.fromRGBO(83, 177, 117, 1),
  };
  static const MaterialColor greenSwatch =
      MaterialColor(0xFF53B175, _greenSwatch);
}
