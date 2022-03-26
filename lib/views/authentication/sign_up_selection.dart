import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../components/themes.dart';

class SignUpSelection extends StatelessWidget {
  const SignUpSelection({Key? key}) : super(key: key);

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
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                  top: 123 / mockUpHeight * size.height,
                  bottom: 30 / mockUpHeight * size.height,
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
                        scale: scale,
                      ),
                      SizedBox(
                        height: 18 / mockUpHeight * size.height,
                      ),
                      SizedBox(
                        width: 79 / mockUpWidth * size.width,
                        child: FittedBox(
                          child: Text(
                            "VeriPol",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.openSans(
                              textStyle: const TextStyle(
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w700,
                                fontSize: 22,
                                height: 0.79,
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
                        width: 245 / mockUpWidth * size.width,
                        child: FittedBox(
                          child: Text(
                            "Truth in Politics, People, and Power",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.notoSerif(
                              textStyle: const TextStyle(
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w300,
                                fontSize: 15,
                                height: 0.54,
                                letterSpacing: 0,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 200 / mockUpHeight * size.height,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary: veripolColors.nightSky,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: SizedBox(
                          height: 60 / mockUpHeight * size.height,
                          child: Center(
                            child: SizedBox(
                              width: 58 / mockUpWidth * size.width,
                              child: FittedBox(
                                child: Text(
                                  "SIGN UP",
                                  style: veripolTextStyles.labelLarge
                                      .copyWith(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 44 / mockUpHeight * size.height,
                      ),
                      SizedBox(
                        width: 255 / mockUpWidth * size.width,
                        child: FittedBox(
                          child: Row(
                            children: [
                              Text(
                                "Already have an account?",
                                style: veripolTextStyles.labelLarge.copyWith(
                                  color: Colors.black,
                                ),
                              ),
                              TextButton(
                                onPressed: null,
                                child: Text(
                                  "Sign in",
                                  style: veripolTextStyles.labelLarge.copyWith(
                                    color: veripolColors.passionRed,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 42 / mockUpHeight * size.height,
                      ),
                      const Divider(
                        color: Color(0xff818181),
                        thickness: 1,
                      ),
                      SizedBox(
                        height: 22 / mockUpHeight * size.height,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: 60 / mockUpHeight * size.height,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 2,
                              color: veripolColors.nightSky,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: SizedBox(
                              width: 204 / mockUpWidth * size.width,
                              height: 25 / mockUpHeight * size.height,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Image.asset(
                                    "assets/google_logo.png",
                                    scale: scale,
                                  ),
                                  SizedBox(
                                    width: 162 / mockUpWidth * size.width,
                                    height: 20 / mockUpHeight * size.height,
                                    child: FittedBox(
                                      child: Text(
                                        "SIGN UP WITH GOOGLE",
                                        textAlign: TextAlign.center,
                                        style: veripolTextStyles.labelLarge
                                            .copyWith(
                                          color: const Color(0xff75777F),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
