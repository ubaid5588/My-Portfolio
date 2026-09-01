import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_constants.dart';

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.darkBackground,
      fontFamily: AppConstants.fontSans,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.accentBlue,
        secondary: AppColors.accentViolet,
        surface: AppColors.darkBackground,
      ),
      textTheme: const TextTheme(
        headlineLarge: TextStyle(
          fontFamily: AppConstants.fontSans,
          fontWeight: FontWeight.bold,
          color: AppColors.darkTextPrimary,
          letterSpacing: -0.02,
        ),
        headlineMedium: TextStyle(
          fontFamily: AppConstants.fontSans,
          fontWeight: FontWeight.bold,
          color: AppColors.darkTextPrimary,
          letterSpacing: -0.02,
        ),
        titleLarge: TextStyle(
          fontFamily: AppConstants.fontSans,
          fontWeight: FontWeight.w600,
          color: AppColors.darkTextPrimary,
        ),
        bodyLarge: TextStyle(
          fontFamily: AppConstants.fontSans,
          color: AppColors.darkTextSecondary,
          height: 1.6,
        ),
        bodyMedium: TextStyle(
          fontFamily: AppConstants.fontSans,
          color: AppColors.darkTextSecondary,
          height: 1.5,
        ),
        labelSmall: TextStyle(
          fontFamily: AppConstants.fontMono,
          color: AppColors.darkTextMuted,
          letterSpacing: 1.2,
        ),
      ),
    );
  }

  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.lightBackground,
      fontFamily: AppConstants.fontSans,
      colorScheme: const ColorScheme.light(
        primary: AppColors.accentBlue,
        secondary: AppColors.accentViolet,
        surface: AppColors.lightCardBackground,
      ),
      textTheme: const TextTheme(
        headlineLarge: TextStyle(
          fontFamily: AppConstants.fontSans,
          fontWeight: FontWeight.bold,
          color: AppColors.lightTextPrimary,
          letterSpacing: -0.02,
        ),
        headlineMedium: TextStyle(
          fontFamily: AppConstants.fontSans,
          fontWeight: FontWeight.bold,
          color: AppColors.lightTextPrimary,
          letterSpacing: -0.02,
        ),
        titleLarge: TextStyle(
          fontFamily: AppConstants.fontSans,
          fontWeight: FontWeight.w600,
          color: AppColors.lightTextPrimary,
        ),
        bodyLarge: TextStyle(
          fontFamily: AppConstants.fontSans,
          color: AppColors.lightTextSecondary,
          height: 1.6,
        ),
        bodyMedium: TextStyle(
          fontFamily: AppConstants.fontSans,
          color: AppColors.lightTextSecondary,
          height: 1.5,
        ),
        labelSmall: TextStyle(
          fontFamily: AppConstants.fontMono,
          color: AppColors.lightTextMuted,
          letterSpacing: 1.2,
        ),
      ),
    );
  }
}
