import 'package:flutter/material.dart';

class AppTypography {
  static const String fontFamily = 'Tajawal'; // Ideal for Arabic + English

  static const TextTheme lightTextTheme = TextTheme(
    displayLarge: TextStyle(fontFamily: fontFamily, fontSize: 32, fontWeight: FontWeight.bold),
    displayMedium: TextStyle(fontFamily: fontFamily, fontSize: 28, fontWeight: FontWeight.bold),
    displaySmall: TextStyle(fontFamily: fontFamily, fontSize: 24, fontWeight: FontWeight.bold),
    headlineMedium: TextStyle(fontFamily: fontFamily, fontSize: 20, fontWeight: FontWeight.w600),
    titleLarge: TextStyle(fontFamily: fontFamily, fontSize: 18, fontWeight: FontWeight.w600),
    bodyLarge: TextStyle(fontFamily: fontFamily, fontSize: 16, fontWeight: FontWeight.normal),
    bodyMedium: TextStyle(fontFamily: fontFamily, fontSize: 14, fontWeight: FontWeight.normal),
    labelLarge: TextStyle(fontFamily: fontFamily, fontSize: 14, fontWeight: FontWeight.w600),
  );

  static const TextTheme darkTextTheme = lightTextTheme; // Colors will be applied via theme
}
