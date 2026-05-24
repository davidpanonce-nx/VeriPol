import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:veripol/components/loading.dart';
import 'package:veripol/components/themes.dart';
import 'package:veripol/controller/page/page_controller.dart';
import 'package:veripol/core/extensions/build_extensions.dart';
import 'package:veripol/main_common.dart';
import 'package:veripol/views/authentication/sign_in/sign_in.dart';

part 'use_credentials_page.dart';

class CredentialsPage extends HookConsumerWidget {
  const CredentialsPage({
    super.key,
    required this.firstName,
    required this.lastName,
  });

  final String firstName;
  final String lastName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final (
      :emailController,
      :passwordController,
      :confirmPasswordController,
      :isValid,
      :isLoading,
      :setIsLoading,
      :error,
      :setError,
      :setIsGoogleAccount,
      :signUp
    ) = useCredentialsPage(ref, firstName, lastName);

    if (isLoading) return const LoadingScreen();

    return Scaffold(
      body: SizedBox(
        width: context.screenWidth,
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
                  width: context.screenWidth,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/veripol_logo.png',
                      ),
                      const SizedBox(height: 38),
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
                      const SizedBox(height: 65),
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
                      const SizedBox(height: 14),
                      Consumer(
                        builder: (context, ref, _) {
                          final obscureConfirmPassword = useState<bool>(true);
                          return TextFormField(
                            obscureText: obscureConfirmPassword.value,
                            cursorColor: veripolColors.nightSky,
                            cursorHeight: 16,
                            controller: confirmPasswordController,
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
                              suffixIcon: obscureConfirmPassword.value
                                  ? IconButton(
                                      onPressed: () => obscureConfirmPassword.value = false,
                                      color: veripolColors.nightSky,
                                      iconSize: 24,
                                      icon: const Icon(
                                        Icons.visibility_off,
                                      ),
                                    )
                                  : IconButton(
                                      onPressed: () => obscureConfirmPassword.value = true,
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
                          );
                        },
                      ),
                      error != ""
                          ? SizedBox(
                              height: 120,
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
                      ElevatedButton(
                        onPressed: isValid
                            ? () async {
                                setIsLoading(true);
                                setIsGoogleAccount(false);
                                final response = await signUp();
                                if (response["response"] == 400) {
                                  setError(response["data"]);
                                  setIsLoading(false);
                                } else {
                                  if (context.mounted) {
                                    Navigator.pushReplacement(
                                        context, MaterialPageRoute(builder: (context) => const VeriPolAuthWrapper()));
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
                      const SizedBox(height: 24),
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
                onTap: () => Navigator.pop(context),
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
