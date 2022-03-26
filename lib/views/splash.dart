import 'package:flutter/material.dart';
import 'package:veripol/components/themes.dart';
import 'dart:math';

class VeripolSplash extends StatelessWidget {
  const VeripolSplash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final scale = mockUpWidth / size.width;
    return Scaffold(
      backgroundColor: veripolColors.background,
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Image.asset(
              'assets/bg_pattern.png',
              scale: scale,
            ),
            Positioned(
              left: 134 / mockUpWidth * size.width,
              top: 307 / mockUpHeight * size.height,
              child: Image.asset(
                'assets/veripol_logo.png',
                scale: scale,
              ),
            ),
            Positioned(
              left: 221 / mockUpWidth * size.width,
              top: -261 / mockUpHeight * size.height,
              child: const StackedBoxes(),
            ),
            Positioned(
              left: -195 / mockUpWidth * size.width,
              top: 565 / mockUpHeight * size.height,
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
  const StackedBoxes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: 333 / mockUpWidth * size.width,
      height: 481 / mockUpHeight * size.height,
      child: Stack(
        children: [
          Positioned(
            left: 98 / mockUpWidth * size.width,
            bottom: 0,
            child: Container(
              width: 69 / mockUpWidth * size.width,
              height: 69 / mockUpWidth * size.width,
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
            right: 15 / mockUpWidth * size.width,
            bottom: 59 / mockUpHeight * size.height,
            child: Container(
              width: 255 / mockUpWidth * size.width,
              height: 255 / mockUpWidth * size.width,
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
              width: 333 / mockUpWidth * size.width,
              height: 333 / mockUpWidth * size.width,
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
