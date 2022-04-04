import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:veripol/controller/data_controller.dart';
import 'package:veripol/views/authentication/sign_up1.dart';
import 'package:veripol/views/dashboard_wrapper.dart';

import '../../components/loading.dart';
import '../../components/themes.dart';
import '../../controller/page_controllers.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool isLoading = false;
  bool obscurePassword = true;
  setLoading() {
    setState(() {
      isLoading = true;
    });
  }

  setObscure(val) {
    setState(() {
      obscurePassword = val;
    });
  }

  String signinRemarks = "";
  @override
  Widget build(BuildContext context) {
    final signInPageController = Provider.of<PageControllers>(context);
    final dataController = Provider.of<DataController>(context);
    final size = MediaQuery.of(context).size;
    final scale = mockUpWidth / size.width;
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
                    scale: scale,
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
                              height: 18 / mockUpHeight * size.height,
                            ),
                            SizedBox(
                              width: 245 / mockUpWidth * size.width,
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
                            SizedBox(
                              height: 85 / mockUpHeight * size.height,
                            ),
                            TextFormField(
                              cursorColor: veripolColors.nightSky,
                              cursorHeight: 16,
                              controller:
                                  signInPageController.signInEmailController,
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
                              obscureText: obscurePassword,
                              cursorColor: veripolColors.nightSky,
                              cursorHeight: 16,
                              controller:
                                  signInPageController.signInPasswordController,
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
                                        iconSize: 24 / mockUpWidth * size.width,
                                        icon: const Icon(
                                          Icons.visibility_off,
                                        ),
                                      )
                                    : IconButton(
                                        onPressed: () => setObscure(true),
                                        color: veripolColors.nightSky,
                                        iconSize: 24 / mockUpWidth * size.width,
                                        icon: const Icon(
                                          Icons.visibility,
                                        ),
                                      ),
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
                              height: 128 / mockUpHeight * size.height,
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Image.asset(
                                          "assets/google_logo.png",
                                          scale: scale,
                                        ),
                                        SizedBox(
                                          width: 162 / mockUpWidth * size.width,
                                          height:
                                              20 / mockUpHeight * size.height,
                                          child: FittedBox(
                                            child: Text(
                                              "SIGN UP WITH GOOGLE",
                                              textAlign: TextAlign.center,
                                              style: veripolTextStyles
                                                  .labelLarge
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
                            SizedBox(
                              height: 14 / mockUpHeight * size.height,
                            ),
                            ElevatedButton(
                              onPressed: signInPageController.validateSignIn()
                                  ? () async {
                                      setLoading();
                                      final response =
                                          await signInPageController.signin();
                                      if (response["response"] == 400) {
                                        setState(() {
                                          signinRemarks = response["data"];
                                        });
                                      } else {
                                        dataController.getUserName();
                                        Navigator.pop(context);
                                        Navigator.pop(context);
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute<void>(
                                            builder: (BuildContext context) =>
                                                const DashboardWrapper(),
                                          ),
                                        );
                                      }
                                    }
                                  : null,
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
                                        "SIGN IN",
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
                              width: 240 / mockUpWidth * size.width,
                              child: FittedBox(
                                child: Row(
                                  children: [
                                    Text(
                                      "Don’t have an Account yet?",
                                      style:
                                          veripolTextStyles.labelLarge.copyWith(
                                        color: Colors.black,
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute<void>(
                                            builder: (BuildContext context) =>
                                                const SignUp1(),
                                          ),
                                        );
                                      },
                                      child: Text(
                                        "Sign up",
                                        style: veripolTextStyles.labelLarge
                                            .copyWith(
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
                    top: 60 / mockUpHeight * size.height,
                    left: 23 / mockUpWidth * size.width,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: const Color(0xff1F1F1F),
                        size: 32 / mockUpWidth * size.width,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
