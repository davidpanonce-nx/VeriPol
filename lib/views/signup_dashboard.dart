import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:veripol/components/themes.dart';
import 'package:veripol/main.dart';

import '../controller/page_controllers.dart';
import '../services/firebase_auth.dart';
import 'authentication/sign_in.dart';
import 'authentication/sign_up1.dart';

class SignupDashboard extends StatefulWidget {
  const SignupDashboard({
    Key? key,
    this.flag,
  }) : super(key: key);

  final int? flag;
  @override
  State<SignupDashboard> createState() => _SignupDashboardState();
}

class _SignupDashboardState extends State<SignupDashboard> {
  @override
  Widget build(BuildContext context) {
    final signInPageController = Provider.of<PageControllers>(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(
      children: [
        Image.asset('assets/bg_pattern.png'),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(),
            SizedBox(
              height: 240 / mockUpHeight * size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset('assets/veripol_logo.png'),
                  Column(
                    children: [
                      Text(
                        'VeriPol',
                        style: GoogleFonts.inter(
                          textStyle: const TextStyle(
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w700,
                            fontSize: 35,
                            height: 1.5,
                            letterSpacing: 0,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Text(
                        'Voters empowered by Data'.toUpperCase(),
                        style: GoogleFonts.inter(
                          textStyle: const TextStyle(
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            height: 1.5,
                            letterSpacing: 0,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              height: 240 / mockUpHeight * size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) => const SignUp1(),
                        ),
                      );
                    },
                    child: Container(
                      height: 60 / mockUpHeight * size.height,
                      decoration: BoxDecoration(
                        color: const Color(0xFF051923),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(
                          'SIGN UP',
                          style: GoogleFonts.inter(
                            textStyle: const TextStyle(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              height: 1.5,
                              letterSpacing: 0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account? ',
                          style: GoogleFonts.inter(
                            textStyle: const TextStyle(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              height: 1.5,
                              letterSpacing: 0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute<void>(
                                builder: (BuildContext context) => SignIn(
                                  flag: widget.flag,
                                ),
                              ),
                            );
                          },
                          child: Text(
                            'Sign in',
                            style: GoogleFonts.inter(
                              textStyle: const TextStyle(
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                height: 1.5,
                                letterSpacing: 0,
                                color: Color(0xFFEB4C4A),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const Divider(color: Color(0xFF818181), thickness: 1),
                  InkWell(
                    onTap: () async {
                      FirebaseAuthService service = FirebaseAuthService();
                      signInPageController.setIsGoogleAccount(true);

                      if (widget.flag != null) {
                        await service.signInWithGoogle().whenComplete(() {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: ((context) {
                            return const VeriPolAuthWrapper();
                          })));
                        });
                      } else {
                        await service.signInWithGoogle();
                      }
                    },
                    child: Container(
                      height: 60 / mockUpHeight * size.height,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.black, width: 2),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset("assets/google_logo.png"),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Text(
                                'SIGN UP WITH GOOGLE',
                                style: GoogleFonts.inter(
                                  textStyle: const TextStyle(
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    height: 1.5,
                                    letterSpacing: 0,
                                    color: Color(0xFF75777F),
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
            )
          ],
        )
      ],
    ));
  }
}
