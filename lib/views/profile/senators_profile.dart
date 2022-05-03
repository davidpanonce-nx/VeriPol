import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../components/full_name_card.dart';
import '../../components/no_information_available.dart';
import '../../components/themes.dart';
import '../../controller/data_controller.dart';
import '../../controller/my_candidate_data_controller.dart';
import '../../models/models.dart';

class SenatorsProfile extends StatefulWidget {
  const SenatorsProfile({
    Key? key,
    required this.data,
    this.index,
  }) : super(key: key);

  final CandidateData data;
  final int? index;

  @override
  State<SenatorsProfile> createState() => _SenatorsProfileState();
}

class _SenatorsProfileState extends State<SenatorsProfile> {
  @override
  void initState() {
    super.initState();
  }

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
                child: SingleChildScrollView(
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
                                if (List<String>.from(dataController
                                        .userData["my_candidates"]["senators"])
                                    .isEmpty) {
                                  if (widget.index != null) {
                                    myCandidatesController
                                        .setMySenatorIndices(widget.index!);
                                  }
                                  myCandidatesController
                                      .setMySenatorsList(widget.data.id);
                                  myCandidatesController.setMySenatorsRunTime(
                                      myCandidatesController.mySenatorsList,
                                      myCandidatesController.mySenatorIndices);
                                  await myCandidatesController
                                      .storeMySenatorsToDb();
                                  await myCandidatesController
                                      .cacheMySenatorsList();
                                  await myCandidatesController
                                      .readSenators(
                                        dataController.userData["my_candidates"]
                                            ["senators"],
                                        dataController.userData["my_candidates"]
                                            ["senatorIndices"],
                                      )
                                      .whenComplete(() => myCandidatesController
                                          .buildSenatorWidgets(
                                              context, size, textScale));
                                } else {
                                  if (List<String>.from(dataController
                                              .userData["my_candidates"]
                                          ["senators"])
                                      .contains(widget.data.id)) {
                                    if (widget.index != null) {
                                      if (myCandidatesController
                                          .mySenatorIndices
                                          .contains(widget.index)) {
                                        myCandidatesController
                                            .removeMySenatorIndex(
                                                widget.index!);
                                      } else {
                                        Map<String, dynamic> temp = {};
                                        temp.addAll(
                                          Map<String, dynamic>.from(
                                              myCandidatesController
                                                  .myNationalData["senators"]),
                                        );
                                        String tempIndex = "";
                                        tempIndex = temp.keys.firstWhere(
                                          (element) =>
                                              temp[element].id ==
                                              widget.data.id,
                                        );
                                        myCandidatesController
                                            .removeMySenatorIndex(
                                                int.parse(tempIndex));
                                      }
                                    }
                                    myCandidatesController
                                        .removeSenator(widget.data.id);

                                    myCandidatesController.setMySenatorsRunTime(
                                        myCandidatesController.mySenatorsList,
                                        myCandidatesController
                                            .mySenatorIndices);
                                    await myCandidatesController
                                        .storeMySenatorsToDb();
                                    await myCandidatesController
                                        .cacheMySenatorsList();

                                    await myCandidatesController
                                        .readSenators(
                                          dataController
                                                  .userData["my_candidates"]
                                              ["senators"],
                                          dataController
                                                  .userData["my_candidates"]
                                              ["senatorIndices"],
                                        )
                                        .whenComplete(() =>
                                            myCandidatesController
                                                .buildSenatorWidgets(
                                                    context, size, textScale));
                                  } else {
                                    if (widget.index != null) {
                                      if (myCandidatesController
                                          .mySenatorIndices
                                          .contains(widget.index)) {
                                        Map<String, dynamic> temp = {};
                                        temp.addAll(
                                          Map<String, dynamic>.from(
                                              myCandidatesController
                                                  .myNationalData["senators"]),
                                        );
                                        String tempId = "";
                                        tempId =
                                            temp[widget.index.toString()].id;

                                        myCandidatesController
                                            .removeSenator(tempId);
                                      } else {
                                        myCandidatesController
                                            .setMySenatorIndices(widget.index!);
                                      }
                                    }
                                    myCandidatesController
                                        .setMySenatorsList(widget.data.id);
                                    myCandidatesController.setMySenatorsRunTime(
                                        myCandidatesController.mySenatorsList,
                                        myCandidatesController
                                            .mySenatorIndices);
                                    await myCandidatesController
                                        .storeMySenatorsToDb();
                                    await myCandidatesController
                                        .cacheMySenatorsList();

                                    await myCandidatesController
                                        .readSenators(
                                          dataController
                                                  .userData["my_candidates"]
                                              ["senators"],
                                          dataController
                                                  .userData["my_candidates"]
                                              ["senatorIndices"],
                                        )
                                        .whenComplete(() =>
                                            myCandidatesController
                                                .buildSenatorWidgets(
                                                    context, size, textScale));
                                  }
                                }
                              },
                              child: List<String>.from(dataController
                                              .userData["my_candidates"]
                                          ["senators"])
                                      .isEmpty
                                  ? Image.asset(
                                      'assets/heart_outlined.png',
                                      scale: scale,
                                      width: 24 / mockUpWidth * size.width,
                                      height: 22 / mockUpHeight * size.height,
                                    )
                                  : List<String>.from(myCandidatesController
                                              .mySenatorsList)
                                          .contains(widget.data.id)
                                      ? Image.asset(
                                          'assets/heart_filled.png',
                                          scale: scale,
                                          width: 24 / mockUpWidth * size.width,
                                          height:
                                              22 / mockUpHeight * size.height,
                                        )
                                      : Image.asset(
                                          'assets/heart_outlined.png',
                                          scale: scale,
                                          width: 24 / mockUpWidth * size.width,
                                          height:
                                              22 / mockUpHeight * size.height,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                            height: 24 /
                                                mockUpHeight *
                                                size.height),
                                        Text(
                                          "CAMPAIGNING FOR",
                                          style: veripolTextStyles.labelSmall
                                              .copyWith(
                                            color: const Color(0xffFFFFF0),
                                          ),
                                        ),
                                        Text(
                                          "Senator of the Philippines",
                                          textScaleFactor: textScale,
                                          style: veripolTextStyles.titleMedium
                                              .copyWith(
                                            color: const Color(0xffFFFFF0),
                                          ),
                                        ),
                                        SizedBox(
                                          height:
                                              10 / mockUpHeight * size.height,
                                        ),
                                        Container(
                                          width: 105 / mockUpWidth * size.width,
                                          height:
                                              105 / mockUpWidth * size.width,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            boxShadow: [
                                              BoxShadow(
                                                offset: Offset(
                                                    0,
                                                    8 /
                                                        mockUpHeight *
                                                        size.height),
                                                blurRadius: 12 /
                                                    mockUpWidth *
                                                    size.width,
                                                spreadRadius: 6 /
                                                    mockUpWidth *
                                                    size.width,
                                                color: Colors.black
                                                    .withOpacity(0.15),
                                              ),
                                              BoxShadow(
                                                offset: Offset(
                                                    0,
                                                    4 /
                                                        mockUpHeight *
                                                        size.height),
                                                blurRadius: 4 /
                                                    mockUpWidth *
                                                    size.width,
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
                                          height:
                                              19 / mockUpHeight * size.height,
                                        ),
                                        Text(
                                          widget
                                                  .data
                                                  .filedCandidacies[
                                                      "May 9, 2022"]
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
                                          widget.data.filedCandidacies[
                                              "May 9, 2022"]["political_party"],
                                          textAlign: TextAlign.center,
                                          textScaleFactor: textScale,
                                          style: veripolTextStyles.titleSmall
                                              .copyWith(
                                            color: const Color(0xffFFFFF0),
                                          ),
                                        ),
                                        SizedBox(
                                            height: 29 /
                                                mockUpHeight *
                                                size.height),
                                        SizedBox(
                                          height:
                                              26 / mockUpHeight * size.height,
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
                                                width: 190 /
                                                    mockUpWidth *
                                                    size.width,
                                                padding: EdgeInsets.only(
                                                  bottom: 5 /
                                                      mockUpHeight *
                                                      size.height,
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    "Educational Background",
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
                              height: size.height -
                                  395 / mockUpHeight * size.height,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: TabBarView(
                                      children: [
                                        // Overview

                                        ListView(
                                          padding: EdgeInsets.symmetric(
                                            vertical:
                                                20 / mockUpHeight * size.height,
                                          ),
                                          children: [
                                            Container(
                                              width: size.width,
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 10 /
                                                      mockUpWidth *
                                                      size.width),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "About the Candidate",
                                                    textScaleFactor: textScale,
                                                    style: veripolTextStyles
                                                        .labelLarge
                                                        .copyWith(
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 5 /
                                                        mockUpWidth *
                                                        size.width,
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
                                              height: 10 /
                                                  mockUpHeight *
                                                  size.height,
                                            ),
                                            widget.data.name != ""
                                                ? FullNameCard(
                                                    fullName: widget.data.name)
                                                : const NoInformationAvailable(),
                                          ],
                                        ),

                                        // Educational Background

                                        ListView(
                                          padding: EdgeInsets.symmetric(
                                            vertical:
                                                20 / mockUpHeight * size.height,
                                          ),
                                          children: [
                                            Container(
                                              width: size.width,
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 10 /
                                                      mockUpWidth *
                                                      size.width),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "Educational Background",
                                                    textScaleFactor: textScale,
                                                    style: veripolTextStyles
                                                        .labelLarge
                                                        .copyWith(
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 5 /
                                                        mockUpWidth *
                                                        size.width,
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
                                              height: 10 /
                                                  mockUpHeight *
                                                  size.height,
                                            ),
                                            const NoInformationAvailable(),
                                          ],
                                        ),

                                        // Relevant Experiences
                                        ListView(
                                          padding: EdgeInsets.symmetric(
                                            vertical:
                                                20 / mockUpHeight * size.height,
                                          ),
                                          children: [
                                            Container(
                                              width: size.width,
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 10 /
                                                      mockUpWidth *
                                                      size.width),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "Relevant Experiences",
                                                    textScaleFactor: textScale,
                                                    style: veripolTextStyles
                                                        .labelLarge
                                                        .copyWith(
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 5 /
                                                        mockUpWidth *
                                                        size.width,
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
                                              height: 10 /
                                                  mockUpHeight *
                                                  size.height,
                                            ),
                                            const NoInformationAvailable(),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        bottom:
                                            15 / mockUpHeight * size.height),
                                    child: InkWell(
                                      onTap: () async {
                                        final query = widget.data.name
                                            .replaceAll(",", "")
                                            .split(" ")
                                            .join("+");
                                        final url =
                                            "https://www.google.com/search?q=$query";
                                        if (await canLaunch(url)) {
                                          await launch(url);
                                        }
                                      },
                                      child: Container(
                                        width: 345 / mockUpWidth * size.width,
                                        height: 60 / mockUpHeight * size.height,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.black, width: 4),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: Colors.transparent,
                                        ),
                                        child: Center(
                                          child: SizedBox(
                                            width:
                                                250 / mockUpWidth * size.width,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Search Candidate on Google',
                                                  textScaleFactor: textScale,
                                                  style: veripolTextStyles
                                                      .labelLarge
                                                      .copyWith(
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                Image.asset(
                                                    'assets/google_logo.png')
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        bottom:
                                            30 / mockUpHeight * size.height),
                                    child: InkWell(
                                      onTap: () async {
                                        final url = widget.data.profileURL;
                                        if (await canLaunch(url)) {
                                          await launch(url);
                                        }
                                      },
                                      child: Container(
                                        width: 345 / mockUpWidth * size.width,
                                        height: 60 / mockUpHeight * size.height,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.black, width: 4),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: const Color(0xFF141414),
                                        ),
                                        child: Center(
                                          child: SizedBox(
                                            width:
                                                280 / mockUpWidth * size.width,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'View Candidate Dashboard on',
                                                  textScaleFactor: textScale,
                                                  style: veripolTextStyles
                                                      .labelLarge
                                                      .copyWith(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                Image.asset(
                                                    'assets/votepilipinas_logo.png')
                                              ],
                                            ),
                                          ),
                                        ),
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
