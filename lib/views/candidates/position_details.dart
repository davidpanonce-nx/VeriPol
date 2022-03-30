import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../components/themes.dart';

class PositionDetails extends StatelessWidget {
  const PositionDetails({
    Key? key,
    required this.position,
    required this.cardColor,
    required this.bgImageURL,
    required this.numberOfCandidates,
    required this.positionDescription,
    required this.topOffset,
    required this.leftOffset,
    required this.bgImageSize,
  }) : super(key: key);

  final String position;
  final Color cardColor;
  final String bgImageURL;
  final int numberOfCandidates;
  final String positionDescription;
  final double topOffset;
  final double leftOffset;
  final Size bgImageSize;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final scale = mockUpWidth / size.width;
    final textScale = size.width / mockUpWidth;
    return Scaffold(
      backgroundColor: veripolColors.background,
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              child: Image.asset(
                "assets/bg_pattern.png",
                scale: scale,
              ),
            ),
            SingleChildScrollView(
              child: Container(
                width: size.width,
                height: size.height,
                padding: EdgeInsets.only(
                  top: 48 / mockUpHeight * size.height,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 375 / mockUpWidth * size.width,
                      height: 56 / mockUpHeight * size.height,
                      padding: EdgeInsets.only(
                        top: 12 / mockUpHeight * size.height,
                        left: 16 / mockUpWidth * size.width,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: const Icon(Icons.arrow_back),
                            iconSize: 30 / mockUpWidth * size.width,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 32 / mockUpWidth * size.width,
                          ),
                          Text(
                            "Details",
                            textScaleFactor: textScale,
                            style: GoogleFonts.inter(
                              textStyle: const TextStyle(
                                fontStyle: FontStyle.normal,
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                                height: 1.27,
                                letterSpacing: 0,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: size.width,
                      height: size.height - 104 / mockUpHeight * size.height,
                      child: ListView(
                        padding: const EdgeInsets.all(0),
                        children: [
                          Container(
                            width: size.width,
                            height: 105 / mockUpHeight * size.height,
                            decoration: BoxDecoration(
                              color: cardColor,
                            ),
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
                                  height: size.height -
                                      104 / mockUpHeight * size.height,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 11.5 / mockUpWidth * size.width,
                                    vertical:
                                        position != "House of\nRepresentatives"
                                            ? 32.5 / mockUpHeight * size.height
                                            : 12.5 / mockUpHeight * size.height,
                                  ),
                                  child: Text(
                                    position,
                                    textScaleFactor: textScale,
                                    textAlign: TextAlign.start,
                                    style: veripolTextStyles.headlineLarge
                                        .copyWith(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20 / mockUpHeight * size.height),
                          Container(
                            width: size.width,
                            padding: EdgeInsets.symmetric(
                              horizontal: 10 / mockUpWidth * size.width,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Overview",
                                  textScaleFactor: textScale,
                                  style: veripolTextStyles.labelLarge.copyWith(
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(
                                  width: 5 / mockUpWidth * size.width,
                                ),
                                Expanded(
                                  child: Divider(
                                    height: 20 / mockUpHeight * size.height,
                                    thickness: 1 / mockUpHeight * size.height,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10 / mockUpHeight * size.height),
                          Container(
                            width: 345 / mockUpWidth * size.width,
                            height: 116 / mockUpHeight * size.height,
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
                                  offset:
                                      Offset(0, 1 / mockUpHeight * size.height),
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
                              horizontal: 15 / mockUpWidth * size.width,
                              vertical: 15 / mockUpHeight * size.height,
                            ),
                            margin: EdgeInsets.symmetric(
                              horizontal: 15 / mockUpWidth * size.width,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Total Number of Candidates",
                                  textScaleFactor: textScale,
                                  style: veripolTextStyles.titleSmall.copyWith(
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(
                                  height: 5 / mockUpHeight * size.height,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: 10 / mockUpHeight * size.height,
                                    left: 10 / mockUpWidth * size.width,
                                  ),
                                  child: Text(
                                    "For May 2022 Elections",
                                    textScaleFactor: textScale,
                                    style: veripolTextStyles.bodySmall.copyWith(
                                      color: const Color(0xff575E71),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: 5 / mockUpHeight * size.height,
                                    left: 10 / mockUpWidth * size.width,
                                  ),
                                  child: Text(
                                    numberOfCandidates > 0
                                        ? numberOfCandidates.toString()
                                        : "No information available yet",
                                    textScaleFactor: textScale,
                                    style: numberOfCandidates > 0
                                        ? veripolTextStyles.titleLarge
                                            .copyWith(color: Colors.black)
                                        : veripolTextStyles.titleSmall.copyWith(
                                            color: veripolColors.passionRed,
                                          ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20 / mockUpHeight * size.height,
                          ),
                          Container(
                            width: size.width,
                            padding: EdgeInsets.symmetric(
                              horizontal: 10 / mockUpWidth * size.width,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Description",
                                  textScaleFactor: textScale,
                                  style: veripolTextStyles.labelLarge.copyWith(
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(
                                  width: 5 / mockUpWidth * size.width,
                                ),
                                Expanded(
                                  child: Divider(
                                    height: 20 / mockUpHeight * size.height,
                                    thickness: 1 / mockUpHeight * size.height,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10 / mockUpHeight * size.height,
                          ),
                          Container(
                            width: 345 / mockUpWidth * size.width,
                            padding: EdgeInsets.symmetric(
                              horizontal: 20 / mockUpWidth * size.width,
                              vertical: 20 / mockUpHeight * size.height,
                            ),
                            margin: EdgeInsets.only(
                              left: 15 / mockUpWidth * size.width,
                              right: 15 / mockUpWidth * size.width,
                              bottom: 40 / mockUpHeight * size.height,
                            ),
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
                                  offset:
                                      Offset(0, 1 / mockUpHeight * size.height),
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
                            child: Text(
                              positionDescription,
                              textAlign: TextAlign.justify,
                              textScaleFactor: textScale,
                              style: veripolTextStyles.bodyMedium.copyWith(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
