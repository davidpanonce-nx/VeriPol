import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../components/themes.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final scale = mockUpWidth / size.width;
    return Scaffold(
      backgroundColor: veripolColors.background,
      body: SizedBox(
        width: size.width,
        child: Stack(
          children: [
            Image.asset(
              'assets/bg_pattern.png',
              scale: scale,
            ),
            Positioned(
              top: 60 / mockUpHeight * size.height,
              left: 23 / mockUpWidth * size.width,
              child: Icon(
                Icons.arrow_back,
                color: const Color(0xff1F1F1F),
                size: 24 / mockUpWidth * size.width,
              ),
            ),
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                  top: 86 / mockUpHeight * size.height,
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
                        height: 38 / mockUpHeight * size.height,
                      ),
                      SizedBox(
                        width: 84 / mockUpWidth * size.width,
                        child: FittedBox(
                          child: Text(
                            "Sign Up",
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
                      SizedBox(
                        height: 65 / mockUpHeight * size.height,
                      ),
                      TextFormField(
                        cursorColor: veripolColors.nightSky,
                        cursorHeight: 16,
                        controller: _emailController,
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
                          contentPadding: EdgeInsets.fromLTRB(
                            14 / mockUpWidth * size.width,
                            28 / mockUpHeight * size.height,
                            14 / mockUpWidth * size.width,
                            28 / mockUpHeight * size.height,
                          ),
                          hintText: "Email",
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
                      SizedBox(
                        height: 14 / mockUpHeight * size.height,
                      ),
                      TextFormField(
                        cursorColor: veripolColors.nightSky,
                        cursorHeight: 16,
                        controller: _passwordController,
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
                          contentPadding: EdgeInsets.fromLTRB(
                            14 / mockUpWidth * size.width,
                            28 / mockUpHeight * size.height,
                            14 / mockUpWidth * size.width,
                            28 / mockUpHeight * size.height,
                          ),
                          hintText: "Password",
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
                      SizedBox(
                        height: 14 / mockUpHeight * size.height,
                      ),
                      TextFormField(
                        cursorColor: veripolColors.nightSky,
                        cursorHeight: 16,
                        controller: _confirmPasswordController,
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
                          contentPadding: EdgeInsets.fromLTRB(
                            14 / mockUpWidth * size.width,
                            28 / mockUpHeight * size.height,
                            14 / mockUpWidth * size.width,
                            28 / mockUpHeight * size.height,
                          ),
                          hintText: "Confirm Password",
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
                      SizedBox(
                        height: 120 / mockUpHeight * size.height,
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
                        height: 24 / mockUpHeight * size.height,
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
