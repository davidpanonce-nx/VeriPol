import 'package:flutter/material.dart';
import 'package:veripol/components/themes.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: veripolColors.background,
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: 100 / mockUpWidth * size.width,
              height: 100 / mockUpWidth * size.width,
              child: CircularProgressIndicator(
                color: veripolColors.passionRed,
                strokeWidth: 20 / mockUpWidth * size.width,
              ),
            ),
            SizedBox(
              width: 50 / mockUpWidth * size.width,
              height: 50 / mockUpWidth * size.width,
              child: CircularProgressIndicator(
                color: veripolColors.sunYellow,
                strokeWidth: 10 / mockUpWidth * size.width,
              ),
            ),
            SizedBox(
              width: 25 / mockUpWidth * size.width,
              height: 25 / mockUpWidth * size.width,
              child: CircularProgressIndicator(
                color: veripolColors.blueTrust,
                strokeWidth: 10 / mockUpWidth * size.width,
              ),
            )
          ],
        ),
      ),
    );
  }
}
