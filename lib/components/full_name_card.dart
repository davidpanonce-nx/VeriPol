import 'package:flutter/material.dart';

import 'themes.dart';

class FullNameCard extends StatelessWidget {
  const FullNameCard({
    Key? key,
    required this.fullName,
  }) : super(key: key);

  final String fullName;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final textScale = size.width / mockUpWidth;
    return Container(
        width: 345 / mockUpWidth * size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            8 / mockUpWidth * size.width,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.30),
              spreadRadius: 0,
              blurRadius: 2 / mockUpWidth * size.width,
              offset: Offset(0, 1 / mockUpHeight * size.height),
            ),
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              spreadRadius: 1 / mockUpWidth * size.width,
              blurRadius: 3 / mockUpWidth * size.width,
              offset: Offset(
                0,
                1 / mockUpHeight * size.height,
              ),
            ),
          ],
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 20 / mockUpWidth * size.width,
          vertical: 20 / mockUpHeight * size.height,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Full Name",
              textScaleFactor: textScale,
              textAlign: TextAlign.start,
              style: veripolTextStyles.bodySmall.copyWith(
                color: const Color(0xff575E71),
              ),
            ),
            SizedBox(
              height: 10 / mockUpHeight * size.height,
            ),
            Text(
              fullName.toUpperCase(),
              textScaleFactor: textScale,
              textAlign: TextAlign.start,
              style: veripolTextStyles.titleSmall.copyWith(
                color: Colors.black,
              ),
            ),
          ],
        ));
  }
}
