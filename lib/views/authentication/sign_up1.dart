import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:veripol/common/background_scaffold.dart';
import 'package:veripol/core/extensions/build_extensions.dart';
import 'package:veripol/core/routes/routes.dart';
import 'package:veripol/core/routes/routing_transitions.dart';
import 'package:veripol/core/theme/app_colors.dart';

import '../../components/themes.dart';
import '../../controller/page_controllers.dart';
import 'sign_up2.dart';

class SignUp1 extends StatefulWidget {
  const SignUp1({super.key});

  @override
  State<SignUp1> createState() => _SignUp1State();
}

class _SignUp1State extends State<SignUp1> {
  @override
  Widget build(BuildContext context) {
    final signupPageController = Provider.of<PageControllers>(context);
    final textTheme = context.textTheme;
    return Scaffold(
      body: BackgroundScaffold(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 10, context.padding.bottom),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/veripol_logo.png'),
                const SizedBox(height: 38),
                Text(
                  "What's your name?",
                  textAlign: TextAlign.center,
                  style: textTheme.titleLarge?.copyWith(
                    color: AppColors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 65),
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
                const SizedBox(height: 14),
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
                const SizedBox(height: 134),
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
                  child: Text(
                    "NEXT",
                    style: textTheme.labelLarge?.copyWith(color: AppColors.white),
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already have an account? ',
                        style: context.textTheme.labelLarge?.copyWith(color: AppColors.black)),
                    GestureDetector(
                      onTap: () {
                        signupPageController.clearControllers();
                        context.pushReplacementNamed(Routes.signIn, extra: RoutingType.fade);
                      },
                      child: Text(
                        'Sign in',
                        style: context.textTheme.labelLarge?.copyWith(color: AppColors.passionRed),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
