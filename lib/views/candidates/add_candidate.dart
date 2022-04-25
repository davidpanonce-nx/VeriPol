import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../components/themes.dart';
import '../../models/models.dart';

class AddCandidate extends StatefulWidget {
  const AddCandidate({
    Key? key,
    required this.position,
    required this.posCardColor,
    required this.posBgImageURL,
    required this.bgImageOffset,
    required this.posBgImageSize,
    required this.candidates,
  }) : super(key: key);

  final String position;
  final Color posCardColor;
  final String posBgImageURL;
  final Offset bgImageOffset;
  final Size posBgImageSize;
  final List<CandidateData> candidates;

  @override
  State<AddCandidate> createState() => _AddCandidateState();
}

class _AddCandidateState extends State<AddCandidate> {
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
                            "My Candidates",
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
                          SizedBox(
                            width: 92 / mockUpWidth * size.width,
                          ),
                          IconButton(
                            onPressed: () {},
                            iconSize: 30 / mockUpWidth * size.width,
                            color: Colors.black,
                            icon: const Icon(Icons.search),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: size.width,
                      height: size.height - 104 / mockUpHeight * size.height,
                      child: ListView(
                        padding: EdgeInsets.zero,
                        children: [
                          Container(
                            width: size.width,
                            height: 105 / mockUpHeight * size.height,
                            decoration:
                                BoxDecoration(color: widget.posCardColor),
                            child: Stack(
                              children: [
                                Positioned(
                                  top: widget.bgImageOffset.dy,
                                  left: widget.bgImageOffset.dx,
                                  width: widget.posBgImageSize.width,
                                  height: widget.posBgImageSize.height,
                                  child: Image.asset(
                                    widget.posBgImageURL,
                                    scale: scale,
                                  ),
                                ),
                                Container(
                                  width: size.width,
                                  height: 105 / mockUpHeight * size.height,
                                  padding: EdgeInsets.only(
                                    left: 10 / mockUpWidth * size.width,
                                  ),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      widget.position,
                                      textScaleFactor: textScale,
                                      style: veripolTextStyles.headlineLarge
                                          .copyWith(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10 / mockUpHeight * size.height,
                          ),
                        ],
                      ),
                    )
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
