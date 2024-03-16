import 'package:flutter/material.dart';
import 'package:veripol/components/themes.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: 100,
              height: 100,
              child: CircularProgressIndicator(
                color: veripolColors.passionRed,
                strokeWidth: 20,
              ),
            ),
            SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(
                color: veripolColors.sunYellow,
                strokeWidth: 10,
              ),
            ),
            SizedBox(
              width: 25,
              height: 25,
              child: CircularProgressIndicator(
                color: veripolColors.blueTrust,
                strokeWidth: 10,
              ),
            )
          ],
        ),
      ),
    );
  }
}
