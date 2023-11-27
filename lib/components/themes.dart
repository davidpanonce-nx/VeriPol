import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

VeripolColors veripolColors = VeripolColors();
ThemeData veripolTheme = VeripolTheme().lighTheme;
VeripolTextStyles veripolTextStyles = VeripolTextStyles();

const mockUpHeight = 812;
const mockUpWidth = 375;

@immutable
class VeripolColors {
  final Color background = const Color(0xffF4F4E8);
  final Color sunYellow = const Color(0xffF6C15C);
  final Color passionRed = const Color(0xffEB4C4A);
  final Color blueTrust = const Color(0xff343780);
  final Color nightSky = const Color(0xff051923);
  final Color ivoryWhite = const Color(0xffF6F7EB);
  final Color darkRedPassion = const Color(0xffBC3D3B);
  final Color darkSunYellow = const Color(0xffC59A4A);
  final Color sunYellowVar = const Color(0xffC8A151);
}

class VeripolTheme {
  VeripolTheme();

  ThemeData get lighTheme {
    return ThemeData(
      brightness: Brightness.light,
      textTheme: TextTheme(
        displayLarge: GoogleFonts.notoSans(
          textStyle: const TextStyle(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w400,
            fontSize: 36,
            height: 0.82,
            letterSpacing: 0,
          ),
        ),
        displayMedium: GoogleFonts.notoSans(
          textStyle: const TextStyle(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w400,
            fontSize: 32,
            height: 0.8,
            letterSpacing: 0,
          ),
        ),
        displaySmall: GoogleFonts.notoSans(
          textStyle: const TextStyle(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w400,
            fontSize: 28,
            height: 0.78,
            letterSpacing: 0,
          ),
        ),
        headlineMedium: GoogleFonts.notoSans(
          textStyle: const TextStyle(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w400,
            fontSize: 24,
            height: 0.75,
            letterSpacing: 0,
          ),
        ),
        headlineSmall: GoogleFonts.notoSans(
          textStyle: const TextStyle(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w400,
            fontSize: 22,
            height: 0.79,
            letterSpacing: 0,
          ),
        ),
        titleLarge: GoogleFonts.notoSans(
          textStyle: const TextStyle(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w400,
            fontSize: 18,
            height: 0.75,
            letterSpacing: 0,
          ),
        ),

        /* SUBTITLE FONT STYLES */

        titleMedium: GoogleFonts.notoSans(
          textStyle: const TextStyle(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w500,
            fontSize: 16,
            height: 0.67,
            letterSpacing: 0.1,
          ),
        ),
        titleSmall: GoogleFonts.notoSans(
          textStyle: const TextStyle(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w500,
            fontSize: 14,
            height: 0.7,
            letterSpacing: 0.1,
          ),
        ),

        /* BUTTON FONT STYLES */

        labelLarge: GoogleFonts.notoSans(
          textStyle: const TextStyle(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w500,
            fontSize: 14,
            height: 0.7,
            letterSpacing: 0.1,
          ),
        ),
        bodyLarge: GoogleFonts.notoSans(
          textStyle: const TextStyle(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w400,
            fontSize: 16,
            height: 0.67,
            letterSpacing: 0.5,
          ),
        ),
        bodyMedium: GoogleFonts.notoSans(
          textStyle: const TextStyle(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w400,
            fontSize: 14,
            height: 0.7,
            letterSpacing: 0.25,
          ),
        ),

        /* CAPTION FONT STYLE */

        bodySmall: GoogleFonts.notoSans(
          textStyle: const TextStyle(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w400,
            fontSize: 12,
            height: 0.75,
            letterSpacing: 0.4,
          ),
        ),

        /* OVERLINE FONT STYLES */

        labelSmall: GoogleFonts.notoSans(
          textStyle: const TextStyle(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w500,
            fontSize: 12,
            height: 0.75,
            letterSpacing: 0.5,
          ),
        ),
      ),
    );
  }
}

class VeripolTextStyles {
  /* DISPLAY FONT STYLES */

  final TextStyle displayLarge = GoogleFonts.notoSans(
    textStyle: const TextStyle(
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      fontSize: 57,
      height: 0.89,
      letterSpacing: -0.25,
    ),
  );
  final displayMedium = GoogleFonts.notoSans(
    textStyle: const TextStyle(
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      fontSize: 57,
      height: 0.89,
      letterSpacing: -0.25,
    ),
  );
  final displaySmall = GoogleFonts.notoSans(
    textStyle: const TextStyle(
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      fontSize: 36,
      height: 0.82,
      letterSpacing: 0,
    ),
  );

  /* HEADLINE FONT STYLES */

  final TextStyle headlineLarge = GoogleFonts.notoSans(
    textStyle: const TextStyle(
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      fontSize: 32,
      height: 1.25,
      letterSpacing: 0,
    ),
  );
  final TextStyle headlineMedium = GoogleFonts.notoSans(
    textStyle: const TextStyle(
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      fontSize: 28,
      height: 1.3,
      letterSpacing: 0,
    ),
  );
  final TextStyle headlineSmall = GoogleFonts.notoSans(
    textStyle: const TextStyle(
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      fontSize: 24,
      height: 1.33,
      letterSpacing: 0,
    ),
  );

  /* TITLE FONT STYLES */

  final TextStyle titleLarge = GoogleFonts.notoSans(
    textStyle: const TextStyle(
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      fontSize: 22,
      height: 1.27,
      letterSpacing: 0,
    ),
  );
  final TextStyle titleMedium = GoogleFonts.notoSans(
    textStyle: const TextStyle(
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w500,
      fontSize: 16,
      height: 1.5,
      letterSpacing: 0.1,
    ),
  );
  final TextStyle titleSmall = GoogleFonts.notoSans(
    textStyle: const TextStyle(
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w500,
      fontSize: 14,
      height: 1.43,
      letterSpacing: 0.1,
    ),
  );

  /* LABEL FONT STYLES */

  final TextStyle labelLarge = GoogleFonts.notoSans(
    textStyle: const TextStyle(
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w500,
      fontSize: 16,
      height: 1.43,
      letterSpacing: 0.1,
    ),
  );
  final TextStyle labelMedium = GoogleFonts.notoSans(
    textStyle: const TextStyle(
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w500,
      fontSize: 12,
      height: 1.33,
      letterSpacing: 0.5,
    ),
  );
  final TextStyle labelSmall = GoogleFonts.inter(
    textStyle: const TextStyle(
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w500,
      fontSize: 11,
      height: 1.45,
      letterSpacing: 0.5,
    ),
  );

  /* BODY FONT STYLES */

  final TextStyle bodyLarge = GoogleFonts.notoSans(
    textStyle: const TextStyle(
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      fontSize: 16,
      height: 1.5,
      letterSpacing: 0.5,
    ),
  );
  final TextStyle bodyMedium = GoogleFonts.notoSans(
    textStyle: const TextStyle(
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      fontSize: 14,
      height: 1.43,
      letterSpacing: 0.25,
    ),
  );
  final TextStyle bodySmall = GoogleFonts.notoSans(
    textStyle: const TextStyle(
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      fontSize: 12,
      height: 1.5,
      letterSpacing: 0.4,
    ),
  );
}
