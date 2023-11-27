import 'package:flutter/material.dart';

import 'themes.dart';

class NoInformationAvailable extends StatelessWidget {
  const NoInformationAvailable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 345,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          8,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.30),
            spreadRadius: 0,
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(
              0,
              1,
            ),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: Text(
        "No information Available yet",
        textAlign: TextAlign.start,
        style: veripolTextStyles.titleSmall.copyWith(
          color: Colors.black.withOpacity(0.50),
        ),
      ),
    );
  }
}
