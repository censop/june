import 'package:flutter/material.dart';

class MyTheme {

  static const String interFont = "Inter";

  static const Color primaryColor = Color(0xFF1D8EF5);
  static const Color secondaryColor = Color(0xFFF8FAFC);
  static const Color tertiaryColor = Color(0xFFE2E8F0);
  static const Color neutralColor = Color(0xFF1E293B);

  // static final TextTheme _baseTextTheme = TextTheme(); //will fill it when ui is finalized

  static final ColorScheme lightScheme = ColorScheme.fromSeed(
    seedColor: primaryColor,
    primary: primaryColor,
    secondary: secondaryColor,
    tertiary: tertiaryColor,
    onSurface: neutralColor,
  );

  static ThemeData lightTheme = ThemeData(
    fontFamily: interFont,
    colorScheme: lightScheme
  );
}