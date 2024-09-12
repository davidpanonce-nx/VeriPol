import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:veripol/controller/candidate_data_controller.dart';
import 'package:veripol/controller/pagination_controllers.dart';
import 'package:veripol/views/candidates/candidates_list.dart';
import 'package:veripol/views/candidates/position_details.dart';
import 'package:veripol/views/splash/splash.dart';

import '../../components/candidate_type_card_nav.dart';
import '../../components/themes.dart';
import '../../controller/data_controller.dart';
import '../../models/models.dart';

class CandidatesSelection extends StatefulWidget {
  const CandidatesSelection({
    super.key,
    required this.type,
  });
  final String type;

  @override
  State<CandidatesSelection> createState() => _CandidatesSelectionState();
}

class _CandidatesSelectionState extends State<CandidatesSelection> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final dataController = Provider.of<DataController>(context);
    final candidateDataController = Provider.of<CandidateDataController>(context);
    final paginationController = Provider.of<PaginationController>(context);
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
            Positioned(
              top: 101,
              left: -6,
              child: Text(
                "VOTING IS NOT\nONLY OUR RIGHT\n-IT IS OUR POWER",
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
                    bottom: 10,
                    left: -80,
                    child: Text(
                      "VOTING IS NOT\nONLY OUR RIGHT\n-IT IS OUR POWER",
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
                            widget.type,
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
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12.5,
                        ),
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          widget.type == "National"
                              ? Column(
                                  children: [
                                    CandidateTypeCardNavigationButton(
                                      type: "PRESIDENT",
                                      imageURL: "assets/president_text_bg.png",
                                      bgColor: veripolColors.blueTrust,
                                      imageSize: const Size(345, 118),
                                      imageLeftOffset: 12,
                                      imageTopOffset: 15,
                                      onTap: () async {
                                        paginationController.clearFields();
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => const VeripolSplash(),
                                          ),
                                        );
                                        await candidateDataController.readPresident().whenComplete(() {
                                          Future.delayed(const Duration(seconds: 1), () {}).whenComplete(
                                            () => Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => CandidatesList(
                                                  screenSize: Size(size.width, size.height),
                                                  candidates: candidateDataController.candidates,
                                                  position: "President",
                                                  description: dataController.positionDescription["president"],
                                                  posCardColor: veripolColors.blueTrust,
                                                  learnMore: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) => PositionDetails(
                                                          position: "President",
                                                          cardColor: veripolColors.blueTrust,
                                                          bgImageURL: "assets/president_text_bg.png",
                                                          numberOfCandidates: candidateDataController.candidates.length,
                                                          positionDescription:
                                                              dataController.positionDescription["president"],
                                                          topOffset: -10,
                                                          leftOffset: 120,
                                                          bgImageSize: const Size(275, 100),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  posBgImageURL: "assets/president_text_bg.png",
                                                  topOffset: -20,
                                                  leftOffset: 70,
                                                  posBgImageSize: const Size(345, 118),
                                                ),
                                              ),
                                            ),
                                          );
                                        });
                                      },
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    CandidateTypeCardNavigationButton(
                                      type: "VICE PRESIDENT",
                                      imageURL: "assets/vice_president_text_bg.png",
                                      bgColor: veripolColors.darkRedPassion,
                                      imageSize: const Size(385, 93),
                                      imageLeftOffset: -20,
                                      imageTopOffset: 25,
                                      onTap: () async {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => const VeripolSplash(),
                                          ),
                                        );
                                        paginationController.clearFields();
                                        await candidateDataController.readVicePresident().whenComplete(() {
                                          Future.delayed(const Duration(seconds: 1), () {}).whenComplete(
                                            () => Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => CandidatesList(
                                                  screenSize: Size(size.width, size.height),
                                                  candidates: candidateDataController.candidates,
                                                  position: "Vice President",
                                                  description: dataController.positionDescription["vice-president"],
                                                  posCardColor: veripolColors.passionRed,
                                                  learnMore: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) => PositionDetails(
                                                          position: "Vice President",
                                                          cardColor: veripolColors.passionRed,
                                                          bgImageURL: "assets/vice_president_text_bg.png",
                                                          numberOfCandidates: candidateDataController.candidates.length,
                                                          positionDescription:
                                                              dataController.positionDescription["vice-president"],
                                                          topOffset: -10,
                                                          leftOffset: 20,
                                                          bgImageSize: const Size(388, 95),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  posBgImageURL: "assets/vice_president_text_bg.png",
                                                  topOffset: -5,
                                                  leftOffset: 15,
                                                  posBgImageSize: const Size(385, 93),
                                                ),
                                              ),
                                            ),
                                          );
                                        });
                                      },
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    CandidateTypeCardNavigationButton(
                                      type: "SENATORS",
                                      imageURL: "assets/senators_text_bg.png",
                                      bgColor: veripolColors.darkSunYellow,
                                      imageSize: const Size(263, 110),
                                      imageLeftOffset: 27,
                                      imageTopOffset: 20,
                                      onTap: () async {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => const VeripolSplash(),
                                          ),
                                        );
                                        paginationController.clearFields();
                                        await candidateDataController.readSenatorJson().whenComplete(() {
                                          Future.delayed(const Duration(seconds: 1), () {}).whenComplete(
                                            () => Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => CandidatesList(
                                                  screenSize: Size(size.width, size.height),
                                                  candidates: candidateDataController.candidates,
                                                  position: "Senators",
                                                  description: dataController.positionDescription["senator"],
                                                  posCardColor: const Color(0xffC8A151),
                                                  learnMore: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) => PositionDetails(
                                                          position: "Senators",
                                                          cardColor: veripolColors.sunYellowVar,
                                                          bgImageURL: "assets/senators_text_bg.png",
                                                          numberOfCandidates: candidateDataController.candidates.length,
                                                          positionDescription:
                                                              dataController.positionDescription["senator"],
                                                          topOffset: -2,
                                                          leftOffset: 150,
                                                          bgImageSize: const Size(209, 91),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  posBgImageURL: "assets/senators_text_bg.png",
                                                  topOffset: 3,
                                                  leftOffset: 150,
                                                  posBgImageSize: const Size(209, 94),
                                                ),
                                              ),
                                            ),
                                          );
                                        });
                                      },
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    CandidateTypeCardNavigationButton(
                                      type: "HOUSE OF\nREPRESENTATIVES",
                                      imageURL: "assets/house_of_reps_text_bg.png",
                                      bgColor: veripolColors.blueTrust,
                                      imageSize: const Size(297, 153),
                                      imageLeftOffset: 23,
                                      imageTopOffset: 7,
                                      onTap: () async {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => const VeripolSplash(),
                                          ),
                                        );
                                        paginationController.clearFields();
                                        await candidateDataController
                                            .readHouseOfReps(dataController.city, dataController.province)
                                            .whenComplete(() {
                                          Future.delayed(const Duration(seconds: 1), () {}).whenComplete(
                                            () => Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => CandidatesList(
                                                  screenSize: Size(size.width, size.height),
                                                  candidates: candidateDataController.candidates,
                                                  position: "House of Representatives",
                                                  description:
                                                      dataController.positionDescription["house-of-representatives"],
                                                  posCardColor: veripolColors.blueTrust,
                                                  learnMore: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) => PositionDetails(
                                                          position: "House of\nRepresentatives",
                                                          cardColor: veripolColors.blueTrust,
                                                          bgImageURL: "assets/house_of_reps_text_bg_1.png",
                                                          numberOfCandidates: candidateDataController.candidates.length,
                                                          positionDescription: dataController
                                                              .positionDescription["house-of-representatives"],
                                                          topOffset: 10,
                                                          leftOffset: 50,
                                                          bgImageSize: const Size(322, 61),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  posBgImageURL: "assets/house_of_reps_text_bg_1.png",
                                                  topOffset: 5,
                                                  leftOffset: 15,
                                                  posBgImageSize: const Size(369, 78),
                                                ),
                                              ),
                                            ),
                                          );
                                        });
                                      },
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    CandidateTypeCardNavigationButton(
                                      type: "PARTY LIST",
                                      imageURL: "assets/party_list_text_bg.png",
                                      bgColor: veripolColors.darkRedPassion,
                                      imageSize: const Size(297, 114),
                                      imageLeftOffset: 30,
                                      imageTopOffset: 25,
                                      onTap: () async {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => const VeripolSplash(),
                                          ),
                                        );
                                        paginationController.clearFields();
                                        await candidateDataController.readPartyList().whenComplete(() {
                                          Future.delayed(const Duration(seconds: 1), () {}).whenComplete(
                                            () => Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => CandidatesList(
                                                  screenSize: Size(size.width, size.height),
                                                  candidates: candidateDataController.candidates,
                                                  position: "Party Lists",
                                                  description: dataController.positionDescription["party-list"],
                                                  posCardColor: veripolColors.passionRed,
                                                  learnMore: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) => PositionDetails(
                                                          position: "Party Lists",
                                                          cardColor: veripolColors.passionRed,
                                                          bgImageURL: "assets/party_list_text_bg_1.png",
                                                          numberOfCandidates: candidateDataController.candidates.length,
                                                          positionDescription:
                                                              dataController.positionDescription["party-list"],
                                                          topOffset: -8,
                                                          leftOffset: 60,
                                                          bgImageSize: const Size(306, 114),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  posBgImageURL: "assets/party_list_text_bg_1.png",
                                                  topOffset: -10,
                                                  leftOffset: 70,
                                                  posBgImageSize: const Size(301, 121),
                                                ),
                                              ),
                                            ),
                                          );
                                        });
                                      },
                                    ),
                                  ],
                                )
                              : widget.type == "Provincial"
                                  ? Column(
                                      children: [
                                        CandidateTypeCardNavigationButton(
                                          type: "GOVERNOR",
                                          imageURL: "assets/governor_text_bg.png",
                                          bgColor: veripolColors.blueTrust,
                                          imageSize: const Size(278, 113),
                                          imageLeftOffset: 25,
                                          imageTopOffset: 25,
                                          onTap: () async {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => const VeripolSplash(),
                                              ),
                                            );
                                            paginationController.clearFields();
                                            await candidateDataController
                                                .readGovernor(dataController.province)
                                                .whenComplete(() {
                                              Future.delayed(const Duration(seconds: 1), () {}).whenComplete(
                                                () => Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) => CandidatesList(
                                                      screenSize: Size(size.width, size.height),
                                                      candidates: candidateDataController.candidates,
                                                      position: "Governor",
                                                      description: dataController.positionDescription["governor"],
                                                      posCardColor: veripolColors.blueTrust,
                                                      learnMore: () {
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) => PositionDetails(
                                                              position: "Governor",
                                                              cardColor: veripolColors.blueTrust,
                                                              bgImageURL: "assets/governor_text_bg.png",
                                                              numberOfCandidates:
                                                                  candidateDataController.candidates.length,
                                                              positionDescription:
                                                                  dataController.positionDescription["governor"],
                                                              topOffset: -2,
                                                              leftOffset: 145,
                                                              bgImageSize: const Size(222, 91),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                      posBgImageURL: "assets/governor_text_bg.png",
                                                      topOffset: -10,
                                                      leftOffset: 80,
                                                      posBgImageSize: const Size(278, 113),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            });
                                          },
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        CandidateTypeCardNavigationButton(
                                          type: "VICE GOVERNOR",
                                          imageURL: "assets/vice_governor_text_bg.png",
                                          bgColor: veripolColors.darkRedPassion,
                                          imageSize: const Size(359, 100),
                                          imageLeftOffset: -20,
                                          imageTopOffset: 25,
                                          onTap: () async {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => const VeripolSplash(),
                                              ),
                                            );
                                            paginationController.clearFields();
                                            await candidateDataController
                                                .readViceGovernor(dataController.province)
                                                .whenComplete(() {
                                              Future.delayed(const Duration(seconds: 1), () {}).whenComplete(
                                                () => Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) => CandidatesList(
                                                      screenSize: Size(size.width, size.height),
                                                      candidates: candidateDataController.candidates,
                                                      position: "Vice Governor",
                                                      description: dataController.positionDescription["vice-governor"],
                                                      posCardColor: veripolColors.passionRed,
                                                      learnMore: () {
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) => PositionDetails(
                                                              position: "Vice Governor",
                                                              cardColor: veripolColors.passionRed,
                                                              bgImageURL: "assets/vice_governor_text_bg.png",
                                                              numberOfCandidates:
                                                                  candidateDataController.candidates.length,
                                                              positionDescription:
                                                                  dataController.positionDescription["vice-governor"],
                                                              topOffset: -5,
                                                              leftOffset: 20,
                                                              bgImageSize: const Size(335, 95),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                      posBgImageURL: "assets/vice_governor_text_bg.png",
                                                      topOffset: -5,
                                                      leftOffset: 40,
                                                      posBgImageSize: const Size(330, 91),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            });
                                          },
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        CandidateTypeCardNavigationButton(
                                          type: "PROVINCIAL BOARD",
                                          imageURL: "assets/provincial_board_text_bg.png",
                                          bgColor: veripolColors.darkSunYellow,
                                          imageSize: const Size(361, 82),
                                          imageLeftOffset: -25,
                                          imageTopOffset: 35,
                                          onTap: () async {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => const VeripolSplash(),
                                              ),
                                            );
                                            paginationController.clearFields();
                                            await candidateDataController
                                                .readProvincialBoard(dataController.province)
                                                .whenComplete(() {
                                              Future.delayed(const Duration(seconds: 1), () {}).whenComplete(
                                                () => Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) => CandidatesList(
                                                      screenSize: Size(size.width, size.height),
                                                      candidates: candidateDataController.candidates,
                                                      position: "Provincial Board",
                                                      description:
                                                          dataController.positionDescription["provincial-board"],
                                                      posCardColor: veripolColors.sunYellowVar,
                                                      learnMore: () {
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) => PositionDetails(
                                                              position: "Provincial Board",
                                                              cardColor: veripolColors.sunYellowVar,
                                                              bgImageURL: "assets/provincial_board_text_bg_1.png",
                                                              numberOfCandidates:
                                                                  candidateDataController.candidates.length,
                                                              positionDescription: dataController
                                                                  .positionDescription["provincial-board"],
                                                              topOffset: -20,
                                                              leftOffset: 155,
                                                              bgImageSize: const Size(221, 135),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                      posBgImageURL: "assets/provincial_board_text_bg_1.png",
                                                      topOffset: -5,
                                                      leftOffset: 100,
                                                      posBgImageSize: const Size(270, 184),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            });
                                          },
                                        ),
                                      ],
                                    )
                                  : widget.type == "Municipal"
                                      ? Column(
                                          children: [
                                            CandidateTypeCardNavigationButton(
                                              type: "MAYOR",
                                              imageURL: "assets/mayor_text_bg.png",
                                              bgColor: veripolColors.blueTrust,
                                              imageSize: const Size(231, 103),
                                              imageLeftOffset: 50,
                                              imageTopOffset: 35,
                                              onTap: () async {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) => const VeripolSplash(),
                                                  ),
                                                );
                                                paginationController.clearFields();
                                                await candidateDataController
                                                    .readMayor(dataController.province, dataController.city)
                                                    .whenComplete(() {
                                                  Future.delayed(const Duration(seconds: 1), () {}).whenComplete(
                                                    () => Navigator.pushReplacement(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) => CandidatesList(
                                                            screenSize: Size(size.width, size.height),
                                                            candidates: candidateDataController.candidates,
                                                            position: "Mayor",
                                                            description: dataController.positionDescription["mayor"],
                                                            posCardColor: veripolColors.blueTrust,
                                                            learnMore: () {
                                                              Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                  builder: (context) => PositionDetails(
                                                                    position: "Mayor",
                                                                    cardColor: veripolColors.blueTrust,
                                                                    bgImageURL: "assets/mayor_text_bg.png",
                                                                    numberOfCandidates:
                                                                        candidateDataController.candidates.length,
                                                                    positionDescription:
                                                                        dataController.positionDescription["mayor"],
                                                                    topOffset: -5,
                                                                    leftOffset: 180,
                                                                    bgImageSize: const Size(186, 112),
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                            posBgImageURL: "assets/mayor_text_bg.png",
                                                            topOffset: 5,
                                                            leftOffset: 70,
                                                            posBgImageSize: const Size(231, 103)),
                                                      ),
                                                    ),
                                                  );
                                                });
                                              },
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            CandidateTypeCardNavigationButton(
                                              type: "VICE MAYOR",
                                              imageURL: "assets/vice_mayor_text_bg.png",
                                              bgColor: veripolColors.darkRedPassion,
                                              imageSize: const Size(318, 92),
                                              imageLeftOffset: 10,
                                              imageTopOffset: 45,
                                              onTap: () async {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) => const VeripolSplash(),
                                                  ),
                                                );
                                                paginationController.clearFields();
                                                await candidateDataController
                                                    .readViceMayor(dataController.province, dataController.city)
                                                    .whenComplete(() {
                                                  Future.delayed(const Duration(seconds: 1), () {}).whenComplete(
                                                    () => Navigator.pushReplacement(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) => CandidatesList(
                                                          screenSize: Size(size.width, size.height),
                                                          candidates: candidateDataController.candidates,
                                                          position: "Vice Mayor",
                                                          description: dataController.positionDescription["vice-mayor"],
                                                          posCardColor: veripolColors.passionRed,
                                                          learnMore: () {
                                                            Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                builder: (context) => PositionDetails(
                                                                  position: "Vice Mayor",
                                                                  cardColor: veripolColors.passionRed,
                                                                  bgImageURL: "assets/vice_mayor_text_bg.png",
                                                                  numberOfCandidates:
                                                                      candidateDataController.candidates.length,
                                                                  positionDescription:
                                                                      dataController.positionDescription["vice-mayor"],
                                                                  topOffset: -5,
                                                                  leftOffset: 60,
                                                                  bgImageSize: const Size(296, 117),
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                          posBgImageURL: "assets/vice_mayor_text_bg.png",
                                                          topOffset: 10,
                                                          leftOffset: 40,
                                                          posBgImageSize: const Size(318, 92),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                });
                                              },
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            CandidateTypeCardNavigationButton(
                                              type: "COUNCILORS",
                                              imageURL: "assets/councilor_text_bg.png",
                                              bgColor: veripolColors.darkSunYellow,
                                              imageSize: const Size(299, 105),
                                              imageLeftOffset: 15,
                                              imageTopOffset: 10,
                                              onTap: () async {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) => const VeripolSplash(),
                                                  ),
                                                );
                                                paginationController.clearFields();
                                                await candidateDataController
                                                    .readCouncilors(dataController.province, dataController.city)
                                                    .whenComplete(() {
                                                  Future.delayed(const Duration(seconds: 1), () {}).whenComplete(
                                                    () => Navigator.pushReplacement(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) => CandidatesList(
                                                          screenSize: Size(size.width, size.height),
                                                          candidates: candidateDataController.candidates,
                                                          position: "Councilors",
                                                          description: dataController.positionDescription["councilors"],
                                                          posCardColor: veripolColors.sunYellowVar,
                                                          learnMore: () {
                                                            Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                builder: (context) => PositionDetails(
                                                                  position: "Councilors",
                                                                  cardColor: veripolColors.sunYellowVar,
                                                                  bgImageURL: "assets/councilor_text_bg.png",
                                                                  numberOfCandidates:
                                                                      candidateDataController.candidates.length,
                                                                  positionDescription:
                                                                      dataController.positionDescription["councilors"],
                                                                  topOffset: 5,
                                                                  leftOffset: 100,
                                                                  bgImageSize: const Size(259, 90),
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                          posBgImageURL: "assets/councilor_text_bg.png",
                                                          topOffset: 5,
                                                          leftOffset: 100,
                                                          posBgImageSize: const Size(261, 94),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                });
                                              },
                                            ),
                                          ],
                                        )
                                      : Column(
                                          children: [
                                            CandidateTypeCardNavigationButton(
                                              type: "BRGY. CAPTAIN",
                                              imageURL: "assets/brgy_captain_text_bg.png",
                                              bgColor: veripolColors.blueTrust,
                                              imageSize: const Size(330, 120),
                                              imageLeftOffset: 5,
                                              imageTopOffset: 25,
                                              onTap: () {
                                                paginationController.clearFields();
                                                List<CandidateData> brgyCaptain = [];

                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) => CandidatesList(
                                                      screenSize: Size(size.width, size.height),
                                                      candidates: brgyCaptain,
                                                      position: "Brgy. Captain",
                                                      description: dataController.positionDescription["brgy-captain"],
                                                      posCardColor: veripolColors.blueTrust,
                                                      learnMore: () {
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) => PositionDetails(
                                                              position: "Brgy. Captain",
                                                              cardColor: veripolColors.blueTrust,
                                                              bgImageURL: "assets/brgy_captain_text_bg.png",
                                                              numberOfCandidates: brgyCaptain.length,
                                                              positionDescription:
                                                                  dataController.positionDescription["brgy-captain"],
                                                              topOffset: -5,
                                                              leftOffset: 70,
                                                              bgImageSize: const Size(294, 104),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                      posBgImageURL: "assets/brgy_captain_text_bg.png",
                                                      topOffset: -10,
                                                      leftOffset: 70,
                                                      posBgImageSize: const Size(291, 99),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            CandidateTypeCardNavigationButton(
                                              type: "BRGY. OFFICER",
                                              imageURL: "assets/brgy_officer_text_bg.png",
                                              bgColor: veripolColors.darkRedPassion,
                                              imageSize: const Size(370, 139),
                                              imageLeftOffset: -10,
                                              imageTopOffset: 10,
                                              onTap: () {
                                                paginationController.clearFields();
                                                List<CandidateData> brgyOfficer = [];

                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) => CandidatesList(
                                                      screenSize: Size(size.width, size.height),
                                                      candidates: brgyOfficer,
                                                      position: "Brgy. Officer",
                                                      description: dataController.positionDescription["brgy-officer"],
                                                      posCardColor: veripolColors.passionRed,
                                                      learnMore: () {
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) => PositionDetails(
                                                              position: "Brgy. Officer",
                                                              cardColor: veripolColors.passionRed,
                                                              bgImageURL: "assets/brgy_officer_text_bg.png",
                                                              numberOfCandidates: brgyOfficer.length,
                                                              positionDescription:
                                                                  dataController.positionDescription["brgy-officer"],
                                                              topOffset: -15,
                                                              leftOffset: 20,
                                                              bgImageSize: const Size(345, 126),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                      posBgImageURL: "assets/brgy_officer_text_bg.png",
                                                      topOffset: -5,
                                                      leftOffset: 20,
                                                      posBgImageSize: const Size(346, 123),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            CandidateTypeCardNavigationButton(
                                              type: "SK CHAIRMAN",
                                              imageURL: "assets/sk_chairman_text_bg.png",
                                              bgColor: veripolColors.darkSunYellow,
                                              imageSize: const Size(359, 100),
                                              imageLeftOffset: -10,
                                              imageTopOffset: 30,
                                              onTap: () {
                                                paginationController.clearFields();
                                                List<CandidateData> skChairman = [];

                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) => CandidatesList(
                                                      screenSize: Size(size.width, size.height),
                                                      candidates: skChairman,
                                                      position: "SK Chairman",
                                                      description: dataController.positionDescription["sk-chairman"],
                                                      posCardColor: veripolColors.sunYellowVar,
                                                      learnMore: () {
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) => PositionDetails(
                                                              position: "SK Chairman",
                                                              cardColor: veripolColors.sunYellowVar,
                                                              bgImageURL: "assets/sk_chairman_text_bg.png",
                                                              numberOfCandidates: skChairman.length,
                                                              positionDescription:
                                                                  dataController.positionDescription["sk-chairman"],
                                                              topOffset: 5,
                                                              leftOffset: 25,
                                                              bgImageSize: const Size(343, 96),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                      posBgImageURL: "assets/sk_chairman_text_bg.png",
                                                      topOffset: 5,
                                                      leftOffset: 25,
                                                      posBgImageSize: const Size(342, 96),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                          const SizedBox(
                            height: 20,
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
