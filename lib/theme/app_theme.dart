import 'package:flutter/material.dart';

class AppTheme {
  static const Color black = Color(0xFF1A1A1A);
  static const Color white = Color(0xFFFFFFFF);
  static const Color lightGrey = Color(0xFFF5F5F5);
  static const Color borderGrey = Color(0xFFE0E0E0);
  static const Color textGrey = Color(0xFF9E9E9E);
  static const Color textDark = Color(0xFF212121);
  static const Color subtitleGrey = Color(0xFF757575);

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      fontFamily: 'Georgia',
      scaffoldBackgroundColor: const Color(0xFFF2F2F2),
      colorScheme: ColorScheme.fromSeed(
        seedColor: black,
        brightness: Brightness.light,
      ),
    );
  }
}
