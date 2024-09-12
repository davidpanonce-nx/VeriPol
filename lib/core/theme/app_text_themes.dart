import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppTextThemes {
  static const fontFamily = 'NotoSans';

  static TextTheme mainTextTheme() {
    return GoogleFonts.notoSansTextTheme(
      const TextTheme(
        displayLarge: TextStyle(
          fontSize: 36,
          height: 0.82,
          letterSpacing: 0,
          fontWeight: FontWeight.w800,
        ),
        displayMedium: TextStyle(
          fontSize: 32,
          height: 0.8,
          letterSpacing: 0,
          fontWeight: FontWeight.w600,
        ),
        displaySmall: TextStyle(
          fontSize: 28,
          height: 0.78,
          letterSpacing: 0,
          fontWeight: FontWeight.w400,
        ),
        headlineLarge: TextStyle(
          fontSize: 24,
          height: 0.75,
          letterSpacing: 0,
          fontWeight: FontWeight.w800,
        ),
        headlineMedium: TextStyle(
          fontSize: 22,
          height: 0.75,
          letterSpacing: 0,
          fontWeight: FontWeight.w600,
        ),
        headlineSmall: TextStyle(
          fontSize: 20,
          height: 0.75,
          letterSpacing: 0,
          fontWeight: FontWeight.w400,
        ),
        titleLarge: TextStyle(
          fontSize: 18,
          height: 0.67,
          letterSpacing: 0.1,
          fontWeight: FontWeight.w800,
        ),
        titleMedium: TextStyle(
          fontSize: 16,
          height: 0.67,
          letterSpacing: 0.1,
          fontWeight: FontWeight.w600,
        ),
        titleSmall: TextStyle(
          fontSize: 14,
          height: 0.7,
          letterSpacing: 0.1,
          fontWeight: FontWeight.w400,
        ),
        labelLarge: TextStyle(
          fontSize: 16,
          height: 0.7,
          letterSpacing: 0.1,
          fontWeight: FontWeight.w800,
        ),
        labelMedium: TextStyle(
          fontSize: 14,
          height: 0.7,
          letterSpacing: 0.1,
          fontWeight: FontWeight.w600,
        ),
        labelSmall: TextStyle(
          fontSize: 12,
          height: 0.75,
          letterSpacing: 0.5,
          fontWeight: FontWeight.w400,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          height: 0.67,
          letterSpacing: 0.5,
          fontWeight: FontWeight.w800,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          height: 0.67,
          letterSpacing: 0.5,
          fontWeight: FontWeight.w600,
        ),
        bodySmall: TextStyle(
          fontSize: 12,
          height: 0.67,
          letterSpacing: 0.5,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
