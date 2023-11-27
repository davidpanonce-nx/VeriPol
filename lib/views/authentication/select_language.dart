import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:veripol/components/themes.dart';

class SelectLanguage extends StatelessWidget {
  const SelectLanguage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: veripolColors.background,
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Image.asset(
              'assets/bg_pattern.png',
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 88,
                bottom: 167,
                right: 10,
                left: 10,
              ),
              child: SizedBox(
                width: size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/veripol_logo.png',
                      width: 72,
                      height: 67,
                    ),
                    const SizedBox(
                      height: 78,
                    ),
                    SizedBox(
                      width: 142,
                      child: FittedBox(
                        child: Text(
                          "SELECT A",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.notoSans(
                            textStyle: const TextStyle(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w700,
                              fontSize: 32,
                              height: 0.80,
                              letterSpacing: 0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      width: 168,
                      child: FittedBox(
                        child: Text(
                          "LANGUAGE",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.notoSans(
                            textStyle: const TextStyle(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w700,
                              fontSize: 32,
                              height: 0.80,
                              letterSpacing: 0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 67,
                    ),
                    languageButton("Filipino", () {}, size),
                    const SizedBox(
                      height: 23,
                    ),
                    languageButton("Cebuano", () {}, size),
                    const SizedBox(
                      height: 23,
                    ),
                    languageButton("English", () {}, size),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  ElevatedButton languageButton(String lang, VoidCallback? onPress, Size size) {
    return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
        backgroundColor: veripolColors.nightSky,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: SizedBox(
        height: 70,
        child: Center(
          child: Text(
            lang,
            style: GoogleFonts.inter(
              textStyle: const TextStyle(
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w500,
                fontSize: 14,
                height: 0.7,
                letterSpacing: 0.1,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
