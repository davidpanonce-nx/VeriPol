import 'dart:async';

import 'package:flutter/material.dart';
import 'package:veripol/components/themes.dart';
import 'package:veripol/views/onboarding/onboarding_1.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Timer(
      const Duration(seconds: 2),
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => const OnBoarding(),
        ),
      ),
    );
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: Image.asset(
              'assets/tr_wave.png',
              width: 350 / mockUpWidth * size.width,
            ),
          ),
          Center(child: Image.asset('assets/veripol_logo.png')),
          Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset(
              'assets/bl_wave.png',
              width: 350 / mockUpWidth * size.width,
            ),
          ),
        ],
      ),
    );
  }
}
