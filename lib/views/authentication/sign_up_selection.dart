import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:veripol/views/authentication/sign_in.dart';
import 'package:veripol/views/authentication/sign_up1.dart';

import '../../components/themes.dart';
import '../../controller/page_controllers.dart';
import '../../services/firebase_auth.dart';

class SignUpSelection extends StatefulWidget {
  const SignUpSelection({Key? key}) : super(key: key);

  @override
  State<SignUpSelection> createState() => _SignUpSelectionState();
}

class _SignUpSelectionState extends State<SignUpSelection> {
  @override
  Widget build(BuildContext context) {
    final signInPageController = Provider.of<PageControllers>(context);

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
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 123,
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
                        width: 79,
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
                      const SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        width: 245,
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
                      const SizedBox(
                        height: 200,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) => const SignUp1(),
                            ),
                          );
                        },
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
                        height: 44,
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
                                  Navigator.push(
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
                      const SizedBox(
                        height: 42,
                      ),
                      const Divider(
                        color: Color(0xff818181),
                        thickness: 1,
                      ),
                      const SizedBox(
                        height: 22,
                      ),
                      InkWell(
                        onTap: () async {
                          FirebaseAuthService service = FirebaseAuthService();
                          signInPageController.setIsGoogleAccount(true);
                          await service.signInWithGoogle();
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
                                        "SIGN UP WITH GOOGLE",
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
