import 'package:flutter/material.dart';
import 'package:veripol/core/theme/app_colors.dart';
import 'package:veripol/core/theme/app_text_themes.dart';

abstract class AppThemes {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      fontFamily: AppTextThemes.fontFamily,
      scaffoldBackgroundColor: AppColors.background,
      appBarTheme: _appBarTheme(),
      outlinedButtonTheme: _outlinedButtonTheme(),
      elevatedButtonTheme: _elevatedButtonTheme(),
    );
  }

  static AppBarTheme _appBarTheme() {
    return const AppBarTheme(
      backgroundColor: AppColors.background,
      surfaceTintColor: AppColors.background,
    );
  }

  static OutlinedButtonThemeData _outlinedButtonTheme() {
    return OutlinedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: const WidgetStatePropertyAll(AppColors.transparent),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        padding: const WidgetStatePropertyAll(EdgeInsets.symmetric(vertical: 18)),
        minimumSize: const WidgetStatePropertyAll(Size(double.infinity, 60)),
        elevation: const WidgetStatePropertyAll(0),
      ),
    );
  }

  static ElevatedButtonThemeData _elevatedButtonTheme() {
    return ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: const WidgetStatePropertyAll(AppColors.nightSky),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        padding: const WidgetStatePropertyAll(EdgeInsets.symmetric(vertical: 20)),
        minimumSize: const WidgetStatePropertyAll(Size(double.infinity, 60)),
        elevation: const WidgetStatePropertyAll(0),
      ),
    );
  }
}
