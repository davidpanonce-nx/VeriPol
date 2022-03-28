import 'package:flutter/material.dart';

import 'themes.dart';

class NoInformationCandidateCard extends StatelessWidget {
  const NoInformationCandidateCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textScale = size.width / mockUpWidth;
    return Container(
      width: 350 / mockUpWidth * size.width,
      decoration: BoxDecoration(
        color: const Color(0xff141414),
        borderRadius: BorderRadius.circular(5 / mockUpWidth * size.height),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 8 / mockUpWidth * size.width,
        vertical: 10 / mockUpHeight * size.height,
      ),
      margin: EdgeInsets.only(bottom: 10 / mockUpHeight * size.height),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 80 / mockUpWidth * size.width,
            height: 80 / mockUpWidth * size.width,
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage("assets/default_img.png"),
              ),
              borderRadius:
                  BorderRadius.circular(7 / mockUpWidth * size.height),
            ),
          ),
          SizedBox(
            width: 10 / mockUpWidth * size.width,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Coming Soon",
                textScaleFactor: textScale,
                style: veripolTextStyles.titleMedium.copyWith(
                  color: Colors.white,
                ),
              ),
              Text(
                "No information available yet",
                textScaleFactor: textScale,
                style: veripolTextStyles.labelMedium.copyWith(
                  color: Colors.white.withOpacity(0.50),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
