import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:veripol/common/background_scaffold.dart';
import 'package:veripol/components/loading.dart';
import 'package:veripol/core/extensions/build_extensions.dart';
import 'package:veripol/core/routes/routes.dart';
import 'package:veripol/core/routes/routing_transitions.dart';
import 'package:veripol/core/theme/app_colors.dart';
import 'package:veripol/services/firebase_auth.dart';

import '../../components/themes.dart';
import '../../controller/page_controllers.dart';
import '../../main_common.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key, this.flag});

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
    final textTheme = context.textTheme;
    final colors = context.colors;
    return isLoading
        ? const LoadingScreen()
        : BackgroundScaffold(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 10, context.padding.bottom),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/veripol_logo.png'),
                    const SizedBox(height: 18),
                    Text(
                      "Log in to your account",
                      textAlign: TextAlign.center,
                      style: textTheme.titleLarge?.copyWith(
                        color: AppColors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 85),
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
                    const SizedBox(height: 14),
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
                        : const SizedBox(height: 128),
                    OutlinedButton(
                      onPressed: () async {
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
                      style: OutlinedButton.styleFrom(side: const BorderSide(color: AppColors.black, width: 2)),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset("assets/google_logo.png"),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text(
                              'SIGN IN WITH GOOGLE',
                              style: context.textTheme.labelLarge?.copyWith(color: context.colors.outline),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 14),
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
                                  Navigator.pushReplacement(
                                      context, MaterialPageRoute(builder: (context) => const VeriPolAuthWrapper()));
                                }
                              }
                            }
                          : null,
                      child: Text(
                        "SIGN IN",
                        style: textTheme.labelLarge?.copyWith(color: colors.onPrimary),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don’t have an Account yet? ",
                          style: textTheme.labelLarge?.copyWith(color: AppColors.black),
                        ),
                        GestureDetector(
                          onTap: () => context.pushReplacementNamed(Routes.signUp, extra: RoutingType.fade),
                          child: Text(
                            "Sign up",
                            style: textTheme.labelLarge?.copyWith(color: AppColors.passionRed),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
