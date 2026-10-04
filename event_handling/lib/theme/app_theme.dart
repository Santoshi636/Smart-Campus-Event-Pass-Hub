import 'package:flutter/material.dart';

/// Central color palette used across the app.
class AppColors {
  AppColors._();

  static const Color primaryOrange     = Color(0xFFFF6B35);
  static const Color heartRed          = Color(0xFFE53935);
  static const Color darkBackground    = Color(0xFF0F1117);
  static const Color scaffoldBackground = Color(0xFFF7F7FB);
  static const Color textDark          = Color(0xFF1A1A2E);
  static const Color textMuted         = Color(0xFF7A7A9D);
}

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    primarySwatch: Colors.deepPurple,
    scaffoldBackgroundColor: AppColors.scaffoldBackground,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.deepPurple,
      primary: const Color(0xFF4A00E0),
      secondary: const Color(0xFF8E2DE2),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF4A00E0),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        padding: const EdgeInsets.symmetric(vertical: 14),
      ),
    ),
  );
}
