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
    return Container(
      width: size.width,
      height: 213,
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
            ),
          ),
          Container(
            width: size.width,
            height: 213,
            padding: const EdgeInsets.fromLTRB(
              12,
              30,
              12,
              16,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  position,
                  style: position == "House of Representatives"
                      ? veripolTextStyles.headlineMedium.copyWith(
                          color: Colors.white,
                        )
                      : veripolTextStyles.headlineLarge.copyWith(
                          color: Colors.white,
                        ),
                ),
                const SizedBox(height: 16),
                Text(
                  description,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: veripolTextStyles.bodySmall.copyWith(
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 16),
                InkWell(
                  onTap: learnMore,
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(
                        5,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "Learn More",
                        textAlign: TextAlign.center,
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
