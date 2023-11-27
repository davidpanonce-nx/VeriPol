import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:veripol/core/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2), () => context.go(Routes.onboarding));
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
