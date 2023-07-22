import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:veripol/components/themes.dart';

class SelectLanguage extends StatelessWidget {
  const SelectLanguage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final scale = mockUpWidth / size.width;
    return Scaffold(
      backgroundColor: veripolColors.background,
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Image.asset(
              'assets/bg_pattern.png',
              scale: scale,
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 88 / mockUpHeight * size.height,
                bottom: 167 / mockUpHeight * size.height,
                right: 10 / mockUpWidth * size.width,
                left: 10 / mockUpWidth * size.width,
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
                      scale: scale,
                    ),
                    SizedBox(
                      height: 78 / mockUpHeight * size.height,
                    ),
                    SizedBox(
                      width: 142 / mockUpWidth * size.width,
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
                    SizedBox(
                      height: 15 / mockUpHeight * size.height,
                    ),
                    SizedBox(
                      width: 168 / mockUpWidth * size.width,
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
                    SizedBox(
                      height: 67 / mockUpHeight * size.height,
                    ),
                    languageButton("Filipino", () {}, size),
                    SizedBox(
                      height: 23 / mockUpHeight * size.height,
                    ),
                    languageButton("Cebuano", () {}, size),
                    SizedBox(
                      height: 23 / mockUpHeight * size.height,
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
        height: 70 / mockUpHeight * size.height,
        child: Center(
          child: Text(
            lang,
            textScaleFactor: size.width / mockUpWidth,
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
