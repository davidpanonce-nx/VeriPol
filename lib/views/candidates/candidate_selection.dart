import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:veripol/views/candidates/candidates_list.dart';
import 'package:veripol/views/candidates/position_details.dart';

import '../../components/candidate_type_card_nav.dart';
import '../../components/themes.dart';

class CandidatesSelection extends StatelessWidget {
  const CandidatesSelection({
    Key? key,
    required this.type,
  }) : super(key: key);
  final String type;
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
            Positioned(
              top: 101 / mockUpHeight * size.height,
              left: -6 / mockUpWidth * size.width,
              child: Text(
                "VOTING IS NOT\nONLY OUR RIGHT\n-IT IS OUR POWER",
                textScaleFactor: textScale,
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontSize: 43.66,
                    fontWeight: FontWeight.w700,
                    height: 0.80,
                    letterSpacing: 0,
                    color: const Color(0xffF6C15C).withOpacity(0.50),
                  ),
                ),
              ),
            ),
            type != "National"
                ? Positioned(
                    bottom: 10 / mockUpHeight * size.height,
                    left: -80 / mockUpWidth * size.width,
                    child: Text(
                      "VOTING IS NOT\nONLY OUR RIGHT\n-IT IS OUR POWER",
                      textScaleFactor: textScale,
                      style: GoogleFonts.inter(
                        textStyle: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontSize: 43.66,
                          fontWeight: FontWeight.w700,
                          height: 0.80,
                          letterSpacing: 0,
                          color: const Color(0xffF6C15C).withOpacity(0.50),
                        ),
                      ),
                    ),
                  )
                : const SizedBox(),
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
                            type,
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
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.5 / mockUpWidth * size.width,
                        ),
                        children: [
                          SizedBox(
                            height: 20 / mockUpHeight * size.height,
                          ),
                          type == "National"
                              ? Column(
                                  children: [
                                    CandidateTypeCardNavigationButton(
                                      type: "PRESIDENT",
                                      imageURL: "assets/president_text_bg.png",
                                      bgColor: veripolColors.blueTrust,
                                      imageSize: const Size(345, 118),
                                      imageLeftOffset:
                                          12 / mockUpWidth * size.width,
                                      imageTopOffset:
                                          15 / mockUpHeight * size.height,
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                CandidatesList(
                                              position: "President",
                                              description:
                                                  "The president is the head of state and of government, and functions as the commander-in-chief of the Armed Forces of the Philippines. As chief executive, the president is task to keep everyone chu2",
                                              posCardColor:
                                                  veripolColors.blueTrust,
                                              learnMore: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        PositionDetails(
                                                      position: "President",
                                                      cardColor: veripolColors
                                                          .blueTrust,
                                                      bgImageURL:
                                                          "assets/president_text_bg.png",
                                                      numberOfCandidates: 10,
                                                      positionDescription:
                                                          "A party-list system is a type of electoral system that formally involves political parties in the electoral process, usually to facilitate multi-winner elections. In party-list systems, parties put forward a list of candidates, the party-list who stand for election on one ticket.\n\nA party-list system is a type of electoral system that formally involves political parties in the electoral process, usually to facilitate multi-winner elections. In party-list systems, parties put forward a list of candidates, the party-list who stand for election on one ticket.",
                                                      topOffset: -10 /
                                                          mockUpHeight *
                                                          size.height,
                                                      leftOffset: 120 /
                                                          mockUpWidth *
                                                          size.width,
                                                      bgImageSize:
                                                          const Size(275, 100),
                                                    ),
                                                  ),
                                                );
                                              },
                                              posBgImageURL:
                                                  "assets/president_text_bg.png",
                                              topOffset: -20 /
                                                  mockUpHeight *
                                                  size.height,
                                              leftOffset:
                                                  70 / mockUpWidth * size.width,
                                              posBgImageSize:
                                                  const Size(345, 118),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                    SizedBox(
                                      height: 20 / mockUpHeight * size.height,
                                    ),
                                    CandidateTypeCardNavigationButton(
                                      type: "VICE PRESIDENT",
                                      imageURL:
                                          "assets/vice_president_text_bg.png",
                                      bgColor: veripolColors.darkRedPassion,
                                      imageSize: const Size(385, 93),
                                      imageLeftOffset:
                                          -20 / mockUpWidth * size.width,
                                      imageTopOffset:
                                          25 / mockUpHeight * size.height,
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                CandidatesList(
                                              position: "Vice President",
                                              description:
                                                  "The vice president succeeds the president in case of death, disability, or resignation. The vice president may be appointed to a Cabinet position by the president without...",
                                              posCardColor:
                                                  veripolColors.passionRed,
                                              learnMore: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        PositionDetails(
                                                      position:
                                                          "Vice President",
                                                      cardColor: veripolColors
                                                          .passionRed,
                                                      bgImageURL:
                                                          "assets/vice_president_text_bg.png",
                                                      numberOfCandidates: 10,
                                                      positionDescription:
                                                          "A party-list system is a type of electoral system that formally involves political parties in the electoral process, usually to facilitate multi-winner elections. In party-list systems, parties put forward a list of candidates, the party-list who stand for election on one ticket.\n\nA party-list system is a type of electoral system that formally involves political parties in the electoral process, usually to facilitate multi-winner elections. In party-list systems, parties put forward a list of candidates, the party-list who stand for election on one ticket.",
                                                      topOffset: -10 /
                                                          mockUpHeight *
                                                          size.height,
                                                      leftOffset: 20 /
                                                          mockUpWidth *
                                                          size.width,
                                                      bgImageSize:
                                                          const Size(388, 95),
                                                    ),
                                                  ),
                                                );
                                              },
                                              posBgImageURL:
                                                  "assets/vice_president_text_bg.png",
                                              topOffset: -5 /
                                                  mockUpHeight *
                                                  size.height,
                                              leftOffset:
                                                  15 / mockUpWidth * size.width,
                                              posBgImageSize:
                                                  const Size(385, 93),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                    SizedBox(
                                      height: 20 / mockUpHeight * size.height,
                                    ),
                                    CandidateTypeCardNavigationButton(
                                      type: "SENATORS",
                                      imageURL: "assets/senators_text_bg.png",
                                      bgColor: veripolColors.darkSunYellow,
                                      imageSize: const Size(263, 110),
                                      imageLeftOffset:
                                          27 / mockUpWidth * size.width,
                                      imageTopOffset:
                                          20 / mockUpHeight * size.height,
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                CandidatesList(
                                              position: "Senators",
                                              description:
                                                  "The Philippine Senate is composed of 24 senators elected nationally by the people for a term of six years. Elections are held every three years where half of the senators...",
                                              posCardColor:
                                                  const Color(0xffC8A151),
                                              learnMore: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        PositionDetails(
                                                      position: "Senators",
                                                      cardColor: veripolColors
                                                          .sunYellowVar,
                                                      bgImageURL:
                                                          "assets/senators_text_bg.png",
                                                      numberOfCandidates: 10,
                                                      positionDescription:
                                                          "A party-list system is a type of electoral system that formally involves political parties in the electoral process, usually to facilitate multi-winner elections. In party-list systems, parties put forward a list of candidates, the party-list who stand for election on one ticket.\n\nA party-list system is a type of electoral system that formally involves political parties in the electoral process, usually to facilitate multi-winner elections. In party-list systems, parties put forward a list of candidates, the party-list who stand for election on one ticket.",
                                                      topOffset: -2 /
                                                          mockUpHeight *
                                                          size.height,
                                                      leftOffset: 150 /
                                                          mockUpWidth *
                                                          size.width,
                                                      bgImageSize:
                                                          const Size(209, 91),
                                                    ),
                                                  ),
                                                );
                                              },
                                              posBgImageURL:
                                                  "assets/senators_text_bg.png",
                                              topOffset: 3 /
                                                  mockUpHeight *
                                                  size.height,
                                              leftOffset: 150 /
                                                  mockUpWidth *
                                                  size.width,
                                              posBgImageSize:
                                                  const Size(209, 94),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                    SizedBox(
                                      height: 20 / mockUpHeight * size.height,
                                    ),
                                    CandidateTypeCardNavigationButton(
                                      type: "HOUSE OF\nREPRESENTATIVES",
                                      imageURL:
                                          "assets/house_of_reps_text_bg.png",
                                      bgColor: veripolColors.blueTrust,
                                      imageSize: const Size(297, 153),
                                      imageLeftOffset:
                                          23 / mockUpWidth * size.width,
                                      imageTopOffset:
                                          7 / mockUpHeight * size.height,
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                CandidatesList(
                                              position:
                                                  "House of Representatives",
                                              description:
                                                  "The Constitution provides that the House of Representatives shall be composed of not more than two hundred and fifty (250) members, unless otherwise fixed...",
                                              posCardColor:
                                                  veripolColors.blueTrust,
                                              learnMore: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        PositionDetails(
                                                      position:
                                                          "House of\nRepresentatives",
                                                      cardColor: veripolColors
                                                          .blueTrust,
                                                      bgImageURL:
                                                          "assets/house_of_reps_text_bg_1.png",
                                                      numberOfCandidates: 10,
                                                      positionDescription:
                                                          "A party-list system is a type of electoral system that formally involves political parties in the electoral process, usually to facilitate multi-winner elections. In party-list systems, parties put forward a list of candidates, the party-list who stand for election on one ticket.\n\nA party-list system is a type of electoral system that formally involves political parties in the electoral process, usually to facilitate multi-winner elections. In party-list systems, parties put forward a list of candidates, the party-list who stand for election on one ticket.",
                                                      topOffset: 10 /
                                                          mockUpHeight *
                                                          size.height,
                                                      leftOffset: 50 /
                                                          mockUpWidth *
                                                          size.width,
                                                      bgImageSize:
                                                          const Size(322, 61),
                                                    ),
                                                  ),
                                                );
                                              },
                                              posBgImageURL:
                                                  "assets/house_of_reps_text_bg_1.png",
                                              topOffset: 5 /
                                                  mockUpHeight *
                                                  size.height,
                                              leftOffset:
                                                  15 / mockUpWidth * size.width,
                                              posBgImageSize:
                                                  const Size(369, 78),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                    SizedBox(
                                      height: 20 / mockUpHeight * size.height,
                                    ),
                                    CandidateTypeCardNavigationButton(
                                      type: "PARTY LIST",
                                      imageURL: "assets/party_list_text_bg.png",
                                      bgColor: veripolColors.darkRedPassion,
                                      imageSize: const Size(297, 114),
                                      imageLeftOffset:
                                          30 / mockUpWidth * size.width,
                                      imageTopOffset:
                                          25 / mockUpHeight * size.height,
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                CandidatesList(
                                              position: "Party Lists",
                                              description:
                                                  "A party-list system is a type of electoral system that formally involves political parties in the electoral process, usually to facilitate multi-winner elections. In party-list...",
                                              posCardColor:
                                                  veripolColors.passionRed,
                                              learnMore: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        PositionDetails(
                                                      position: "Party Lists",
                                                      cardColor: veripolColors
                                                          .passionRed,
                                                      bgImageURL:
                                                          "assets/party_list_text_bg_1.png",
                                                      numberOfCandidates: 10,
                                                      positionDescription:
                                                          "A party-list system is a type of electoral system that formally involves political parties in the electoral process, usually to facilitate multi-winner elections. In party-list systems, parties put forward a list of candidates, the party-list who stand for election on one ticket.\n\nA party-list system is a type of electoral system that formally involves political parties in the electoral process, usually to facilitate multi-winner elections. In party-list systems, parties put forward a list of candidates, the party-list who stand for election on one ticket.",
                                                      topOffset: -8 /
                                                          mockUpHeight *
                                                          size.height,
                                                      leftOffset: 60 /
                                                          mockUpWidth *
                                                          size.width,
                                                      bgImageSize:
                                                          const Size(306, 114),
                                                    ),
                                                  ),
                                                );
                                              },
                                              posBgImageURL:
                                                  "assets/party_list_text_bg_1.png",
                                              topOffset: -10 /
                                                  mockUpHeight *
                                                  size.height,
                                              leftOffset:
                                                  70 / mockUpWidth * size.width,
                                              posBgImageSize:
                                                  const Size(301, 121),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                )
                              : type == "Provincial"
                                  ? Column(
                                      children: [
                                        CandidateTypeCardNavigationButton(
                                          type: "GOVERNOR",
                                          imageURL:
                                              "assets/governor_text_bg.png",
                                          bgColor: veripolColors.blueTrust,
                                          imageSize: const Size(278, 113),
                                          imageLeftOffset:
                                              25 / mockUpWidth * size.width,
                                          imageTopOffset:
                                              25 / mockUpHeight * size.height,
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    CandidatesList(
                                                  position: "Governor",
                                                  description:
                                                      "A party-list system is a type of electoral system that formally involves political parties in the electoral process, usually to facilitate multi-winner elections. In party-list...",
                                                  posCardColor:
                                                      veripolColors.blueTrust,
                                                  learnMore: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            PositionDetails(
                                                          position: "Governor",
                                                          cardColor:
                                                              veripolColors
                                                                  .blueTrust,
                                                          bgImageURL:
                                                              "assets/governor_text_bg.png",
                                                          numberOfCandidates:
                                                              10,
                                                          positionDescription:
                                                              "A party-list system is a type of electoral system that formally involves political parties in the electoral process, usually to facilitate multi-winner elections. In party-list systems, parties put forward a list of candidates, the party-list who stand for election on one ticket.\n\nA party-list system is a type of electoral system that formally involves political parties in the electoral process, usually to facilitate multi-winner elections. In party-list systems, parties put forward a list of candidates, the party-list who stand for election on one ticket.",
                                                          topOffset: -2 /
                                                              mockUpHeight *
                                                              size.height,
                                                          leftOffset: 145 /
                                                              mockUpWidth *
                                                              size.width,
                                                          bgImageSize:
                                                              const Size(
                                                                  222, 91),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  posBgImageURL:
                                                      "assets/governor_text_bg.png",
                                                  topOffset: -10 /
                                                      mockUpHeight *
                                                      size.height,
                                                  leftOffset: 80 /
                                                      mockUpWidth *
                                                      size.width,
                                                  posBgImageSize:
                                                      const Size(278, 113),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                        SizedBox(
                                          height:
                                              20 / mockUpHeight * size.height,
                                        ),
                                        CandidateTypeCardNavigationButton(
                                          type: "VICE GOVERNOR",
                                          imageURL:
                                              "assets/vice_governor_text_bg.png",
                                          bgColor: veripolColors.darkRedPassion,
                                          imageSize: const Size(359, 100),
                                          imageLeftOffset:
                                              -20 / mockUpWidth * size.width,
                                          imageTopOffset:
                                              25 / mockUpHeight * size.height,
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    CandidatesList(
                                                  position: "Vice Governor",
                                                  description:
                                                      "A party-list system is a type of electoral system that formally involves political parties in the electoral process, usually to facilitate multi-winner elections. In party-list...",
                                                  posCardColor:
                                                      veripolColors.passionRed,
                                                  learnMore: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            PositionDetails(
                                                          position:
                                                              "Vice Governor",
                                                          cardColor:
                                                              veripolColors
                                                                  .passionRed,
                                                          bgImageURL:
                                                              "assets/vice_governor_text_bg.png",
                                                          numberOfCandidates:
                                                              10,
                                                          positionDescription:
                                                              "A party-list system is a type of electoral system that formally involves political parties in the electoral process, usually to facilitate multi-winner elections. In party-list systems, parties put forward a list of candidates, the party-list who stand for election on one ticket.\n\nA party-list system is a type of electoral system that formally involves political parties in the electoral process, usually to facilitate multi-winner elections. In party-list systems, parties put forward a list of candidates, the party-list who stand for election on one ticket.",
                                                          topOffset: -5 /
                                                              mockUpHeight *
                                                              size.height,
                                                          leftOffset: 20 /
                                                              mockUpWidth *
                                                              size.width,
                                                          bgImageSize:
                                                              const Size(
                                                                  335, 95),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  posBgImageURL:
                                                      "assets/vice_governor_text_bg.png",
                                                  topOffset: -5 /
                                                      mockUpHeight *
                                                      size.height,
                                                  leftOffset: 40 /
                                                      mockUpWidth *
                                                      size.width,
                                                  posBgImageSize:
                                                      const Size(330, 91),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                        SizedBox(
                                          height:
                                              20 / mockUpHeight * size.height,
                                        ),
                                        CandidateTypeCardNavigationButton(
                                          type: "PROVINCIAL BOARD",
                                          imageURL:
                                              "assets/provincial_board_text_bg.png",
                                          bgColor: veripolColors.darkSunYellow,
                                          imageSize: const Size(361, 82),
                                          imageLeftOffset:
                                              -25 / mockUpWidth * size.width,
                                          imageTopOffset:
                                              35 / mockUpHeight * size.height,
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    CandidatesList(
                                                  position: "Provincial Board",
                                                  description:
                                                      "A party-list system is a type of electoral system that formally involves political parties in the electoral process, usually to facilitate multi-winner elections. In party-list...",
                                                  posCardColor: veripolColors
                                                      .sunYellowVar,
                                                  learnMore: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            PositionDetails(
                                                          position:
                                                              "Provincial Board",
                                                          cardColor:
                                                              veripolColors
                                                                  .sunYellowVar,
                                                          bgImageURL:
                                                              "assets/provincial_board_text_bg_1.png",
                                                          numberOfCandidates:
                                                              10,
                                                          positionDescription:
                                                              "A party-list system is a type of electoral system that formally involves political parties in the electoral process, usually to facilitate multi-winner elections. In party-list systems, parties put forward a list of candidates, the party-list who stand for election on one ticket.\n\nA party-list system is a type of electoral system that formally involves political parties in the electoral process, usually to facilitate multi-winner elections. In party-list systems, parties put forward a list of candidates, the party-list who stand for election on one ticket.",
                                                          topOffset: -20 /
                                                              mockUpHeight *
                                                              size.height,
                                                          leftOffset: 155 /
                                                              mockUpWidth *
                                                              size.width,
                                                          bgImageSize:
                                                              const Size(
                                                                  221, 135),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  posBgImageURL:
                                                      "assets/provincial_board_text_bg_1.png",
                                                  topOffset: -5 /
                                                      mockUpHeight *
                                                      size.height,
                                                  leftOffset: 100 /
                                                      mockUpWidth *
                                                      size.width,
                                                  posBgImageSize:
                                                      const Size(270, 184),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ],
                                    )
                                  : type == "Municipal"
                                      ? Column(
                                          children: [
                                            CandidateTypeCardNavigationButton(
                                              type: "MAYOR",
                                              imageURL:
                                                  "assets/mayor_text_bg.png",
                                              bgColor: veripolColors.blueTrust,
                                              imageSize: const Size(231, 103),
                                              imageLeftOffset:
                                                  50 / mockUpWidth * size.width,
                                              imageTopOffset: 35 /
                                                  mockUpHeight *
                                                  size.height,
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        CandidatesList(
                                                            position: "Mayor",
                                                            description:
                                                                "A party-list system is a type of electoral system that formally involves political parties in the electoral process, usually to facilitate multi-winner elections. In party-list...",
                                                            posCardColor:
                                                                veripolColors
                                                                    .blueTrust,
                                                            learnMore: () {
                                                              Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          PositionDetails(
                                                                    position:
                                                                        "Mayor",
                                                                    cardColor:
                                                                        veripolColors
                                                                            .blueTrust,
                                                                    bgImageURL:
                                                                        "assets/mayor_text_bg.png",
                                                                    numberOfCandidates:
                                                                        10,
                                                                    positionDescription:
                                                                        "A party-list system is a type of electoral system that formally involves political parties in the electoral process, usually to facilitate multi-winner elections. In party-list systems, parties put forward a list of candidates, the party-list who stand for election on one ticket.\n\nA party-list system is a type of electoral system that formally involves political parties in the electoral process, usually to facilitate multi-winner elections. In party-list systems, parties put forward a list of candidates, the party-list who stand for election on one ticket.",
                                                                    topOffset: -5 /
                                                                        mockUpHeight *
                                                                        size.height,
                                                                    leftOffset: 180 /
                                                                        mockUpWidth *
                                                                        size.width,
                                                                    bgImageSize:
                                                                        const Size(
                                                                            186,
                                                                            112),
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                            posBgImageURL:
                                                                "assets/mayor_text_bg.png",
                                                            topOffset: 5 /
                                                                mockUpHeight *
                                                                size.height,
                                                            leftOffset: 70 /
                                                                mockUpWidth *
                                                                size.width,
                                                            posBgImageSize:
                                                                const Size(
                                                                    231, 103)),
                                                  ),
                                                );
                                              },
                                            ),
                                            SizedBox(
                                              height: 20 /
                                                  mockUpHeight *
                                                  size.height,
                                            ),
                                            CandidateTypeCardNavigationButton(
                                              type: "VICE MAYOR",
                                              imageURL:
                                                  "assets/vice_mayor_text_bg.png",
                                              bgColor:
                                                  veripolColors.darkRedPassion,
                                              imageSize: const Size(318, 92),
                                              imageLeftOffset:
                                                  10 / mockUpWidth * size.width,
                                              imageTopOffset: 45 /
                                                  mockUpHeight *
                                                  size.height,
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        CandidatesList(
                                                      position: "Vice Mayor",
                                                      description:
                                                          "A party-list system is a type of electoral system that formally involves political parties in the electoral process, usually to facilitate multi-winner elections. In party-list...",
                                                      posCardColor:
                                                          veripolColors
                                                              .passionRed,
                                                      learnMore: () {
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) =>
                                                                PositionDetails(
                                                              position:
                                                                  "Vice Mayor",
                                                              cardColor:
                                                                  veripolColors
                                                                      .passionRed,
                                                              bgImageURL:
                                                                  "assets/vice_mayor_text_bg.png",
                                                              numberOfCandidates:
                                                                  10,
                                                              positionDescription:
                                                                  "A party-list system is a type of electoral system that formally involves political parties in the electoral process, usually to facilitate multi-winner elections. In party-list systems, parties put forward a list of candidates, the party-list who stand for election on one ticket.\n\nA party-list system is a type of electoral system that formally involves political parties in the electoral process, usually to facilitate multi-winner elections. In party-list systems, parties put forward a list of candidates, the party-list who stand for election on one ticket.",
                                                              topOffset: -5 /
                                                                  mockUpHeight *
                                                                  size.height,
                                                              leftOffset: 60 /
                                                                  mockUpWidth *
                                                                  size.width,
                                                              bgImageSize:
                                                                  const Size(
                                                                      296, 117),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                      posBgImageURL:
                                                          "assets/vice_mayor_text_bg.png",
                                                      topOffset: 10 /
                                                          mockUpHeight *
                                                          size.height,
                                                      leftOffset: 40 /
                                                          mockUpWidth *
                                                          size.width,
                                                      posBgImageSize:
                                                          const Size(318, 92),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                            SizedBox(
                                              height: 20 /
                                                  mockUpHeight *
                                                  size.height,
                                            ),
                                            CandidateTypeCardNavigationButton(
                                              type: "COUNCILORS",
                                              imageURL:
                                                  "assets/councilor_text_bg.png",
                                              bgColor:
                                                  veripolColors.darkSunYellow,
                                              imageSize: const Size(299, 105),
                                              imageLeftOffset:
                                                  15 / mockUpWidth * size.width,
                                              imageTopOffset: 10 /
                                                  mockUpHeight *
                                                  size.height,
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        CandidatesList(
                                                      position: "Councilors",
                                                      description:
                                                          "A party-list system is a type of electoral system that formally involves political parties in the electoral process, usually to facilitate multi-winner elections. In party-list...",
                                                      posCardColor:
                                                          veripolColors
                                                              .sunYellowVar,
                                                      learnMore: () {
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) =>
                                                                PositionDetails(
                                                              position:
                                                                  "Councilors",
                                                              cardColor:
                                                                  veripolColors
                                                                      .sunYellowVar,
                                                              bgImageURL:
                                                                  "assets/councilor_text_bg.png",
                                                              numberOfCandidates:
                                                                  10,
                                                              positionDescription:
                                                                  "A party-list system is a type of electoral system that formally involves political parties in the electoral process, usually to facilitate multi-winner elections. In party-list systems, parties put forward a list of candidates, the party-list who stand for election on one ticket.\n\nA party-list system is a type of electoral system that formally involves political parties in the electoral process, usually to facilitate multi-winner elections. In party-list systems, parties put forward a list of candidates, the party-list who stand for election on one ticket.",
                                                              topOffset: 5 /
                                                                  mockUpHeight *
                                                                  size.height,
                                                              leftOffset: 100 /
                                                                  mockUpWidth *
                                                                  size.width,
                                                              bgImageSize:
                                                                  const Size(
                                                                      259, 90),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                      posBgImageURL:
                                                          "assets/councilor_text_bg.png",
                                                      topOffset: 5 /
                                                          mockUpHeight *
                                                          size.height,
                                                      leftOffset: 100 /
                                                          mockUpWidth *
                                                          size.width,
                                                      posBgImageSize:
                                                          const Size(261, 94),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ],
                                        )
                                      : Column(
                                          children: [
                                            CandidateTypeCardNavigationButton(
                                              type: "BRGY. CAPTAIN",
                                              imageURL:
                                                  "assets/brgy_captain_text_bg.png",
                                              bgColor: veripolColors.blueTrust,
                                              imageSize: const Size(330, 120),
                                              imageLeftOffset:
                                                  5 / mockUpWidth * size.width,
                                              imageTopOffset: 25 /
                                                  mockUpHeight *
                                                  size.height,
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        CandidatesList(
                                                      position: "Brgy. Captain",
                                                      description:
                                                          "A party-list system is a type of electoral system that formally involves political parties in the electoral process, usually to facilitate multi-winner elections. In party-list...",
                                                      posCardColor:
                                                          veripolColors
                                                              .blueTrust,
                                                      learnMore: () {
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) =>
                                                                PositionDetails(
                                                              position:
                                                                  "Brgy. Captain",
                                                              cardColor:
                                                                  veripolColors
                                                                      .blueTrust,
                                                              bgImageURL:
                                                                  "assets/brgy_captain_text_bg.png",
                                                              numberOfCandidates:
                                                                  10,
                                                              positionDescription:
                                                                  "A party-list system is a type of electoral system that formally involves political parties in the electoral process, usually to facilitate multi-winner elections. In party-list systems, parties put forward a list of candidates, the party-list who stand for election on one ticket.\n\nA party-list system is a type of electoral system that formally involves political parties in the electoral process, usually to facilitate multi-winner elections. In party-list systems, parties put forward a list of candidates, the party-list who stand for election on one ticket.",
                                                              topOffset: -5 /
                                                                  mockUpHeight *
                                                                  size.height,
                                                              leftOffset: 70 /
                                                                  mockUpWidth *
                                                                  size.width,
                                                              bgImageSize:
                                                                  const Size(
                                                                      294, 104),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                      posBgImageURL:
                                                          "assets/brgy_captain_text_bg.png",
                                                      topOffset: -10 /
                                                          mockUpHeight *
                                                          size.height,
                                                      leftOffset: 70 /
                                                          mockUpWidth *
                                                          size.width,
                                                      posBgImageSize:
                                                          const Size(291, 99),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                            SizedBox(
                                              height: 20 /
                                                  mockUpHeight *
                                                  size.height,
                                            ),
                                            CandidateTypeCardNavigationButton(
                                              type: "BRGY. OFFICER",
                                              imageURL:
                                                  "assets/brgy_officer_text_bg.png",
                                              bgColor:
                                                  veripolColors.darkRedPassion,
                                              imageSize: const Size(370, 139),
                                              imageLeftOffset: -10 /
                                                  mockUpWidth *
                                                  size.width,
                                              imageTopOffset: 10 /
                                                  mockUpHeight *
                                                  size.height,
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        CandidatesList(
                                                      position: "Brgy. Officer",
                                                      description:
                                                          "A party-list system is a type of electoral system that formally involves political parties in the electoral process, usually to facilitate multi-winner elections. In party-list...",
                                                      posCardColor:
                                                          veripolColors
                                                              .passionRed,
                                                      learnMore: () {
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) =>
                                                                PositionDetails(
                                                              position:
                                                                  "Brgy. Officer",
                                                              cardColor:
                                                                  veripolColors
                                                                      .passionRed,
                                                              bgImageURL:
                                                                  "assets/brgy_officer_text_bg.png",
                                                              numberOfCandidates:
                                                                  10,
                                                              positionDescription:
                                                                  "A party-list system is a type of electoral system that formally involves political parties in the electoral process, usually to facilitate multi-winner elections. In party-list systems, parties put forward a list of candidates, the party-list who stand for election on one ticket.\n\nA party-list system is a type of electoral system that formally involves political parties in the electoral process, usually to facilitate multi-winner elections. In party-list systems, parties put forward a list of candidates, the party-list who stand for election on one ticket.",
                                                              topOffset: -15 /
                                                                  mockUpHeight *
                                                                  size.height,
                                                              leftOffset: 20 /
                                                                  mockUpWidth *
                                                                  size.width,
                                                              bgImageSize:
                                                                  const Size(
                                                                      345, 126),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                      posBgImageURL:
                                                          "assets/brgy_officer_text_bg.png",
                                                      topOffset: -5 /
                                                          mockUpHeight *
                                                          size.height,
                                                      leftOffset: 20 /
                                                          mockUpWidth *
                                                          size.width,
                                                      posBgImageSize:
                                                          const Size(346, 123),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                            SizedBox(
                                              height: 20 /
                                                  mockUpHeight *
                                                  size.height,
                                            ),
                                            CandidateTypeCardNavigationButton(
                                              type: "SK CHAIRMAN",
                                              imageURL:
                                                  "assets/sk_chairman_text_bg.png",
                                              bgColor:
                                                  veripolColors.darkSunYellow,
                                              imageSize: const Size(359, 100),
                                              imageLeftOffset: -10 /
                                                  mockUpWidth *
                                                  size.width,
                                              imageTopOffset: 30 /
                                                  mockUpHeight *
                                                  size.height,
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        CandidatesList(
                                                      position: "SK Chairman",
                                                      description:
                                                          "A party-list system is a type of electoral system that formally involves political parties in the electoral process, usually to facilitate multi-winner elections. In party-list...",
                                                      posCardColor:
                                                          veripolColors
                                                              .sunYellowVar,
                                                      learnMore: () {
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) =>
                                                                PositionDetails(
                                                              position:
                                                                  "SK Chairman",
                                                              cardColor:
                                                                  veripolColors
                                                                      .sunYellowVar,
                                                              bgImageURL:
                                                                  "assets/sk_chairman_text_bg.png",
                                                              numberOfCandidates:
                                                                  10,
                                                              positionDescription:
                                                                  "A party-list system is a type of electoral system that formally involves political parties in the electoral process, usually to facilitate multi-winner elections. In party-list systems, parties put forward a list of candidates, the party-list who stand for election on one ticket.\n\nA party-list system is a type of electoral system that formally involves political parties in the electoral process, usually to facilitate multi-winner elections. In party-list systems, parties put forward a list of candidates, the party-list who stand for election on one ticket.",
                                                              topOffset: 5 /
                                                                  mockUpHeight *
                                                                  size.height,
                                                              leftOffset: 25 /
                                                                  mockUpWidth *
                                                                  size.width,
                                                              bgImageSize:
                                                                  const Size(
                                                                      343, 96),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                      posBgImageURL:
                                                          "assets/sk_chairman_text_bg.png",
                                                      topOffset: 5 /
                                                          mockUpHeight *
                                                          size.height,
                                                      leftOffset: 25 /
                                                          mockUpWidth *
                                                          size.width,
                                                      posBgImageSize:
                                                          const Size(342, 96),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                          SizedBox(
                            height: 20 / mockUpHeight * size.height,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
