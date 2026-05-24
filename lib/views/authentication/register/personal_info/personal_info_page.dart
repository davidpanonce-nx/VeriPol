import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:veripol/common/background_scaffold.dart';
import 'package:veripol/components/themes.dart';
import 'package:veripol/core/extensions/build_extensions.dart';
import 'package:veripol/core/routes/routes.dart';
import 'package:veripol/core/routes/routing_transitions.dart';
import 'package:veripol/core/theme/app_colors.dart';

import '../credentials/credentials_page.dart';

part 'use_personal_info_page.dart';

class PersonalInfoPage extends HookWidget {
  const PersonalInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final (
      :isValid,
      :firstNameController,
      :lastNameController,
    ) = usePersonalInfoPage();

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
                  controller: firstNameController,
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
                  controller: lastNameController,
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
                  onPressed: isValid
                      ? () {
                          Navigator.push(
                            context,
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) => CredentialsPage(
                                firstName: firstNameController.text.trim(),
                                lastName: lastNameController.text.trim(),
                              ),
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
                      onTap: () => context.pushReplacementNamed(Routes.signIn, extra: RoutingType.fade),
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
