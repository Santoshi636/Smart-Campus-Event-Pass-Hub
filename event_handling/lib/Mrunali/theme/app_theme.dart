import 'package:flutter/material.dart';

class AppColors {
  // Dark header background & gradient
  static const Color darkBackground = Color(0xFF141720);
  static const Color darkSurface = Color(0xFF1E2330);
  static const Color darkSearch = Color(0xFF282D3C);

  // Vibrant accent
  static const Color primaryOrange = Color(0xFFFF5C38);
  static const Color secondaryOrange = Color(0xFFFF7E5F);
  static const Color heartRed = Color(0xFFFF3B30);

  // Light surfaces & backgrounds
  static const Color scaffoldBackground = Color(0xFFF6F8FB);
  static const Color cardWhite = Colors.white;
  static const Color chipBackground = Colors.white;

  // Text colors
  static const Color textDark = Color(0xFF1A1D28);
  static const Color textLight = Colors.white;
  static const Color textMuted = Color(0xFF8B92A2);
  static const Color textSubtle = Color(0xFFB5BAC7);

  // Border & divider
  static const Color borderLight = Color(0xFFE8EDF5);
  static const Color iconUnselected = Color(0xFF9EA4B3);

  // Legacy colors (kept for backward compatibility)
  static const Color primaryColor = Color(0xFF6C63FF);
  static const Color secondaryColor = Color(0xFFFF6584);
  static const Color backgroundColor = Color(0xFFF7F7FB);
  static const Color cardColor = Colors.white;
  static const Color textColor = Color(0xFF222222);
  static const Color greyColor = Color(0xFF777777);
}

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.scaffoldBackground,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primaryOrange,
        primary: AppColors.primaryOrange,
        surface: AppColors.cardWhite,
      ),
      fontFamily: 'Roboto',
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      textTheme: const TextTheme(
        headlineSmall: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: AppColors.textDark,
        ),
        titleLarge: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: AppColors.textDark,
        ),
        titleMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: AppColors.textDark,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          color: AppColors.textMuted,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryOrange,
          foregroundColor: Colors.white,
          minimumSize: const Size(double.infinity, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),),
      cardTheme: CardThemeData(
        color: AppColors.cardWhite,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
