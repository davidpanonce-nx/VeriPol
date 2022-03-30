import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:veripol/controller/candidate_data_controller.dart';
import 'package:veripol/controller/pagination_controllers.dart';
import 'package:veripol/views/candidates/candidates_list.dart';
import 'package:veripol/views/candidates/position_details.dart';

import '../../components/candidate_type_card_nav.dart';
import '../../components/themes.dart';
import '../../controller/data_controller.dart';
import '../../models/models.dart';

class CandidatesSelection extends StatefulWidget {
  const CandidatesSelection({
    Key? key,
    required this.type,
  }) : super(key: key);
  final String type;

  @override
  State<CandidatesSelection> createState() => _CandidatesSelectionState();
}

class _CandidatesSelectionState extends State<CandidatesSelection> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final scale = mockUpWidth / size.width;
    final textScale = size.width / mockUpWidth;
    final dataController = Provider.of<DataController>(context);
    final candidateDataController =
        Provider.of<CandidateDataController>(context);
    final paginationController = Provider.of<PaginationController>(context);
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
            widget.type != "National"
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
                            widget.type,
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
                          widget.type == "National"
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
                                        paginationController.clearFields();
                                        List<CandidateData> presidents = [];
                                        presidents.addAll(
                                            candidateDataController
                                                .getPresidents());
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                CandidatesList(
                                              candidates: presidents,
                                              position: "President",
                                              description: dataController
                                                      .positionDescription[
                                                  "president"],
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
                                                      numberOfCandidates:
                                                          presidents.length,
                                                      positionDescription:
                                                          dataController
                                                                  .positionDescription[
                                                              "president"],
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
                                        paginationController.clearFields();
                                        List<CandidateData> vicePresidents = [];
                                        vicePresidents.addAll(
                                          candidateDataController
                                              .getVicePresidents(),
                                        );

                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                CandidatesList(
                                              candidates: vicePresidents,
                                              position: "Vice President",
                                              description: dataController
                                                      .positionDescription[
                                                  "vice-president"],
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
                                                      numberOfCandidates:
                                                          vicePresidents.length,
                                                      positionDescription:
                                                          dataController
                                                                  .positionDescription[
                                                              "vice-president"],
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
                                        paginationController.clearFields();
                                        List<CandidateData> senators = [];
                                        senators.addAll(
                                          candidateDataController.getSenators(),
                                        );

                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                CandidatesList(
                                              candidates: senators,
                                              position: "Senators",
                                              description: dataController
                                                      .positionDescription[
                                                  "senator"],
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
                                                      numberOfCandidates:
                                                          senators.length,
                                                      positionDescription:
                                                          dataController
                                                                  .positionDescription[
                                                              "senator"],
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
                                        paginationController.clearFields();
                                        List<CandidateData> houseOfReps = [];
                                        houseOfReps.addAll(
                                            candidateDataController
                                                .getHouseofReps());
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                CandidatesList(
                                              candidates: houseOfReps,
                                              position:
                                                  "House of Representatives",
                                              description: dataController
                                                      .positionDescription[
                                                  "house-of-representatives"],
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
                                                      numberOfCandidates:
                                                          houseOfReps.length,
                                                      positionDescription:
                                                          dataController
                                                                  .positionDescription[
                                                              "house-of-representatives"],
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
                                        paginationController.clearFields();
                                        List<CandidateData> partyLists = [];
                                        partyLists.addAll(
                                          candidateDataController
                                              .getPartyLists(),
                                        );

                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                CandidatesList(
                                              candidates: partyLists,
                                              position: "Party Lists",
                                              description: dataController
                                                      .positionDescription[
                                                  "party-list"],
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
                                                      numberOfCandidates:
                                                          partyLists.length,
                                                      positionDescription:
                                                          dataController
                                                                  .positionDescription[
                                                              "party-list"],
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
                              : widget.type == "Provincial"
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
                                            paginationController.clearFields();
                                            List<CandidateData> governor = [];
                                            governor.addAll(
                                              candidateDataController
                                                  .getGovernors(
                                                      dataController.province),
                                            );
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    CandidatesList(
                                                  candidates: governor,
                                                  position: "Governor",
                                                  description: dataController
                                                          .positionDescription[
                                                      "governor"],
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
                                                              governor.length,
                                                          positionDescription:
                                                              dataController
                                                                      .positionDescription[
                                                                  "governor"],
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
                                            paginationController.clearFields();
                                            List<CandidateData> viceGovernor =
                                                [];
                                            viceGovernor.addAll(
                                              candidateDataController
                                                  .getViceGovernors(
                                                      dataController.province),
                                            );
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    CandidatesList(
                                                  candidates: viceGovernor,
                                                  position: "Vice Governor",
                                                  description: dataController
                                                          .positionDescription[
                                                      "vice-governor"],
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
                                                              viceGovernor
                                                                  .length,
                                                          positionDescription:
                                                              dataController
                                                                      .positionDescription[
                                                                  "vice-governor"],
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
                                            paginationController.clearFields();
                                            List<CandidateData>
                                                provincialBoard = [];
                                            provincialBoard.addAll(
                                              candidateDataController
                                                  .getProvincialBoard(
                                                      dataController.province),
                                            );
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    CandidatesList(
                                                  candidates: provincialBoard,
                                                  position: "Provincial Board",
                                                  description: dataController
                                                          .positionDescription[
                                                      "provincial-board"],
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
                                                              provincialBoard
                                                                  .length,
                                                          positionDescription:
                                                              dataController
                                                                      .positionDescription[
                                                                  "provincial-board"],
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
                                  : widget.type == "Municipal"
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
                                                paginationController
                                                    .clearFields();
                                                List<CandidateData> mayor = [];

                                                mayor.addAll(
                                                  candidateDataController
                                                      .getMayor(
                                                    dataController.province,
                                                    dataController.city,
                                                  ),
                                                );

                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        CandidatesList(
                                                            candidates: mayor,
                                                            position: "Mayor",
                                                            description:
                                                                dataController
                                                                        .positionDescription[
                                                                    "mayor"],
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
                                                                        mayor
                                                                            .length,
                                                                    positionDescription:
                                                                        dataController
                                                                            .positionDescription["mayor"],
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
                                                paginationController
                                                    .clearFields();
                                                List<CandidateData> viceMayor =
                                                    [];
                                                viceMayor.addAll(
                                                  candidateDataController
                                                      .getViceMayors(
                                                    dataController.province,
                                                    dataController.city,
                                                  ),
                                                );

                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        CandidatesList(
                                                      candidates: viceMayor,
                                                      position: "Vice Mayor",
                                                      description: dataController
                                                              .positionDescription[
                                                          "vice-mayor"],
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
                                                                  viceMayor
                                                                      .length,
                                                              positionDescription:
                                                                  dataController
                                                                          .positionDescription[
                                                                      "vice-mayor"],
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
                                                paginationController
                                                    .clearFields();
                                                List<CandidateData> councilors =
                                                    [];
                                                councilors.addAll(
                                                  candidateDataController
                                                      .getCouncilors(
                                                          dataController
                                                              .province,
                                                          dataController.city),
                                                );
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        CandidatesList(
                                                      candidates: councilors,
                                                      position: "Councilors",
                                                      description: dataController
                                                              .positionDescription[
                                                          "councilors"],
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
                                                                  councilors
                                                                      .length,
                                                              positionDescription:
                                                                  dataController
                                                                          .positionDescription[
                                                                      "councilors"],
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
                                                paginationController
                                                    .clearFields();
                                                List<CandidateData>
                                                    brgyCaptain = [];
                                                brgyCaptain.addAll(
                                                    candidateDataController
                                                        .getBarangayCaptain(
                                                  dataController.province,
                                                  dataController.city,
                                                  dataController.barangay,
                                                ));
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        CandidatesList(
                                                      candidates: brgyCaptain,
                                                      position: "Brgy. Captain",
                                                      description: dataController
                                                              .positionDescription[
                                                          "brgy-captain"],
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
                                                                  brgyCaptain
                                                                      .length,
                                                              positionDescription:
                                                                  dataController
                                                                          .positionDescription[
                                                                      "brgy-captain"],
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
                                                paginationController
                                                    .clearFields();
                                                List<CandidateData>
                                                    brgyOfficer = [];
                                                brgyOfficer.addAll(
                                                  candidateDataController
                                                      .getBarangayOfficer(
                                                    dataController.province,
                                                    dataController.city,
                                                    dataController.barangay,
                                                  ),
                                                );
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        CandidatesList(
                                                      candidates: brgyOfficer,
                                                      position: "Brgy. Officer",
                                                      description: dataController
                                                              .positionDescription[
                                                          "brgy-officer"],
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
                                                                  brgyOfficer
                                                                      .length,
                                                              positionDescription:
                                                                  dataController
                                                                          .positionDescription[
                                                                      "brgy-officer"],
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
                                                paginationController
                                                    .clearFields();
                                                List<CandidateData> skChairman =
                                                    [];
                                                skChairman.addAll(
                                                  candidateDataController
                                                      .getSKChairman(
                                                    dataController.province,
                                                    dataController.city,
                                                    dataController.barangay,
                                                  ),
                                                );
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        CandidatesList(
                                                      candidates: skChairman,
                                                      position: "SK Chairman",
                                                      description: dataController
                                                              .positionDescription[
                                                          "sk-chairman"],
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
                                                                  skChairman
                                                                      .length,
                                                              positionDescription:
                                                                  dataController
                                                                          .positionDescription[
                                                                      "sk-chairman"],
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
