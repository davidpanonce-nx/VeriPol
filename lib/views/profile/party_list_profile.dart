import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:veripol/components/no_information_available.dart';

import '../../components/full_name_card.dart';
import '../../components/themes.dart';
import '../../controller/data_controller.dart';
import '../../controller/my_candidate_data_controller.dart';
import '../../models/models.dart';

class PartyListProfile extends StatefulWidget {
  const PartyListProfile({
    Key? key,
    required this.data,
    required this.description,
  }) : super(key: key);

  final CandidateData data;
  final String description;
  @override
  State<PartyListProfile> createState() => _PartyListProfileState();
}

class _PartyListProfileState extends State<PartyListProfile> {
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
            Container(
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
                                        ["partyList"] ==
                                    null ||
                                dataController.userData["my_candidates"]
                                        ["partyList"] ==
                                    "") {
                              myCandidatesController.setMyPartyList(1);
                              myCandidatesController
                                  .setMyPartyListRunTime(widget.data.id);
                              await myCandidatesController
                                  .storeMyPartyListToDb(widget.data.id)
                                  .whenComplete(() async {
                                await myCandidatesController
                                    .cacheMyPartyList(widget.data.id);

                                if (dataController.userData["my_candidates"]
                                            ["partyList"] !=
                                        "" &&
                                    dataController.userData["my_candidates"]
                                            ["partyList"] !=
                                        null) {
                                  await myCandidatesController.readPartyList(
                                      dataController.userData["my_candidates"]
                                          ["partyList"]);
                                }
                              });
                            } else {
                              if (dataController.userData["my_candidates"]
                                      ["partyList"] ==
                                  widget.data.id) {
                                myCandidatesController.setMyPartyList(-1);
                                myCandidatesController
                                    .setMyPartyListRunTime("");
                                await myCandidatesController
                                    .storeMyPartyListToDb("")
                                    .whenComplete(() async {
                                  await myCandidatesController
                                      .cacheMyPartyList("");
                                  myCandidatesController
                                      .setMyPartyListDataToNull();
                                });
                              } else {
                                myCandidatesController
                                    .setMyPartyListRunTime(widget.data.id);
                                await myCandidatesController
                                    .storeMyPartyListToDb(widget.data.id)
                                    .whenComplete(() async {
                                  await myCandidatesController
                                      .cacheMyPartyList(widget.data.id);
                                  await myCandidatesController.readPartyList(
                                      dataController.userData["my_candidates"]
                                          ["partyList"]);
                                });
                              }
                            }
                          },
                          child: dataController.userData["my_candidates"]
                                          ["partyList"] ==
                                      null ||
                                  dataController.userData["my_candidates"]
                                          ["partyList"] ==
                                      ''
                              ? Image.asset(
                                  'assets/heart_outlined.png',
                                  scale: scale,
                                  width: 24 / mockUpWidth * size.width,
                                  height: 22 / mockUpHeight * size.height,
                                )
                              : dataController.userData["my_candidates"]
                                          ["partyList"] ==
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
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                        height:
                                            32 / mockUpHeight * size.height),
                                    Text(
                                      "PARTY LIST",
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
                                            offset: Offset(0,
                                                8 / mockUpHeight * size.height),
                                            blurRadius:
                                                12 / mockUpWidth * size.width,
                                            spreadRadius:
                                                6 / mockUpWidth * size.width,
                                            color:
                                                Colors.black.withOpacity(0.15),
                                          ),
                                          BoxShadow(
                                            offset: Offset(0,
                                                4 / mockUpHeight * size.height),
                                            blurRadius:
                                                4 / mockUpWidth * size.width,
                                            spreadRadius: 0,
                                            color:
                                                Colors.black.withOpacity(0.30),
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
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal:
                                              20 / mockUpWidth * size.width),
                                      child: Text(
                                        widget.data
                                                .filedCandidacies["May 9, 2022"]
                                            ["political_party"],
                                        textAlign: TextAlign.center,
                                        textScaleFactor: textScale,
                                        style: veripolTextStyles.titleSmall
                                            .copyWith(
                                          color: const Color(0xffFFFFF0),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 29 / mockUpHeight * size.height,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: size.width,
                          height:
                              size.height - 360 / mockUpHeight * size.height,
                          padding: EdgeInsets.symmetric(
                            vertical: 20 / mockUpHeight * size.height,
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
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
                                        "About the Party-List",
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
                                          height:
                                              20 / mockUpHeight * size.height,
                                          thickness:
                                              1 / mockUpHeight * size.height,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10 / mockUpHeight * size.height,
                                ),
                                widget.data.filedCandidacies["May 9, 2022"]
                                            ["political_party"] !=
                                        ""
                                    ? FullNameCard(
                                        fullName: widget.data
                                                .filedCandidacies["May 9, 2022"]
                                            ["political_party"])
                                    : const NoInformationAvailable(),
                                SizedBox(
                                  height: 20 / mockUpHeight * size.height,
                                ),
                                widget.description != ""
                                    ? Container(
                                        width: 345 / mockUpWidth * size.width,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(
                                            8 / mockUpWidth * size.width,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black
                                                  .withOpacity(0.30),
                                              spreadRadius: 0,
                                              blurRadius:
                                                  2 / mockUpWidth * size.width,
                                              offset: Offset(
                                                  0,
                                                  1 /
                                                      mockUpHeight *
                                                      size.height),
                                            ),
                                            BoxShadow(
                                              color: Colors.black
                                                  .withOpacity(0.15),
                                              spreadRadius:
                                                  1 / mockUpWidth * size.width,
                                              blurRadius:
                                                  3 / mockUpWidth * size.width,
                                              offset: Offset(
                                                0,
                                                1 / mockUpHeight * size.height,
                                              ),
                                            ),
                                          ],
                                        ),
                                        padding: EdgeInsets.symmetric(
                                          horizontal:
                                              20 / mockUpWidth * size.width,
                                          vertical:
                                              20 / mockUpHeight * size.height,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              widget.data.name,
                                              style: veripolTextStyles
                                                  .titleSmall
                                                  .copyWith(
                                                color: Colors.black,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10 /
                                                  mockUpHeight *
                                                  size.height,
                                            ),
                                            Text(
                                              "Description",
                                              style: veripolTextStyles.bodySmall
                                                  .copyWith(
                                                color: const Color(0xff575E71),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10 /
                                                  mockUpHeight *
                                                  size.height,
                                            ),
                                            Text(
                                              widget.description,
                                              style: veripolTextStyles
                                                  .bodyMedium
                                                  .copyWith(
                                                color: Colors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    : const NoInformationAvailable(),
                              ],
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
    );
  }
}
