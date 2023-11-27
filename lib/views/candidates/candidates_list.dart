import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:veripol/components/candidate_card.dart';
import 'package:veripol/components/candidate_position_card.dart';
import 'package:veripol/components/no_info_candidate_card.dart';
import 'package:veripol/controller/candidate_data_controller.dart';
import 'package:veripol/controller/pagination_controllers.dart';
import 'package:veripol/models/models.dart';

import '../../components/themes.dart';
import 'candidate_search.dart';

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
    required this.candidates,
    required this.screenSize,
    required this.textScale,
  }) : super(key: key);

  final String position;
  final String description;
  final Color posCardColor;
  final VoidCallback? learnMore;
  final String posBgImageURL;
  final double topOffset;
  final double leftOffset;
  final Size posBgImageSize;
  final List<CandidateData> candidates;
  final Size screenSize;
  final double textScale;

  @override
  State<CandidatesList> createState() => _CandidatesListState();
}

class _CandidatesListState extends State<CandidatesList> {
  List<Widget> houseOfReps = [];
  List<Widget> provincialBoard = [];

  void buildHouseOfReps() {
    PaginationController paginationController = PaginationController();
    Map<String, List<Widget>> districtWidgets = {};
    List<String> repDistricts = [];
    for (var candidate in paginationController.tempo) {
      if (candidate.filedCandidacies["May 9, 2022"]["location"]
              ["municipality"] !=
          null) {
        if (!repDistricts.contains(
            "(${candidate.filedCandidacies["May 9, 2022"]["location"]["municipality"]})${candidate.filedCandidacies["May 9, 2022"]["location"]["district"]}")) {
          setState(() {
            repDistricts.add(
                "(${candidate.filedCandidacies["May 9, 2022"]["location"]["municipality"]})${candidate.filedCandidacies["May 9, 2022"]["location"]["district"]}");
          });
        }
      } else {
        if (!repDistricts.contains(candidate.filedCandidacies["May 9, 2022"]
            ["location"]["district"])) {
          setState(() {
            repDistricts.add(candidate.filedCandidacies["May 9, 2022"]
                ["location"]["district"]);
          });
        }
      }
    }

    for (int i = 0; i < paginationController.tempo.length; i++) {
      for (var district in repDistricts) {
        if (paginationController.tempo[i].filedCandidacies["May 9, 2022"]
                ["location"]["municipality"] !=
            null) {
          if ("(${paginationController.tempo[i].filedCandidacies["May 9, 2022"]["location"]["municipality"]})${paginationController.tempo[i].filedCandidacies["May 9, 2022"]["location"]["district"]}" ==
              district) {
            if (districtWidgets.containsKey(district)) {
              districtWidgets[district]?.add(
                CandidateCard(data: paginationController.tempo[i]),
              );
            } else {
              districtWidgets.addAll({
                district: [
                  CandidateCard(data: paginationController.tempo[i]),
                ],
              });
            }
          }
        } else {
          if (paginationController.tempo[i].filedCandidacies["May 9, 2022"]
                  ["location"]["district"] ==
              district) {
            if (districtWidgets.containsKey(district)) {
              districtWidgets[district]?.add(
                CandidateCard(data: paginationController.tempo[i]),
              );
            } else {
              districtWidgets.addAll({
                district: [
                  CandidateCard(data: paginationController.tempo[i]),
                ],
              });
            }
          }
        }
      }
    }

    districtWidgets.forEach((key, value) {
      setState(() {
        houseOfReps.add(
          Column(
            children: [
              SizedBox(
                width: widget.screenSize.width,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      key,
                      textScaleFactor: widget.textScale,
                      style: veripolTextStyles.labelLarge.copyWith(
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 5 / mockUpWidth * widget.screenSize.width,
                    ),
                    Expanded(
                      child: Divider(
                        height: 20 / mockUpHeight * widget.screenSize.height,
                        thickness: 1 / mockUpHeight * widget.screenSize.height,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10 / mockUpHeight * widget.screenSize.height,
              ),
              Column(
                children: value,
              ),
              SizedBox(
                height: 20 / mockUpHeight * widget.screenSize.height,
              ),
            ],
          ),
        );
      });
    });
  }

  void buildProvincialBoard() {
    PaginationController paginationController = PaginationController();
    Map<String, List<Widget>> districtWidgets = {};
    List<String> repDistricts = [];
    for (var candidate in paginationController.tempo) {
      if (!repDistricts.contains(
          candidate.filedCandidacies["May 9, 2022"]["location"]["district"])) {
        setState(() {
          repDistricts.add(candidate.filedCandidacies["May 9, 2022"]["location"]
              ["district"]);
        });
      }
    }

    for (int i = 0; i < paginationController.tempo.length; i++) {
      for (var district in repDistricts) {
        if (district ==
            paginationController.tempo[i].filedCandidacies["May 9, 2022"]
                ["location"]["district"]) {
          if (districtWidgets.containsKey(district)) {
            districtWidgets[district]?.add(
              CandidateCard(data: paginationController.tempo[i]),
            );
          } else {
            districtWidgets.addAll({
              district: [
                CandidateCard(data: paginationController.tempo[i]),
              ],
            });
          }
        }
      }
    }

    districtWidgets.forEach((key, value) {
      setState(() {
        provincialBoard.add(
          Column(
            children: [
              SizedBox(
                width: widget.screenSize.width,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      key,
                      textScaleFactor: widget.textScale,
                      style: veripolTextStyles.labelLarge.copyWith(
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 5 / mockUpWidth * widget.screenSize.width,
                    ),
                    Expanded(
                      child: Divider(
                        height: 20 / mockUpHeight * widget.screenSize.height,
                        thickness: 1 / mockUpHeight * widget.screenSize.height,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10 / mockUpHeight * widget.screenSize.height,
              ),
              Column(
                children: value,
              ),
              SizedBox(
                height: 20 / mockUpHeight * widget.screenSize.height,
              ),
            ],
          ),
        );
      });
    });
  }

  @override
  void initState() {
    initData();
    if (widget.position == "House of Representatives") {
      buildHouseOfReps();
    } else {
      if (widget.position == "Provincial Board") {
        buildProvincialBoard();
      }
    }
    super.initState();
  }

  void initData() {
    PaginationController paginationController = PaginationController();
    paginationController.initPaginationData(widget.candidates);
  }

  void updateList() {}
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final scale = mockUpWidth / size.width;
    final textScale = size.width / mockUpWidth;
    final paginationController = Provider.of<PaginationController>(context);
    final candidateDataController =
        Provider.of<CandidateDataController>(context);
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
                              candidateDataController.clearRunTimeData();
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
                          const Expanded(child: SizedBox()),
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CandidateSearch(
                                    candidates: widget.candidates,
                                  ),
                                ),
                              );
                            },
                            iconSize: 24 / mockUpWidth * size.width,
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
                                    widget.position == "SK Chairman" ||
                                    widget.candidates.isEmpty
                                ? const NoInformationCandidateCard()
                                : widget.position == "House of Representatives"
                                    ? Column(
                                        children: houseOfReps,
                                      )
                                    : widget.position == "Provincial Board"
                                        ? Column(
                                            children: provincialBoard,
                                          )
                                        : Column(
                                            children: List.generate(
                                                paginationController
                                                            .length <=
                                                        10
                                                    ? paginationController
                                                        .length
                                                    : paginationController
                                                        .tempo.length, (index) {
                                              return CandidateCard(
                                                  data: paginationController
                                                      .tempo[index]);
                                            }),
                                          ),
                          ),
                          widget.candidates.length > 10
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      onPressed:
                                          paginationController.startCount > 1
                                              ? () {
                                                  paginationController
                                                      .decrementPageCount();
                                                  paginationController
                                                      .setTempo();
                                                  if (widget.position ==
                                                      "House of Representatives") {
                                                    houseOfReps.clear();

                                                    buildHouseOfReps();
                                                  } else {
                                                    if (widget.position ==
                                                        "Provincial Board") {
                                                      provincialBoard.clear();
                                                      buildProvincialBoard();
                                                    }
                                                  }
                                                }
                                              : null,
                                      icon: Icon(
                                        Icons.arrow_back_ios,
                                        size: 24 / mockUpWidth * size.width,
                                        color:
                                            paginationController.startCount == 1
                                                ? Colors.black.withOpacity(0.50)
                                                : Colors.black,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 6 / mockUpWidth * size.width,
                                    ),
                                    SizedBox(
                                      width: 32 / mockUpWidth * size.width,
                                      child: Center(
                                        child: Text(
                                          paginationController.startCount
                                              .toString(),
                                          style: veripolTextStyles.bodyMedium
                                              .copyWith(color: Colors.black),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 6 / mockUpWidth * size.width,
                                    ),
                                    SizedBox(
                                      width: 32 / mockUpWidth * size.width,
                                      child: Center(
                                        child: Text(
                                          "of",
                                          style: veripolTextStyles.bodyMedium
                                              .copyWith(color: Colors.black),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 6 / mockUpWidth * size.width,
                                    ),
                                    SizedBox(
                                      width: 32 / mockUpWidth * size.width,
                                      child: Center(
                                        child: Text(
                                          paginationController.endCount
                                              .toString(),
                                          style: veripolTextStyles.bodyMedium
                                              .copyWith(color: Colors.black),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 6 / mockUpWidth * size.width,
                                    ),
                                    IconButton(
                                      onPressed: paginationController
                                                  .startCount <
                                              paginationController.endCount
                                          ? () {
                                              paginationController
                                                  .incrementPageCount();
                                              paginationController.setTempo();
                                              if (widget.position ==
                                                  "House of Representatives") {
                                                houseOfReps.clear();

                                                buildHouseOfReps();
                                              } else {
                                                if (widget.position ==
                                                    "Provincial Board") {
                                                  provincialBoard.clear();
                                                  buildProvincialBoard();
                                                }
                                              }
                                            }
                                          : null,
                                      icon: Icon(
                                        Icons.arrow_forward_ios,
                                        size: 24 / mockUpWidth * size.width,
                                        color: paginationController
                                                    .startCount ==
                                                paginationController.endCount
                                            ? Colors.black.withOpacity(0.50)
                                            : Colors.black,
                                      ),
                                    ),
                                  ],
                                )
                              : const SizedBox(),
                          SizedBox(
                            height: 20 / mockUpHeight * size.height,
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
