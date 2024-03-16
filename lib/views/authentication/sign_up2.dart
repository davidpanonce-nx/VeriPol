import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:veripol/main_common.dart';

import '../../components/loading.dart';
import '../../components/themes.dart';
import '../../controller/page_controllers.dart';
import 'sign_in.dart';

class SignUp2 extends StatefulWidget {
  const SignUp2({Key? key}) : super(key: key);

  @override
  State<SignUp2> createState() => _SignUp2State();
}

class _SignUp2State extends State<SignUp2> {
  bool obscurePassword = true;
  bool obscureConfirmPassword = true;
  bool isLoading = false;

  setObscurePassword(val) {
    setState(() {
      obscurePassword = val;
    });
  }

  setObscureConfirmPassword(val) {
    setState(() {
      obscureConfirmPassword = val;
    });
  }

  setLoading(val) {
    setState(() {
      isLoading = true;
    });
  }

  String signupRemark = "";
  @override
  Widget build(BuildContext context) {
    final signupPageController = Provider.of<PageControllers>(context);
    final size = MediaQuery.of(context).size;
    return isLoading
        ? const LoadingScreen()
        : Scaffold(
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
                              width: 84,
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
                            const SizedBox(
                              height: 65,
                            ),
                            TextFormField(
                              cursorColor: veripolColors.nightSky,
                              cursorHeight: 16,
                              controller: signupPageController.emailController,
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
                            const SizedBox(
                              height: 14,
                            ),
                            TextFormField(
                              obscureText: obscurePassword,
                              cursorColor: veripolColors.nightSky,
                              cursorHeight: 16,
                              controller: signupPageController.passwordController,
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
                                suffixIcon: obscurePassword
                                    ? IconButton(
                                        onPressed: () => setObscurePassword(false),
                                        color: veripolColors.nightSky,
                                        iconSize: 24,
                                        icon: const Icon(
                                          Icons.visibility_off,
                                        ),
                                      )
                                    : IconButton(
                                        onPressed: () => setObscurePassword(true),
                                        color: veripolColors.nightSky,
                                        iconSize: 24,
                                        icon: const Icon(
                                          Icons.visibility,
                                        ),
                                      ),
                                isCollapsed: true,
                                contentPadding: const EdgeInsets.fromLTRB(
                                  14,
                                  28,
                                  14,
                                  28,
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
                            const SizedBox(
                              height: 14,
                            ),
                            TextFormField(
                              obscureText: obscureConfirmPassword,
                              cursorColor: veripolColors.nightSky,
                              cursorHeight: 16,
                              controller: signupPageController.confirmPasswordController,
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
                                suffixIcon: obscureConfirmPassword
                                    ? IconButton(
                                        onPressed: () => setObscureConfirmPassword(false),
                                        color: veripolColors.nightSky,
                                        iconSize: 24,
                                        icon: const Icon(
                                          Icons.visibility_off,
                                        ),
                                      )
                                    : IconButton(
                                        onPressed: () => setObscureConfirmPassword(true),
                                        color: veripolColors.nightSky,
                                        iconSize: 24,
                                        icon: const Icon(
                                          Icons.visibility,
                                        ),
                                      ),
                                isCollapsed: true,
                                contentPadding: const EdgeInsets.fromLTRB(
                                  14,
                                  28,
                                  14,
                                  28,
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
                            signupRemark != ""
                                ? SizedBox(
                                    height: 120,
                                    child: Center(
                                      child: Text(
                                        signupRemark,
                                        style: veripolTextStyles.labelLarge.copyWith(
                                          color: veripolColors.passionRed,
                                        ),
                                      ),
                                    ),
                                  )
                                : const SizedBox(
                                    height: 128,
                                  ),
                            ElevatedButton(
                              onPressed: signupPageController.validateSignup2()
                                  ? () async {
                                      setLoading(true);
                                      signupPageController.setIsGoogleAccount(false);
                                      final response = await signupPageController.signup();
                                      if (response["response"] == 400) {
                                        setState(() {
                                          signupRemark = response["data"];
                                          isLoading = false;
                                        });
                                      } else {
                                        if (mounted) {
                                          Navigator.pushReplacement(context,
                                              MaterialPageRoute(builder: (context) => const VeriPolAuthWrapper()));
                                        }
                                      }
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
                                        "SIGN UP",
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
                        size: 24,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
