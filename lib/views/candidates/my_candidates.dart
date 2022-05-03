import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:veripol/components/my_candidates_municipal_tab.dart';
import 'package:veripol/components/my_candidates_overview_tab.dart';
import 'package:veripol/components/my_candidates_provincial_tab.dart';
import 'package:veripol/controller/candidate_data_controller.dart';
import 'package:veripol/controller/data_controller.dart';
import 'package:veripol/views/splash.dart';

import '../../components/my_candidates_national_tab.dart';
import '../../components/themes.dart';
import '../../controller/my_candidate_data_controller.dart';

class MyCandidatesScreen extends StatefulWidget {
  const MyCandidatesScreen({Key? key}) : super(key: key);

  @override
  State<MyCandidatesScreen> createState() => _MyCandidatesScreenState();
}

class _MyCandidatesScreenState extends State<MyCandidatesScreen> {
  bool isLoading = true;
  @override
  void initState() {
    buildNationalData().whenComplete(() {
      Future.delayed(const Duration(seconds: 2), () {}).whenComplete(() {
        setState(() {
          isLoading = false;
        });
      });
    });

    super.initState();
  }

  Future<void> buildNationalData() async {
    MyCandidatesDataController mycandidateController =
        MyCandidatesDataController();
    DataController dataController = DataController();
    if (dataController.userData["my_candidates"]["president"] != "" &&
        dataController.userData["my_candidates"]["president"] != null) {
      await mycandidateController.initReadPresident(
          dataController.userData["my_candidates"]["president"]);
      mycandidateController.initMyPresident(1);
    } else {
      mycandidateController.initMyPresident(0);
    }

    if (dataController.userData["my_candidates"]["vicePresident"] != "" &&
        dataController.userData["my_candidates"]["vicePresident"] != null) {
      await mycandidateController.initReadVicePresident(
          dataController.userData["my_candidates"]["vicePresident"]);
      mycandidateController.initMyVicePresident(1);
    } else {
      mycandidateController.initMyVicePresident(0);
    }

    if (dataController.userData["my_candidates"]["houseRep"] != "" &&
        dataController.userData["my_candidates"]["houseRep"] != null) {
      await mycandidateController.initReadHouseOfReps(
          dataController.userData["my_candidates"]["houseRep"]);
      mycandidateController.initMyHouseReps(1);
    } else {
      mycandidateController.initMyHouseReps(0);
    }

    if (List<String>.from(dataController.userData["my_candidates"]["senators"])
            .isNotEmpty &&
        dataController.userData["my_candidates"]["senators"] != null) {
      await mycandidateController.initReadSenators(
          dataController.userData["my_candidates"]["senators"],
          dataController.userData["my_candidates"]["senatorIndices"]);

      mycandidateController.initMySenators(List<String>.from(
              dataController.userData["my_candidates"]["senators"])
          .length);

      mycandidateController.initMySenatorIndices(
          dataController.userData["my_candidates"]["senatorIndices"]);

      mycandidateController.initMySenatorList(
          dataController.userData["my_candidates"]["senators"] ?? []);
    } else {
      mycandidateController.initMySenators(0);
    }

    if (dataController.userData["my_candidates"]["partyList"] != "" &&
        dataController.userData["my_candidates"]["partyList"] != null) {
      await mycandidateController.initReadPartyList(
          dataController.userData["my_candidates"]["partyList"]);
      mycandidateController.initMyPartyList(1);
    } else {
      mycandidateController.initMyPartyList(0);
    }

    if (dataController.userData["my_candidates"]["governor"] != "" &&
        dataController.userData["my_candidates"]["governor"] != null) {
      await mycandidateController.initReadGovernor(
          dataController.userData["my_candidates"]["governor"]);
      mycandidateController.initMyGovernor(1);
    } else {
      mycandidateController.initMyGovernor(0);
    }

    if (dataController.userData["my_candidates"]["viceGovernor"] != "" &&
        dataController.userData["my_candidates"]["viceGovernor"] != null) {
      await mycandidateController.initReadViceGovernor(
          dataController.userData["my_candidates"]["viceGovernor"]);
      mycandidateController.initMyViceGovernor(1);
    } else {
      mycandidateController.initMyViceGovernor(0);
    }

    if (List<String>.from(
                dataController.userData["my_candidates"]["provincialBoard"])
            .isNotEmpty &&
        dataController.userData["my_candidates"]["provincialBoard"] != null) {
      await mycandidateController.initReadProvincialBoard(
          dataController.userData["my_candidates"]["provincialBoard"],
          dataController.userData["my_candidates"]["provincialBoardIndices"]);

      mycandidateController.initMyProvincialBoards(List<String>.from(
              dataController.userData["my_candidates"]["provincialBoard"])
          .length);

      mycandidateController.initMyProvincialBoardIndices(
          dataController.userData["my_candidates"]["provincialBoardIndices"]);

      mycandidateController.initMyProvincialBoardList(
          dataController.userData["my_candidates"]["provincialBoard"] ?? []);
    } else {
      mycandidateController.initMyProvincialBoards(0);
    }

    if (dataController.userData["my_candidates"]["mayor"] != "" &&
        dataController.userData["my_candidates"]["mayor"] != null) {
      await mycandidateController
          .initReadMayor(dataController.userData["my_candidates"]["mayor"]);
      mycandidateController.initMyMayor(1);
    } else {
      mycandidateController.initMyMayor(0);
    }

    if (dataController.userData["my_candidates"]["viceMayor"] != "" &&
        dataController.userData["my_candidates"]["viceMayor"] != null) {
      await mycandidateController.initReadViceMayor(
          dataController.userData["my_candidates"]["viceMayor"]);
      mycandidateController.initMyViceMayor(1);
    } else {
      mycandidateController.initMyViceMayor(0);
    }

    if (List<String>.from(
                dataController.userData["my_candidates"]["cityCouncilors"])
            .isNotEmpty &&
        dataController.userData["my_candidates"]["cityCouncilors"] != null) {
      await mycandidateController.initReadCouncilors(
          dataController.userData["my_candidates"]["cityCouncilors"],
          dataController.userData["my_candidates"]["cityCouncilorIndices"]);

      mycandidateController.initMyCouncilors(List<String>.from(
              dataController.userData["my_candidates"]["cityCouncilors"])
          .length);

      mycandidateController.initMyCouncilorsIndices(
          dataController.userData["my_candidates"]["cityCouncilorIndices"]);

      mycandidateController.initMyCouncilorsList(
          dataController.userData["my_candidates"]["cityCouncilors"] ?? []);
    } else {
      mycandidateController.initMyCouncilors(0);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final scale = mockUpWidth / size.width;
    final textScale = size.width / mockUpWidth;
    final dataController = Provider.of<DataController>(context);
    final candidateDataController =
        Provider.of<CandidateDataController>(context);
    final myCandidatesController =
        Provider.of<MyCandidatesDataController>(context);
    return isLoading
        ? const VeripolSplash()
        : Scaffold(
            backgroundColor: veripolColors.background,
            key: myCandidatesController.scaffoldKey,
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
                  DefaultTabController(
                    length: candidateDataController.highlyUrbanizedCities
                            .contains(dataController.city)
                        ? 3
                        : 4,
                    child: SingleChildScrollView(
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
                                ],
                              ),
                            ),
                            Container(
                              width: size.width,
                              decoration: const BoxDecoration(
                                color: Color(0xff051923),
                              ),
                              child: Stack(
                                children: [
                                  Positioned(
                                    right: 0,
                                    top: -5 / mockUpHeight * size.height,
                                    height: 94 / mockUpHeight * size.height,
                                    width: 326 / mockUpWidth * size.width,
                                    child: Image.asset(
                                        "assets/my_candidates_bg.png"),
                                  ),
                                  Container(
                                    width: size.width,
                                    decoration: const BoxDecoration(),
                                    padding: EdgeInsets.only(
                                      top: 6.5 / mockUpHeight * size.height,
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 10 /
                                                  mockUpWidth *
                                                  size.width),
                                          child: Text(
                                            "My Candidates",
                                            style: veripolTextStyles
                                                .headlineLarge
                                                .copyWith(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                            height: 10 /
                                                mockUpHeight *
                                                size.height),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 10 /
                                                  mockUpWidth *
                                                  size.width),
                                          child: Text(
                                            "MAY 2022 ELECTIONS",
                                            style: veripolTextStyles.labelSmall
                                                .copyWith(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height:
                                              26.5 / mockUpHeight * size.height,
                                        ),
                                        candidateDataController
                                                .highlyUrbanizedCities
                                                .contains(dataController.city)
                                            ? TabBar(
                                                labelPadding: EdgeInsets.zero,
                                                padding: EdgeInsets.zero,
                                                indicatorColor:
                                                    veripolColors.sunYellow,
                                                indicatorSize:
                                                    TabBarIndicatorSize.label,
                                                indicatorWeight: 5 /
                                                    mockUpHeight *
                                                    size.height,
                                                isScrollable: true,
                                                unselectedLabelColor: Colors
                                                    .white
                                                    .withOpacity(0.50),
                                                labelColor:
                                                    veripolColors.sunYellow,
                                                tabs: [
                                                  Container(
                                                    width: 125 /
                                                        mockUpWidth *
                                                        size.width,
                                                    padding: EdgeInsets.only(
                                                      bottom: 5 /
                                                          mockUpHeight *
                                                          size.height,
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        "Overview",
                                                        style: veripolTextStyles
                                                            .labelMedium,
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 125 /
                                                        mockUpWidth *
                                                        size.width,
                                                    padding: EdgeInsets.only(
                                                      bottom: 5 /
                                                          mockUpHeight *
                                                          size.height,
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        "National",
                                                        style: veripolTextStyles
                                                            .labelMedium,
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 125 /
                                                        mockUpWidth *
                                                        size.width,
                                                    padding: EdgeInsets.only(
                                                      bottom: 5 /
                                                          mockUpHeight *
                                                          size.height,
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        "Municipal",
                                                        style: veripolTextStyles
                                                            .labelMedium,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            : TabBar(
                                                labelPadding: EdgeInsets.zero,
                                                padding: EdgeInsets.zero,
                                                indicatorColor:
                                                    veripolColors.sunYellow,
                                                indicatorSize:
                                                    TabBarIndicatorSize.label,
                                                indicatorWeight: 5 /
                                                    mockUpHeight *
                                                    size.height,
                                                isScrollable: true,
                                                unselectedLabelColor: Colors
                                                    .white
                                                    .withOpacity(0.50),
                                                labelColor:
                                                    veripolColors.sunYellow,
                                                tabs: [
                                                  Container(
                                                    width: 93.75 /
                                                        mockUpWidth *
                                                        size.width,
                                                    padding: EdgeInsets.only(
                                                      bottom: 5 /
                                                          mockUpHeight *
                                                          size.height,
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        "Overview",
                                                        style: veripolTextStyles
                                                            .labelMedium,
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 93.75 /
                                                        mockUpWidth *
                                                        size.width,
                                                    padding: EdgeInsets.only(
                                                      bottom: 5 /
                                                          mockUpHeight *
                                                          size.height,
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        "National",
                                                        style: veripolTextStyles
                                                            .labelMedium,
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 93.75 /
                                                        mockUpWidth *
                                                        size.width,
                                                    padding: EdgeInsets.only(
                                                      bottom: 5 /
                                                          mockUpHeight *
                                                          size.height,
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        "Provincial",
                                                        style: veripolTextStyles
                                                            .labelMedium,
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 93.75 /
                                                        mockUpWidth *
                                                        size.width,
                                                    padding: EdgeInsets.only(
                                                      bottom: 5 /
                                                          mockUpHeight *
                                                          size.height,
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        "Municipal",
                                                        style: veripolTextStyles
                                                            .labelMedium,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            candidateDataController.highlyUrbanizedCities
                                    .contains(dataController.city)
                                ? Expanded(
                                    child: TabBarView(
                                      children: [
                                        MyCandidatesOverviewTab(
                                          textScale: textScale,
                                          screenSize: size,
                                        ),
                                        MyCandidatesNationalTab(
                                          textScale: textScale,
                                          screenSize: size,
                                        ),
                                        MyCandidatesMunicipalTab(
                                          textScale: textScale,
                                          screenSize: size,
                                        ),
                                      ],
                                    ),
                                  )
                                : Expanded(
                                    child: TabBarView(
                                      children: [
                                        MyCandidatesOverviewTab(
                                          textScale: textScale,
                                          screenSize: size,
                                        ),
                                        MyCandidatesNationalTab(
                                          textScale: textScale,
                                          screenSize: size,
                                        ),
                                        MyCandidatesProvincialTab(
                                          textScale: textScale,
                                          screenSize: size,
                                        ),
                                        MyCandidatesMunicipalTab(
                                          textScale: textScale,
                                          screenSize: size,
                                        ),
                                      ],
                                    ),
                                  ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
