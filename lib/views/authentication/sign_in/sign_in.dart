import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:veripol/common/background_scaffold.dart';
import 'package:veripol/components/loading.dart';
import 'package:veripol/components/themes.dart';
import 'package:veripol/controller/page/page_controller.dart';
import 'package:veripol/core/extensions/build_extensions.dart';
import 'package:veripol/core/routes/routes.dart';
import 'package:veripol/core/routes/routing_transitions.dart';
import 'package:veripol/core/theme/app_colors.dart';
import 'package:veripol/main_common.dart';
import 'package:veripol/services/firebase_auth.dart';

part 'use_sign_in_page.dart';

class SignIn extends HookConsumerWidget {
  const SignIn({super.key, this.flag});

  final int? flag;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final (
      :isLoading,
      :setIsLoading,
      :error,
      :setError,
      :isValid,
      :emailController,
      :passwordController,
      :setIsGoogleAccount,
      :signIn,
    ) = useSignInPage(ref);

    final textTheme = context.textTheme;
    final colors = context.colors;

    if (isLoading) return const LoadingScreen();

    return BackgroundScaffold(
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
                controller: emailController,
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
              Consumer(
                builder: (context, ref, _) {
                  final obscurePassword = useState<bool>(true);
                  return TextFormField(
                    obscureText: obscurePassword.value,
                    cursorColor: veripolColors.nightSky,
                    cursorHeight: 16,
                    controller: passwordController,
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
                      suffixIcon: obscurePassword.value
                          ? IconButton(
                              onPressed: () => obscurePassword.value = false,
                              color: veripolColors.nightSky,
                              iconSize: 24,
                              icon: const Icon(
                                Icons.visibility_off,
                              ),
                            )
                          : IconButton(
                              onPressed: () => obscurePassword.value = true,
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
                  );
                },
              ),
              error != ""
                  ? SizedBox(
                      height: 128,
                      child: Center(
                        child: Text(
                          error,
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
                  setIsGoogleAccount(true);

                  if (flag != null) {
                    await service.signInWithGoogle();
                    setIsLoading(true);
                    Future.delayed(const Duration(seconds: 1)).whenComplete(
                      () => Navigator.pop(context),
                    );
                  } else {
                    await service.signInWithGoogle().whenComplete(() {
                      setIsLoading(true);
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
                onPressed: isValid
                    ? () async {
                        setIsGoogleAccount(false);
                        setIsLoading(true);
                        final response = await signIn();
                        if (response["response"] == 400) {
                          setIsLoading(false);
                          setError(response["data"]);
                        } else {
                          if (context.mounted) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => const VeriPolAuthWrapper()),
                            );
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
