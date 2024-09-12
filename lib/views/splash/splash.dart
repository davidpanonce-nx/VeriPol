import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:veripol/components/themes.dart';
import 'package:veripol/core/extensions/build_extensions.dart';
import 'package:veripol/core/routes/routes.dart';

part 'use_splash_page.dart';

class VeripolSplash extends HookWidget {
  const VeripolSplash({super.key});

  @override
  Widget build(BuildContext context) {
    final animation = useSplashPage();
    return Scaffold(
      body: SizedBox(
        width: context.screenWidth,
        height: context.screenHeight,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              'assets/bg_pattern.png',
            ),
            Transform.scale(
              scale: animation,
              child: Image.asset(
                'assets/veripol_logo.png',
              ),
            ),
            const Positioned(
              left: 300,
              top: -261,
              child: _StackedBoxes(),
            ),
            Positioned(
              left: -195,
              top: 565,
              child: Transform.rotate(
                angle: pi,
                child: const _StackedBoxes(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StackedBoxes extends StatelessWidget {
  const _StackedBoxes();

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
