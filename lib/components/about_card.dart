import 'package:flutter/material.dart';

import 'themes.dart';

class AboutCard extends StatelessWidget {
  const AboutCard({
    Key? key,
    required this.about,
  }) : super(key: key);

  final String about;

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
        margin: EdgeInsets.symmetric(horizontal: 15 / mockUpWidth * size.width),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "About the graph",
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
              about,
              textScaleFactor: textScale,
              textAlign: TextAlign.justify,
              style: veripolTextStyles.bodyMedium.copyWith(
                color: Colors.black,
              ),
            ),
          ],
        ));
  }
}
