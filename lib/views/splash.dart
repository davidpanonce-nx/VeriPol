import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:veripol/components/themes.dart';
import 'package:veripol/core/routes/routes.dart';

class VeripolSplash extends StatefulWidget {
  const VeripolSplash({super.key});

  @override
  State<VeripolSplash> createState() => _VeripolSplashState();
}

class _VeripolSplashState extends State<VeripolSplash> with TickerProviderStateMixin {
  late AnimationController _breathingAnimation;
  late final Animation<double> _breathe = Tween<double>(
    begin: 0.8,
    end: 1.3,
  ).animate(
    CurvedAnimation(
      parent: _breathingAnimation,
      curve: Curves.easeOut,
    ),
  );

  @override
  void initState() {
    _breathingAnimation = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async => await _checkFirstInstall());

    super.initState();
  }

  Future<void> _checkFirstInstall() async {
    await Future.delayed(const Duration(seconds: 2));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final firstInstall = prefs.getBool('firstInstall') ?? true;
    if (mounted) {
      if (firstInstall) {
        context.pushReplacement(Routes.onboarding);
        prefs.setBool('firstInstall', false);
      } else {
        context.pushReplacement(Routes.authHome);
      }
    }
  }

  @override
  void dispose() {
    _breathingAnimation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Image.asset(
              'assets/bg_pattern.png',
            ),
            Positioned(
              left: 134,
              top: 307,
              child: AnimatedBuilder(
                animation: _breathingAnimation..forward(),
                builder: (BuildContext context, Widget? child) {
                  return Transform.scale(
                    scale: _breathe.value,
                    child: Image.asset(
                      'assets/veripol_logo.png',
                    ),
                  );
                },
              ),
            ),
            const Positioned(
              left: 221,
              top: -261,
              child: StackedBoxes(),
            ),
            Positioned(
              left: -195,
              top: 565,
              child: Transform.rotate(
                angle: pi,
                child: const StackedBoxes(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StackedBoxes extends StatelessWidget {
  const StackedBoxes({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 333,
      height: 481,
      child: Stack(
        children: [
          Positioned(
            left: 98,
            bottom: 0,
            child: Container(
              width: 69,
              height: 69,
              decoration: BoxDecoration(
                color: veripolColors.passionRed,
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 1),
                    color: Colors.black.withOpacity(0.30),
                    blurRadius: 2,
                    spreadRadius: 0,
                  ),
                  BoxShadow(
                    offset: const Offset(0, 1),
                    color: Colors.black.withOpacity(0.15),
                    blurRadius: 3,
                    spreadRadius: 1,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: 15,
            bottom: 59,
            child: Container(
              width: 255,
              height: 255,
              decoration: BoxDecoration(
                color: veripolColors.blueTrust,
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 1),
                    color: Colors.black.withOpacity(0.30),
                    blurRadius: 2,
                    spreadRadius: 0,
                  ),
                  BoxShadow(
                    offset: const Offset(0, 1),
                    color: Colors.black.withOpacity(0.15),
                    blurRadius: 3,
                    spreadRadius: 1,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            child: Container(
              width: 333,
              height: 333,
              decoration: BoxDecoration(
                color: veripolColors.sunYellow,
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 1),
                    color: Colors.black.withOpacity(0.30),
                    blurRadius: 2,
                    spreadRadius: 0,
                  ),
                  BoxShadow(
                    offset: const Offset(0, 1),
                    color: Colors.black.withOpacity(0.15),
                    blurRadius: 3,
                    spreadRadius: 1,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
