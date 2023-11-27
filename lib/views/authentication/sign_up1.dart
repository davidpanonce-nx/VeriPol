import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:veripol/views/authentication/sign_in.dart';

import '../../components/themes.dart';
import '../../controller/page_controllers.dart';
import 'sign_up2.dart';

class SignUp1 extends StatefulWidget {
  const SignUp1({Key? key}) : super(key: key);

  @override
  State<SignUp1> createState() => _SignUp1State();
}

class _SignUp1State extends State<SignUp1> {
  @override
  Widget build(BuildContext context) {
    final signupPageController = Provider.of<PageControllers>(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: veripolColors.background,
      body: SizedBox(
        width: size.width,
        child: Stack(
          children: [
            Image.asset(
              'assets/bg_pattern.png',
            ),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 86,
                  bottom: 30,
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
                      ),
                      const SizedBox(
                        height: 38,
                      ),
                      SizedBox(
                        width: 206,
                        child: FittedBox(
                          child: Text(
                            "What's your name?",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(
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
                      const SizedBox(
                        height: 65,
                      ),
                      TextFormField(
                        cursorColor: veripolColors.nightSky,
                        cursorHeight: 16,
                        controller: signupPageController.firstNameController,
                        style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            height: 1.0,
                            letterSpacing: 0.5,
                            color: veripolColors.nightSky,
                          ),
                        ),
                        decoration: InputDecoration(
                          isCollapsed: true,
                          contentPadding: const EdgeInsets.fromLTRB(
                            14,
                            28,
                            14,
                            28,
                          ),
                          hintText: "First Name",
                          hintStyle: GoogleFonts.openSans(
                            textStyle: const TextStyle(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              height: 1.0,
                              letterSpacing: 0.5,
                              color: Color(0xff44464E),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: BorderSide(
                              color: veripolColors.nightSky,
                              width: 2.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: BorderSide(
                              color: veripolColors.nightSky,
                              width: 2.0,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: BorderSide(
                              color: veripolColors.passionRed,
                              width: 2.0,
                            ),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: BorderSide(
                              color: veripolColors.passionRed,
                              width: 2.0,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      TextFormField(
                        cursorColor: veripolColors.nightSky,
                        cursorHeight: 16,
                        controller: signupPageController.lastNameController,
                        style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            height: 1.0,
                            letterSpacing: 0.5,
                            color: veripolColors.nightSky,
                          ),
                        ),
                        decoration: InputDecoration(
                          isCollapsed: true,
                          contentPadding: const EdgeInsets.fromLTRB(
                            14,
                            28,
                            14,
                            28,
                          ),
                          hintText: "Last Name",
                          hintStyle: GoogleFonts.openSans(
                            textStyle: const TextStyle(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              height: 1.0,
                              letterSpacing: 0.5,
                              color: Color(0xff44464E),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: BorderSide(
                              color: veripolColors.nightSky,
                              width: 2.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: BorderSide(
                              color: veripolColors.nightSky,
                              width: 2.0,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: BorderSide(
                              color: veripolColors.passionRed,
                              width: 2.0,
                            ),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: BorderSide(
                              color: veripolColors.passionRed,
                              width: 2.0,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      const SizedBox(
                        height: 120,
                      ),
                      ElevatedButton(
                        onPressed: signupPageController.validateSignup1()
                            ? () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute<void>(
                                    builder: (BuildContext context) => const SignUp2(),
                                  ),
                                );
                              }
                            : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: veripolColors.nightSky,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: SizedBox(
                          height: 60,
                          child: Center(
                            child: SizedBox(
                              width: 58,
                              child: FittedBox(
                                child: Text(
                                  "NEXT",
                                  style: veripolTextStyles.labelLarge.copyWith(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      SizedBox(
                        width: 255,
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
                                onPressed: () {
                                  signupPageController.clearControllers();
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute<void>(
                                      builder: (BuildContext context) => const SignIn(),
                                    ),
                                  );
                                },
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
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 60,
              left: 23,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.arrow_back,
                  color: Color(0xff1F1F1F),
                  size: 32,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
