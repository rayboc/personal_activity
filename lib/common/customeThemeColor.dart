import 'package:flutter/material.dart';

// テーマ適用用カスタム色定義
class CustomeThemeColor {
  static const int _customeColorValue = 0xFFF8F8FF;
  static const MaterialColor customeColorSwatch =
      MaterialColor(_customeColorValue, <int, Color>{
    50: Color(0xFFF8F8FF),
    100: Color(0xFFF8F8FF),
    200: Color(0xFFF8F8FF),
    300: Color(0xFFF8F8FF),
    400: Color(0xFFF8F8FF),
    500: Color(_customeColorValue),
    700: Color(0xFFF8F8FF),
    800: Color(0xFFF8F8FF),
    900: Color(0xFFF8F8FF),
  });
}
