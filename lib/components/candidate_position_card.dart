import 'package:flutter/material.dart';

import 'themes.dart';

class CandidatePositionCard extends StatelessWidget {
  const CandidatePositionCard({
    Key? key,
    required this.position,
    required this.bgColor,
    required this.description,
    required this.learnMore,
    required this.bgImageURL,
    required this.topOffset,
    required this.leftOffset,
    required this.bgImageSize,
  }) : super(key: key);

  final String position;
  final Color bgColor;
  final String description;
  final VoidCallback? learnMore;
  final String bgImageURL;
  final double topOffset;
  final double leftOffset;
  final Size bgImageSize;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final scale = mockUpWidth / size.width;
    final textScale = size.width / mockUpWidth;
    return Container(
      width: size.width,
      height: 213 / mockUpHeight * size.height,
      decoration: BoxDecoration(color: bgColor),
      child: Stack(
        children: [
          Positioned(
            top: topOffset,
            left: leftOffset,
            width: bgImageSize.width,
            height: bgImageSize.height,
            child: Image.asset(
              bgImageURL,
              scale: scale,
            ),
          ),
          Container(
            width: size.width,
            height: 213 / mockUpHeight * size.height,
            padding: EdgeInsets.fromLTRB(
              12 / mockUpWidth * size.width,
              30 / mockUpHeight * size.height,
              12 / mockUpWidth * size.width,
              16 / mockUpHeight * size.height,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  position,
                  textScaleFactor: textScale,
                  style: position == "House of Representatives"
                      ? veripolTextStyles.headlineMedium.copyWith(
                          color: Colors.white,
                        )
                      : veripolTextStyles.headlineLarge.copyWith(
                          color: Colors.white,
                        ),
                ),
                SizedBox(height: 16 / mockUpHeight * size.height),
                Text(
                  description,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  textScaleFactor: textScale,
                  style: veripolTextStyles.bodySmall.copyWith(
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 16 / mockUpHeight * size.height),
                InkWell(
                  onTap: learnMore,
                  child: Container(
                    height: 40 / mockUpHeight * size.height,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(
                        5 / mockUpWidth * size.width,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "Learn More",
                        textAlign: TextAlign.center,
                        textScaleFactor: textScale,
                        style: veripolTextStyles.labelLarge.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
