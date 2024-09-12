import 'package:flutter/material.dart';

class BackgroundScaffold extends StatelessWidget {
  const BackgroundScaffold({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
      ),
      body: Stack(
        children: [
          Image.asset(
            'assets/bg_pattern.png',
          ),
          child,
        ],
      ),
    );
  }
}
//  Positioned(
//                   top: 60,
//                   left: 23,
//                   child: GestureDetector(
//                     onTap: () => context.pop(),
//                     child: const Icon(
//                       Icons.arrow_back,
//                       color: Color(0xff1F1F1F),
//                       size: 32,
//                     ),
//                   ),
//                 ),