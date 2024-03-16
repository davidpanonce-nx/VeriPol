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
    return Scaffold(
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              child: Image.asset(
                "assets/bg_pattern.png",
              ),
            ),
            SingleChildScrollView(
              child: Container(
                width: size.width,
                height: size.height,
                padding: const EdgeInsets.only(
                  top: 48,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 375,
                      height: 56,
                      padding: const EdgeInsets.only(
                        top: 12,
                        left: 16,
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
                            iconSize: 30,
                            color: Colors.black,
                          ),
                          const SizedBox(
                            width: 32,
                          ),
                          Text(
                            "Details",
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
                      height: size.height - 104,
                      child: ListView(
                        padding: const EdgeInsets.all(0),
                        children: [
                          Container(
                            width: size.width,
                            height: 105,
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
                                  ),
                                ),
                                Container(
                                  width: size.width,
                                  height: size.height - 104,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 11.5,
                                    vertical: position != "House of\nRepresentatives" ? 32.5 : 12.5,
                                  ),
                                  child: Text(
                                    position,
                                    textAlign: TextAlign.start,
                                    style: veripolTextStyles.headlineLarge.copyWith(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          Container(
                            width: size.width,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Overview",
                                  style: veripolTextStyles.labelLarge.copyWith(
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Expanded(
                                  child: Divider(
                                    height: 20,
                                    thickness: 1,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            width: 345,
                            height: 116,
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
                              horizontal: 15,
                              vertical: 15,
                            ),
                            margin: const EdgeInsets.symmetric(
                              horizontal: 15,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Total Number of Candidates",
                                  style: veripolTextStyles.titleSmall.copyWith(
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 10,
                                    left: 10,
                                  ),
                                  child: Text(
                                    "For May 2022 Elections",
                                    style: veripolTextStyles.bodySmall.copyWith(
                                      color: const Color(0xff575E71),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 5,
                                    left: 10,
                                  ),
                                  child: Text(
                                    numberOfCandidates > 0
                                        ? numberOfCandidates.toString()
                                        : "No information available yet",
                                    style: numberOfCandidates > 0
                                        ? veripolTextStyles.titleLarge.copyWith(color: Colors.black)
                                        : veripolTextStyles.titleSmall.copyWith(
                                            color: veripolColors.passionRed,
                                          ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: size.width,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Description",
                                  style: veripolTextStyles.labelLarge.copyWith(
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Expanded(
                                  child: Divider(
                                    height: 20,
                                    thickness: 1,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: 345,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 20,
                            ),
                            margin: const EdgeInsets.only(
                              left: 15,
                              right: 15,
                              bottom: 40,
                            ),
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
                            child: Text(
                              positionDescription,
                              textAlign: TextAlign.justify,
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
