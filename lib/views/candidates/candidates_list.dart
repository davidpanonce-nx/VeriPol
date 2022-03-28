import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:veripol/components/candidate_position_card.dart';
import 'package:veripol/components/no_info_candidate_card.dart';

import '../../components/candidate_card.dart';
import '../../components/themes.dart';

class CandidatesList extends StatefulWidget {
  const CandidatesList({
    Key? key,
    required this.position,
    required this.description,
    required this.posCardColor,
    required this.learnMore,
    required this.posBgImageURL,
    required this.topOffset,
    required this.leftOffset,
    required this.posBgImageSize,
  }) : super(key: key);

  final String position;
  final String description;
  final Color posCardColor;
  final VoidCallback? learnMore;
  final String posBgImageURL;
  final double topOffset;
  final double leftOffset;
  final Size posBgImageSize;

  @override
  State<CandidatesList> createState() => _CandidatesListState();
}

class _CandidatesListState extends State<CandidatesList> {
  @override
  Widget build(BuildContext context) {
    List<Widget> candidates = [
      CandidateCard(
        position: widget.position,
        candidateImage: "assets/default_img.png",
        ballotNumber: 1,
        candidateName: "David Brent Panonce",
        politicalParty: "AutoWin",
      ),
      CandidateCard(
        position: widget.position,
        candidateImage: "assets/default_img.png",
        ballotNumber: 1,
        candidateName: "David Brent Panonce",
        politicalParty: "AutoWin",
      ),
      CandidateCard(
        position: widget.position,
        candidateImage: "assets/default_img.png",
        ballotNumber: 1,
        candidateName: "David Brent Panonce",
        politicalParty: "AutoWin",
      ),
      CandidateCard(
        position: widget.position,
        candidateImage: "assets/default_img.png",
        ballotNumber: 1,
        candidateName: "David Brent Panonce",
        politicalParty: "AutoWin",
      ),
      CandidateCard(
        position: widget.position,
        candidateImage: "assets/default_img.png",
        ballotNumber: 1,
        candidateName: "David Brent Panonce",
        politicalParty: "AutoWin",
      ),
      CandidateCard(
        position: widget.position,
        candidateImage: "assets/default_img.png",
        ballotNumber: 1,
        candidateName: "David Brent Panonce",
        politicalParty: "AutoWin",
      ),
      CandidateCard(
        position: widget.position,
        candidateImage: "assets/default_img.png",
        ballotNumber: 1,
        candidateName: "David Brent Panonce",
        politicalParty: "AutoWin",
      ),
      CandidateCard(
        position: widget.position,
        candidateImage: "assets/default_img.png",
        ballotNumber: 1,
        candidateName: "David Brent Panonce",
        politicalParty: "AutoWin",
      ),
      CandidateCard(
        position: widget.position,
        candidateImage: "assets/default_img.png",
        ballotNumber: 1,
        candidateName: "David Brent Panonce",
        politicalParty: "AutoWin",
      ),
      CandidateCard(
        position: widget.position,
        candidateImage: "assets/default_img.png",
        ballotNumber: 1,
        candidateName: "David Brent Panonce",
        politicalParty: "AutoWin",
      ),
    ];
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
                            "Candidates",
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
                        padding: EdgeInsets.zero,
                        children: [
                          CandidatePositionCard(
                            position: widget.position,
                            bgColor: widget.posCardColor,
                            description: widget.description,
                            learnMore: widget.learnMore,
                            bgImageURL: widget.posBgImageURL,
                            topOffset: widget.topOffset,
                            leftOffset: widget.leftOffset,
                            bgImageSize: widget.posBgImageSize,
                          ),
                          SizedBox(
                            height: 10 / mockUpHeight * size.height,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 12.5 / mockUpWidth * size.width),
                            child: widget.position == "Brgy. Captain" ||
                                    widget.position == "Brgy. Officer" ||
                                    widget.position == "SK Chairman"
                                ? const NoInformationCandidateCard()
                                : Column(
                                    children: candidates,
                                  ),
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
