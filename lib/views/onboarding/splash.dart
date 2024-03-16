import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:veripol/core/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async => await _checkFirstInstall());
    super.initState();
  }

  Future<void> _checkFirstInstall() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final firstInstall = prefs.getBool('firstInstall') ?? true;
    if (mounted) {
      if (firstInstall) {
        context.go(Routes.onboarding);
        prefs.setBool('firstInstall', false);
      } else {
        context.go(Routes.authHome);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: Image.asset('assets/tr_wave.png', width: 350),
          ),
          Center(child: Image.asset('assets/veripol_logo.png')),
          Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset('assets/bl_wave.png', width: 350),
          ),
        ],
      ),
    );
  }
}
