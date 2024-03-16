import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:veripol/core/extensions/build_extensions.dart';
import 'package:veripol/core/routes/routes.dart';
import 'package:veripol/core/theme/app_colors.dart';
import 'package:veripol/main_common.dart';

import '../controller/page_controllers.dart';
import '../services/firebase_auth.dart';

class SignupDashboard extends StatefulWidget {
  const SignupDashboard({this.flag, super.key});

  final int? flag;
  @override
  State<SignupDashboard> createState() => _SignupDashboardState();
}

class _SignupDashboardState extends State<SignupDashboard> {
  @override
  Widget build(BuildContext context) {
    final signInPageController = Provider.of<PageControllers>(context);
    return Scaffold(
      body: Stack(
        children: [
          Image.asset('assets/bg_pattern.png'),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox.shrink(),
              SizedBox(
                height: 240,
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
                margin: EdgeInsets.only(bottom: context.padding.bottom),
                height: 240,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () => context.goNamed(Routes.signUp),
                      child: Text(
                        'SIGN UP',
                        style: context.textTheme.labelLarge?.copyWith(color: AppColors.white),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Already have an account? ',
                            style: context.textTheme.labelLarge?.copyWith(color: AppColors.black)),
                        GestureDetector(
                          onTap: () => context.goNamed(Routes.signIn),
                          child: Text(
                            'Sign in',
                            style: context.textTheme.labelLarge?.copyWith(color: AppColors.passionRed),
                          ),
                        ),
                      ],
                    ),
                    const Divider(color: Color(0xFF818181), thickness: 1),
                    OutlinedButton(
                      onPressed: () async {
                        FirebaseAuthService service = FirebaseAuthService();
                        signInPageController.setIsGoogleAccount(true);

                        if (widget.flag != null) {
                          await service.signInWithGoogle().whenComplete(() {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: ((context) {
                              return const VeriPolAuthWrapper();
                            })));
                          });
                        } else {
                          await service.signInWithGoogle();
                        }
                      },
                      style: OutlinedButton.styleFrom(side: const BorderSide(color: AppColors.black, width: 2)),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset("assets/google_logo.png"),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text(
                              'SIGN UP WITH GOOGLE',
                              style: context.textTheme.labelLarge?.copyWith(color: context.colors.outline),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
