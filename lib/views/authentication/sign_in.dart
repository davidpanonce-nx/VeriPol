import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:veripol/components/loading.dart';
import 'package:veripol/core/routes.dart';
import 'package:veripol/core/routing_transitions.dart';
import 'package:veripol/services/firebase_auth.dart';

import '../../components/themes.dart';
import '../../controller/page_controllers.dart';
import '../../main_common.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key, this.flag}) : super(key: key);

  final int? flag;
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool isLoading = false;
  bool obscurePassword = true;

  setObscure(val) {
    setState(() {
      obscurePassword = val;
    });
  }

  setLoading(val) {
    setState(() {
      isLoading = true;
    });
  }

  String signinRemarks = "";
  @override
  Widget build(BuildContext context) {
    final signInPageController = Provider.of<PageControllers>(context);

    final size = MediaQuery.of(context).size;
    return isLoading
        ? const LoadingScreen()
        : Scaffold(
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
                              height: 18,
                            ),
                            SizedBox(
                              width: 245,
                              child: FittedBox(
                                child: Text(
                                  "Log in to your account",
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
                            const SizedBox(
                              height: 85,
                            ),
                            TextFormField(
                              cursorColor: veripolColors.nightSky,
                              cursorHeight: 16,
                              controller: signInPageController.signInEmailController,
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
                              controller: signInPageController.signInPasswordController,
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
                                        onPressed: () => setObscure(false),
                                        color: veripolColors.nightSky,
                                        iconSize: 24,
                                        icon: const Icon(
                                          Icons.visibility_off,
                                        ),
                                      )
                                    : IconButton(
                                        onPressed: () => setObscure(true),
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
                            signinRemarks != ""
                                ? SizedBox(
                                    height: 128,
                                    child: Center(
                                      child: Text(
                                        signinRemarks,
                                        style: veripolTextStyles.labelLarge.copyWith(
                                          color: veripolColors.passionRed,
                                        ),
                                      ),
                                    ),
                                  )
                                : const SizedBox(
                                    height: 128,
                                  ),
                            InkWell(
                              onTap: () async {
                                FirebaseAuthService service = FirebaseAuthService();
                                signInPageController.setIsGoogleAccount(true);

                                if (widget.flag != null) {
                                  await service.signInWithGoogle();
                                  setLoading(true);
                                  Future.delayed(const Duration(seconds: 1)).whenComplete(
                                    () => Navigator.pop(context),
                                  );
                                } else {
                                  await service.signInWithGoogle().whenComplete(() {
                                    setLoading(true);
                                    Navigator.pushReplacement(context, MaterialPageRoute(builder: ((context) {
                                      return const VeriPolAuthWrapper();
                                    })));
                                  });
                                }
                              },
                              child: Container(
                                height: 60,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 2,
                                    color: veripolColors.nightSky,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: SizedBox(
                                    width: 204,
                                    height: 25,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Image.asset(
                                          "assets/google_logo.png",
                                        ),
                                        SizedBox(
                                          width: 162,
                                          height: 20,
                                          child: FittedBox(
                                            child: Text(
                                              "SIGN IN WITH GOOGLE",
                                              textAlign: TextAlign.center,
                                              style: veripolTextStyles.labelLarge.copyWith(
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
                            const SizedBox(
                              height: 14,
                            ),
                            ElevatedButton(
                              onPressed: signInPageController.validateSignIn()
                                  ? () async {
                                      signInPageController.setIsGoogleAccount(false);
                                      setLoading(true);
                                      final response = await signInPageController.signin();
                                      if (response["response"] == 400) {
                                        setState(() {
                                          signinRemarks = response["data"];
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
                                        "SIGN IN",
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
                              width: 240,
                              child: FittedBox(
                                child: Row(
                                  children: [
                                    Text(
                                      "Don’t have an Account yet?",
                                      style: veripolTextStyles.labelLarge.copyWith(
                                        color: Colors.black,
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () =>
                                          context.pushReplacementNamed(Routes.signUp, extra: RoutingType.fade),
                                      child: Text(
                                        "Sign up",
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
                      onTap: () => context.pop(),
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
