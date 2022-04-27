import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../components/full_name_card.dart';
import '../../components/no_information_available.dart';
import '../../components/themes.dart';
import '../../controller/data_controller.dart';
import '../../controller/my_candidate_data_controller.dart';
import '../../models/models.dart';

class HouseOfRepresentativesProfile extends StatefulWidget {
  const HouseOfRepresentativesProfile({
    Key? key,
    required this.position,
    required this.data,
  }) : super(key: key);

  final String position;
  final CandidateData data;

  @override
  State<HouseOfRepresentativesProfile> createState() =>
      _HouseOfRepresentativesProfileState();
}

class _HouseOfRepresentativesProfileState
    extends State<HouseOfRepresentativesProfile> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final scale = mockUpWidth / size.width;
    final textScale = size.width / mockUpWidth;
    final dataController = Provider.of<DataController>(context);
    final myCandidatesController =
        Provider.of<MyCandidatesDataController>(context);
    return Scaffold(
      backgroundColor: veripolColors.background,
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Positioned(
              top: 86 / mockUpHeight * size.height,
              child: Image.asset(
                "assets/bg_pattern.png",
                scale: scale,
              ),
            ),
            DefaultTabController(
              length: 3,
              child: Container(
                width: size.width,
                height: size.height,
                padding: EdgeInsets.only(
                  top: 48 / mockUpHeight * size.height,
                ),
                child: Column(
                  children: [
                    Container(
                      width: 375 / mockUpWidth * size.width,
                      height: 56 / mockUpHeight * size.height,
                      padding: EdgeInsets.only(
                        top: 12 / mockUpHeight * size.height,
                        left: 16 / mockUpWidth * size.width,
                        right: 16 / mockUpWidth * size.width,
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
                            "Candidate",
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
                          GestureDetector(
                            onTap: () async {
                              if (dataController.userData["my_candidates"]
                                          ["houseRep"] ==
                                      null ||
                                  dataController.userData["my_candidates"]
                                          ["houseRep"] ==
                                      "") {
                                myCandidatesController
                                    .setMyHORRunTime(widget.data.id);
                                await myCandidatesController
                                    .storeMyHORToDb(widget.data.id)
                                    .whenComplete(() async {
                                  await myCandidatesController
                                      .cacheMyHOR(widget.data.id);
                                });
                              } else {
                                if (dataController.userData["my_candidates"]
                                        ["houseRep"] ==
                                    widget.data.id) {
                                  myCandidatesController.setMyHORRunTime("");
                                  await myCandidatesController
                                      .storeMyHORToDb("")
                                      .whenComplete(() async {
                                    await myCandidatesController.cacheMyHOR("");
                                  });
                                } else {
                                  myCandidatesController
                                      .setMyHORRunTime(widget.data.id);
                                  await myCandidatesController
                                      .storeMyHORToDb(widget.data.id)
                                      .whenComplete(() async {
                                    await myCandidatesController
                                        .cacheMyHOR(widget.data.id);
                                  });
                                }
                              }
                            },
                            child: dataController.userData["my_candidates"]
                                            ["houseRep"] ==
                                        null ||
                                    dataController.userData["my_candidates"]
                                            ["houseRep"] ==
                                        ''
                                ? Image.asset(
                                    'assets/heart_outlined.png',
                                    scale: scale,
                                    width: 24 / mockUpWidth * size.width,
                                    height: 22 / mockUpHeight * size.height,
                                  )
                                : dataController.userData["my_candidates"]
                                            ["houseRep"] ==
                                        widget.data.id
                                    ? Image.asset(
                                        'assets/heart_filled.png',
                                        scale: scale,
                                        width: 24 / mockUpWidth * size.width,
                                        height: 22 / mockUpHeight * size.height,
                                      )
                                    : Image.asset(
                                        'assets/heart_outlined.png',
                                        scale: scale,
                                        width: 24 / mockUpWidth * size.width,
                                        height: 22 / mockUpHeight * size.height,
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
                          Container(
                            width: size.width,
                            decoration: const BoxDecoration(
                              color: Color(0xff141414),
                            ),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Positioned(
                                  top: -30 / mockUpHeight * size.height,
                                  right: -10 / mockUpWidth * size.width,
                                  child: Text(
                                    "#" +
                                        widget
                                            .data
                                            .filedCandidacies["May 9, 2022"]
                                                ["ballot_number"]
                                            .toString(),
                                    textScaleFactor: textScale,
                                    style: TextStyle(
                                      fontFamily: "MountainScript",
                                      fontSize: 150,
                                      fontWeight: FontWeight.w400,
                                      height: 1.467,
                                      letterSpacing: 0.06,
                                      color: Colors.white.withOpacity(0.10),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: size.width,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                          height:
                                              24 / mockUpHeight * size.height),
                                      Text(
                                        "CAMPAIGNING FOR",
                                        style: veripolTextStyles.labelSmall
                                            .copyWith(
                                          color: const Color(0xffFFFFF0),
                                        ),
                                      ),
                                      Text(
                                        widget.position + " of the Philippines",
                                        textScaleFactor: textScale,
                                        style: veripolTextStyles.titleMedium
                                            .copyWith(
                                          color: const Color(0xffFFFFF0),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10 / mockUpHeight * size.height,
                                      ),
                                      Container(
                                        width: 105 / mockUpWidth * size.width,
                                        height: 105 / mockUpWidth * size.width,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          boxShadow: [
                                            BoxShadow(
                                              offset: Offset(
                                                  0,
                                                  8 /
                                                      mockUpHeight *
                                                      size.height),
                                              blurRadius:
                                                  12 / mockUpWidth * size.width,
                                              spreadRadius:
                                                  6 / mockUpWidth * size.width,
                                              color: Colors.black
                                                  .withOpacity(0.15),
                                            ),
                                            BoxShadow(
                                              offset: Offset(
                                                  0,
                                                  4 /
                                                      mockUpHeight *
                                                      size.height),
                                              blurRadius:
                                                  4 / mockUpWidth * size.width,
                                              spreadRadius: 0,
                                              color: Colors.black
                                                  .withOpacity(0.30),
                                            ),
                                          ],
                                          image: const DecorationImage(
                                            image: AssetImage(
                                              "assets/default_profile_img.png",
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 19 / mockUpHeight * size.height,
                                      ),
                                      Text(
                                        widget
                                                .data
                                                .filedCandidacies["May 9, 2022"]
                                                    ["ballot_number"]
                                                .toString() +
                                            ". " +
                                            widget.data.filedCandidacies[
                                                "May 9, 2022"]["ballot_name"],
                                        textScaleFactor: textScale,
                                        style: veripolTextStyles.titleMedium
                                            .copyWith(
                                          color: const Color(0xffFFFFF0),
                                        ),
                                      ),
                                      Text(
                                        widget.data
                                                .filedCandidacies["May 9, 2022"]
                                            ["political_party"],
                                        textScaleFactor: textScale,
                                        style: veripolTextStyles.titleSmall
                                            .copyWith(
                                          color: const Color(0xffFFFFF0),
                                        ),
                                      ),
                                      SizedBox(
                                          height:
                                              29 / mockUpHeight * size.height),
                                      SizedBox(
                                        height: 26 / mockUpHeight * size.height,
                                        child: TabBar(
                                          labelPadding: EdgeInsets.zero,
                                          padding: EdgeInsets.zero,
                                          indicatorColor:
                                              veripolColors.sunYellow,
                                          indicatorSize:
                                              TabBarIndicatorSize.label,
                                          indicatorWeight:
                                              5 / mockUpHeight * size.height,
                                          isScrollable: true,
                                          unselectedLabelColor:
                                              Colors.white.withOpacity(0.50),
                                          labelColor: veripolColors.sunYellow,
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
                                              width: 150 /
                                                  mockUpWidth *
                                                  size.width,
                                              padding: EdgeInsets.only(
                                                bottom: 5 /
                                                    mockUpHeight *
                                                    size.height,
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "Accomplishments",
                                                  style: veripolTextStyles
                                                      .labelMedium,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: 173 /
                                                  mockUpWidth *
                                                  size.width,
                                              padding: EdgeInsets.only(
                                                bottom: 5 /
                                                    mockUpHeight *
                                                    size.height,
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "Relevant Experiences",
                                                  style: veripolTextStyles
                                                      .labelMedium,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: size.width,
                            height:
                                size.height - 395 / mockUpHeight * size.height,
                            child: TabBarView(
                              children: [
                                // About the Candidate
                                ListView(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 20 / mockUpHeight * size.height,
                                  ),
                                  children: [
                                    Container(
                                      width: size.width,
                                      margin: EdgeInsets.symmetric(
                                          horizontal:
                                              10 / mockUpWidth * size.width),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            "About the Candidate",
                                            textScaleFactor: textScale,
                                            style: veripolTextStyles.labelLarge
                                                .copyWith(
                                              color: Colors.black,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 5 / mockUpWidth * size.width,
                                          ),
                                          Expanded(
                                            child: Divider(
                                              height: 20 /
                                                  mockUpHeight *
                                                  size.height,
                                              thickness: 1 /
                                                  mockUpHeight *
                                                  size.height,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10 / mockUpHeight * size.height,
                                    ),
                                    widget.data.name != ""
                                        ? FullNameCard(
                                            fullName: widget.data.name)
                                        : const NoInformationAvailable()
                                  ],
                                ),

                                // Accomplishments

                                ListView(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 20 / mockUpHeight * size.height,
                                  ),
                                  children: [
                                    Container(
                                      width: size.width,
                                      margin: EdgeInsets.symmetric(
                                          horizontal:
                                              10 / mockUpWidth * size.width),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Accomplishments",
                                            textScaleFactor: textScale,
                                            style: veripolTextStyles.labelLarge
                                                .copyWith(
                                              color: Colors.black,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 5 / mockUpWidth * size.width,
                                          ),
                                          Expanded(
                                            child: Divider(
                                              height: 20 /
                                                  mockUpHeight *
                                                  size.height,
                                              thickness: 1 /
                                                  mockUpHeight *
                                                  size.height,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10 / mockUpHeight * size.height,
                                    ),
                                    const NoInformationAvailable(),
                                    SizedBox(
                                      height: 20 / mockUpHeight * size.height,
                                    ),
                                    Container(
                                      width: size.width,
                                      margin: EdgeInsets.symmetric(
                                          horizontal:
                                              10 / mockUpWidth * size.width),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Primary Referrals",
                                            textScaleFactor: textScale,
                                            style: veripolTextStyles.labelLarge
                                                .copyWith(
                                              color: Colors.black,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 5 / mockUpWidth * size.width,
                                          ),
                                          Expanded(
                                            child: Divider(
                                              height: 20 /
                                                  mockUpHeight *
                                                  size.height,
                                              thickness: 1 /
                                                  mockUpHeight *
                                                  size.height,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10 / mockUpHeight * size.height,
                                    ),
                                    const NoInformationAvailable(),
                                  ],
                                ),

                                // Relevant Experiences

                                ListView(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 20 / mockUpHeight * size.height,
                                  ),
                                  children: [
                                    Container(
                                      width: size.width,
                                      margin: EdgeInsets.symmetric(
                                          horizontal:
                                              10 / mockUpWidth * size.width),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Relevant Experiences",
                                            textScaleFactor: textScale,
                                            style: veripolTextStyles.labelLarge
                                                .copyWith(
                                              color: Colors.black,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 5 / mockUpWidth * size.width,
                                          ),
                                          Expanded(
                                            child: Divider(
                                              height: 20 /
                                                  mockUpHeight *
                                                  size.height,
                                              thickness: 1 /
                                                  mockUpHeight *
                                                  size.height,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10 / mockUpHeight * size.height,
                                    ),
                                    const NoInformationAvailable(),
                                  ],
                                ),
                              ],
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
