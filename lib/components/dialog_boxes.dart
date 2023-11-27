import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:veripol/components/themes.dart';

import '../controller/chart_controller.dart';
import '../controller/data_controller.dart';
import '../controller/my_candidate_data_controller.dart';
import '../views/profile/board_councilors_profile.dart';
import '../views/profile/governor_vice_profile.dart';
import '../views/profile/house_of_reps.dart';
import '../views/profile/mayor_vice_profile.dart';
import '../views/profile/party_list_profile.dart';
import '../views/profile/pres_vice_profile.dart';
import '../views/profile/senators_profile.dart';
import '../views/registration location/voter.dart';

class DialogBoxes {
  removeOrViewDialog(BuildContext context, Size size, String position, String id, int? index) {
    final dataController = Provider.of<DataController>(context, listen: false);
    final myCandidatesController = Provider.of<MyCandidatesDataController>(context, listen: false);
    final chartController = Provider.of<ChartController>(context, listen: false);
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            insetPadding: EdgeInsets.zero,
            titlePadding: EdgeInsets.zero,
            elevation: 5,
            title: Container(
              width: 340,
              height: 210,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 9,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Select Candidate",
                        style: GoogleFonts.roboto(
                          textStyle: const TextStyle(
                            fontStyle: FontStyle.normal,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            height: 1.15,
                            letterSpacing: 0.15,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        iconSize: 24,
                        color: Colors.black,
                        icon: const Icon(Icons.close),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 131,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: position == "PRESIDENT"
                              ? () async {
                                  myCandidatesController.setMyPresident(-1);
                                  myCandidatesController.setMyPresidentRunTime("");
                                  await myCandidatesController.storeMyPresidentToDb("").whenComplete(() async {
                                    await myCandidatesController.cacheMyPresident("");

                                    myCandidatesController.setMyPresidentDataToNull();
                                  }).whenComplete(() => Navigator.pop(context));
                                }
                              : position == "VICE-PRESIDENT"
                                  ? () async {
                                      myCandidatesController.setMyVicePresident(-1);
                                      myCandidatesController.setMyVicePresidentRunTime("");
                                      await myCandidatesController.storeMyVicePresidentToDb("").whenComplete(() async {
                                        await myCandidatesController.cacheMyVicePresident("");
                                        myCandidatesController.setMyVicePresidentDataToNull();
                                      }).whenComplete(() => Navigator.pop(context));
                                    }
                                  : position == "SENATORS"
                                      ? () async {
                                          if (index != null) {
                                            myCandidatesController.removeMySenatorIndex(index);
                                          }
                                          myCandidatesController.removeSenator(id);

                                          myCandidatesController.setMySenators(
                                              List<String>.from(dataController.userData["my_candidates"]["senators"])
                                                  .length);

                                          myCandidatesController.setMySenatorsRunTime(
                                              myCandidatesController.mySenatorsList,
                                              myCandidatesController.mySenatorIndices);
                                          await myCandidatesController.storeMySenatorsToDb();
                                          await myCandidatesController.cacheMySenatorsList();

                                          await myCandidatesController
                                              .readSenators(
                                            dataController.userData["my_candidates"]["senators"],
                                            dataController.userData["my_candidates"]["senatorIndices"],
                                          )
                                              .whenComplete(() {
                                            myCandidatesController.buildSenatorWidgets(context, size);
                                            Navigator.pop(context);
                                          });
                                        }
                                      : position == "HOUSE OF REP"
                                          ? () async {
                                              myCandidatesController.setMyHouseReps(-1);
                                              myCandidatesController.setMyHORRunTime("");
                                              await myCandidatesController.storeMyHORToDb("").whenComplete(() async {
                                                await myCandidatesController.cacheMyHOR("");
                                                myCandidatesController.setMyHouserepsDataToNull();
                                              }).whenComplete(() => Navigator.pop(context));
                                            }
                                          : position == "PARTY LIST"
                                              ? () async {
                                                  myCandidatesController.setMyPartyList(-1);
                                                  myCandidatesController.setMyPartyListRunTime("");
                                                  await myCandidatesController
                                                      .storeMyPartyListToDb("")
                                                      .whenComplete(() async {
                                                    await myCandidatesController.cacheMyPartyList("");
                                                    myCandidatesController.setMyPartyListDataToNull();
                                                  }).whenComplete(() => Navigator.pop(context));
                                                }
                                              : position == "GOVERNOR"
                                                  ? () async {
                                                      myCandidatesController.setMyGovernor(0);
                                                      myCandidatesController.setMyGovernorRunTime("");
                                                      await myCandidatesController
                                                          .storeMyGovernorToDb("")
                                                          .whenComplete(() async {
                                                        await myCandidatesController.cacheMyGovernor("");

                                                        myCandidatesController.setMyGovernorDataToNull();
                                                      }).whenComplete(() => Navigator.pop(context));
                                                    }
                                                  : position == "VICE-GOVERNOR"
                                                      ? () async {
                                                          myCandidatesController.setMyViceGovernor(-1);
                                                          myCandidatesController.setMyViceGovernorRunTime("");
                                                          await myCandidatesController
                                                              .storeMyViceGovernorToDb("")
                                                              .whenComplete(() async {
                                                            await myCandidatesController.cacheMyViceGovernor("");

                                                            myCandidatesController.setMyViceGovernorDataToNull();
                                                          }).whenComplete(() => Navigator.pop(context));
                                                        }
                                                      : position == "PROVINCIAL BOARD"
                                                          ? () async {
                                                              if (index != null) {
                                                                myCandidatesController
                                                                    .removeMyProvincialBoardIndex(index);
                                                              }
                                                              myCandidatesController.removeProvincialBoard(id);

                                                              myCandidatesController.setMyProvincialBoards(
                                                                  List<String>.from(dataController
                                                                          .userData["my_candidates"]["provincialBoard"])
                                                                      .length);

                                                              myCandidatesController.setMyProvincialBoardRunTime(
                                                                  myCandidatesController.myProvincialBoardList,
                                                                  myCandidatesController.myProvincialBoardIndices);
                                                              await myCandidatesController.storeMyProvincialBoardToDb();
                                                              await myCandidatesController
                                                                  .cacheMyProvincivalBoardList();

                                                              await myCandidatesController
                                                                  .readProvincialBoard(
                                                                dataController.userData["my_candidates"]
                                                                    ["provincialBoard"],
                                                                dataController.userData["my_candidates"]
                                                                    ["provincialBoardIndices"],
                                                              )
                                                                  .whenComplete(() {
                                                                myCandidatesController.buildProvincialBoardWidgets(
                                                                    context, size);
                                                                Navigator.pop(context);
                                                              });
                                                            }
                                                          : position == "MAYOR"
                                                              ? () async {
                                                                  myCandidatesController.setMyMayor(-1);
                                                                  myCandidatesController.setMyMayorRunTime("");
                                                                  await myCandidatesController
                                                                      .storeMyMayorToDb("")
                                                                      .whenComplete(() async {
                                                                    await myCandidatesController.cacheMyMayor("");
                                                                    myCandidatesController.setMyMayorDataToNull();
                                                                  }).whenComplete(() => Navigator.pop(context));
                                                                }
                                                              : position == "VICE MAYOR"
                                                                  ? () async {
                                                                      myCandidatesController.setMyViceMayor(-1);
                                                                      myCandidatesController.setMyViceMayorRunTime("");
                                                                      await myCandidatesController
                                                                          .storeMyViceMayorToDb("")
                                                                          .whenComplete(() async {
                                                                        await myCandidatesController
                                                                            .cacheMyViceMayor("");

                                                                        myCandidatesController
                                                                            .setMyViceMayorDataToNull();
                                                                      }).whenComplete(() => Navigator.pop(context));
                                                                    }
                                                                  : () async {
                                                                      if (index != null) {
                                                                        myCandidatesController
                                                                            .removeMyCouncilorIndex(index);
                                                                      }
                                                                      myCandidatesController.removeCouncilor(id);

                                                                      myCandidatesController.setMyCouncilors(
                                                                          List<String>.from(dataController
                                                                                      .userData["my_candidates"]
                                                                                  ["cityCouncilors"])
                                                                              .length);

                                                                      myCandidatesController.setMyCouncilorRunTime(
                                                                          myCandidatesController.myCouncilorList,
                                                                          myCandidatesController.myCouncilorIndices);
                                                                      await myCandidatesController
                                                                          .storeMyCouncilorsToDb();
                                                                      await myCandidatesController
                                                                          .cacheMyCouncilorsList();

                                                                      await myCandidatesController
                                                                          .readMyCouncilors(
                                                                        dataController.userData["my_candidates"]
                                                                            ["cityCouncilors"],
                                                                        dataController.userData["my_candidates"]
                                                                            ["cityCouncilorIndices"],
                                                                      )
                                                                          .whenComplete(() {
                                                                        myCandidatesController.buildCouncilorWidgets(
                                                                            context, size);
                                                                        Navigator.pop(context);
                                                                      });
                                                                    },
                          child: Container(
                            height: 60,
                            decoration: BoxDecoration(
                              color: veripolColors.passionRed,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                "Remove Candidate",
                                style: veripolTextStyles.labelLarge.copyWith(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            Navigator.pop(context);
                            if (position == "PRESIDENT") {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PresidentViceCandidateProfile(
                                    data: myCandidatesController.myNationalData["president"],
                                  ),
                                ),
                              );
                            } else if (position == "VICE-PRESIDENT") {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PresidentViceCandidateProfile(
                                    data: myCandidatesController.myNationalData["vicePresident"],
                                  ),
                                ),
                              );
                            } else if (position == "SENATORS") {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SenatorsProfile(
                                    index: index,
                                    data: myCandidatesController.myNationalData["senators"][index.toString()],
                                  ),
                                ),
                              );
                            } else if (position == "HOUSE OF REP") {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HouseOfRepresentativesProfile(
                                    position: "House of Representative",
                                    data: myCandidatesController.myNationalData["houseRep"],
                                  ),
                                ),
                              );
                            } else if (position == "PARTY LIST") {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PartyListProfile(
                                    data: myCandidatesController.myNationalData["partyList"],
                                    description: "",
                                  ),
                                ),
                              );
                            } else if (position == "GOVERNOR") {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => GovernorViceProfile(
                                    position: "PROVINCIAL GOVERNOR",
                                    data: myCandidatesController.myNationalData["governor"],
                                  ),
                                ),
                              );
                            } else if (position == "VICE-GOVERNOR") {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => GovernorViceProfile(
                                    position: "PROVINCIAL VICE-GOVERNOR",
                                    data: myCandidatesController.myNationalData["viceGovernor"],
                                  ),
                                ),
                              );
                            } else if (position == "PROVINCIAL BOARD") {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProvincialBoardCouncilorsProfile(
                                    index: index,
                                    position: "PROVINCIAL BOARD",
                                    data: myCandidatesController.myNationalData["provincialBoard"][index.toString()],
                                  ),
                                ),
                              );
                            } else if (position == "MAYOR") {
                              await chartController
                                  .readCMCIData(
                                myCandidatesController.myNationalData["mayor"].id,
                                myCandidatesController.myNationalData["mayor"].filedCandidacies["location"]["id"],
                              )
                                  .whenComplete(() {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MayorViceProfile(
                                        data: myCandidatesController.myNationalData["mayor"], position: "MAYOR"),
                                  ),
                                );
                              });
                            } else if (position == "VICE-MAYOR") {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MayorViceProfile(
                                      data: myCandidatesController.myNationalData["viceMayor"], position: "VICE MAYOR"),
                                ),
                              );
                            } else {
                              if (position == "COUNCILOR") {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProvincialBoardCouncilorsProfile(
                                        index: index,
                                        data: myCandidatesController.myNationalData["councilors"][index.toString()],
                                        position: "COUNCILOR"),
                                  ),
                                );
                              }
                            }
                          },
                          child: Container(
                            height: 60,
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: const Color(0xff141414),
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                "View Profile",
                                style: veripolTextStyles.labelLarge.copyWith(color: const Color(0xff141414)),
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
          );
        });
  }

//CHANGE LOCATION DIALOG
  changeLocationDialog(
    BuildContext context,
    Size size,
  ) {
    return showDialog(
        context: context,
        builder: (context) {
          final dataController = Provider.of<DataController>(context, listen: false);
          return AlertDialog(
            insetPadding: EdgeInsets.zero,
            titlePadding: EdgeInsets.zero,
            elevation: 5,
            title: Container(
              width: 340,
              height: 230,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 9,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      "Changing your location will remove affected candidates on your candidate list. Continue?",
                      maxLines: 3,
                      textAlign: TextAlign.justify,
                      style: GoogleFonts.roboto(
                        textStyle: const TextStyle(
                          fontStyle: FontStyle.normal,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          height: 1.15,
                          letterSpacing: 0.15,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 131,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            dataController.readJson();
                            Navigator.pop(context);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Voter(),
                              ),
                            );
                          },
                          child: Container(
                            height: 60,
                            decoration: BoxDecoration(
                              color: const Color(0xff141414),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                "Change a Location",
                                style: veripolTextStyles.labelLarge.copyWith(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            height: 60,
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: const Color(0xff141414),
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                "Cancel",
                                style: veripolTextStyles.labelLarge.copyWith(color: const Color(0xff141414)),
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
          );
        });
  }

//CHECK LATER FOR IMPROVEMENTS

  addOrViewProfile(BuildContext context, String position) {
    final size = MediaQuery.of(context).size;
    final dataController = Provider.of<DataController>(context, listen: false);
    final myCandidatesController = Provider.of<MyCandidatesDataController>(context, listen: false);
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            insetPadding: EdgeInsets.zero,
            titlePadding: EdgeInsets.zero,
            elevation: 5,
            title: Container(
              width: 340,
              height: 210,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 9,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Select Candidate",
                        style: GoogleFonts.roboto(
                          textStyle: const TextStyle(
                            fontStyle: FontStyle.normal,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            height: 1.15,
                            letterSpacing: 0.15,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        iconSize: 24,
                        color: Colors.black,
                        icon: const Icon(Icons.close),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 131,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: position == "PRESIDENT"
                              ? () async {
                                  myCandidatesController.setMyPresident(-1);
                                  myCandidatesController.setMyPresidentRunTime("");
                                  await myCandidatesController.storeMyPresidentToDb("").whenComplete(() async {
                                    await myCandidatesController.cacheMyPresident("");
                                  }).whenComplete(() => Navigator.pop(context));
                                }
                              : position == "VICE-PRESIDENT"
                                  ? () async {
                                      myCandidatesController.setMyVicePresident(-1);
                                      myCandidatesController.setMyViceGovernorRunTime("");
                                      await myCandidatesController.storeMyVicePresidentToDb("").whenComplete(() async {
                                        await myCandidatesController.cacheMyVicePresident("");
                                      }).whenComplete(() => Navigator.pop(context));
                                    }
                                  : position == "SENATORS"
                                      ? () async {
                                          myCandidatesController.setMySenators(-1);
                                          myCandidatesController.setMyPresidentRunTime("");
                                          await myCandidatesController.storeMyPresidentToDb("").whenComplete(() async {
                                            await myCandidatesController.cacheMyPresident("");
                                          }).whenComplete(() {
                                            myCandidatesController.buildSenatorWidgets(context, size);
                                          });
                                        }
                                      : position == "HOUSE OF REPS"
                                          ? () async {
                                              myCandidatesController.setMyHouseReps(-1);
                                              myCandidatesController.setMyHORRunTime("");
                                              await myCandidatesController.storeMyHORToDb("").whenComplete(() async {
                                                await myCandidatesController.cacheMyHOR("");
                                              }).whenComplete(() => Navigator.pop(context));
                                            }
                                          : position == "PARTY LIST"
                                              ? () async {
                                                  myCandidatesController.setMyPartyList(-1);
                                                  myCandidatesController.setMyPartyListRunTime("");
                                                  await myCandidatesController
                                                      .storeMyPartyListToDb("")
                                                      .whenComplete(() async {
                                                    await myCandidatesController.cacheMyPartyList("");
                                                  }).whenComplete(() => Navigator.pop(context));
                                                }
                                              : position == "GOVERNOR"
                                                  ? () async {
                                                      myCandidatesController.setMyGovernor(0);
                                                      myCandidatesController.setMyGovernorRunTime("");
                                                      await myCandidatesController
                                                          .storeMyGovernorToDb("")
                                                          .whenComplete(() async {
                                                        await myCandidatesController.cacheMyGovernor("");

                                                        if (dataController.userData["my_candidates"]["governor"] !=
                                                                "" &&
                                                            dataController.userData["my_candidates"]["governor"] !=
                                                                null) {
                                                          await myCandidatesController.readGovernor(
                                                              dataController.userData["my_candidates"]["governor"]);
                                                        }
                                                      }).whenComplete(() => Navigator.pop(context));
                                                    }
                                                  : position == "VICE-GOVERNOR"
                                                      ? () async {
                                                          myCandidatesController.setMyViceGovernor(-1);
                                                          myCandidatesController.setMyViceGovernorRunTime("");
                                                          await myCandidatesController
                                                              .storeMyViceGovernorToDb("")
                                                              .whenComplete(() async {
                                                            await myCandidatesController.cacheMyViceGovernor("");

                                                            if (dataController.userData["my_candidates"]
                                                                        ["viceGovernor"] !=
                                                                    "" &&
                                                                dataController.userData["my_candidates"]
                                                                        ["viceGovernor"] !=
                                                                    null) {
                                                              await myCandidatesController.readViceGovernor(
                                                                  dataController.userData["my_candidates"]
                                                                      ["viceGovernor"]);
                                                            }
                                                          }).whenComplete(() => Navigator.pop(context));
                                                        }
                                                      : position == "PROVINCIAL BOARD"
                                                          ? () async {
                                                              myCandidatesController.setMyProvincialBoards(-1);
                                                              myCandidatesController.setMyPartyListRunTime("");
                                                              await myCandidatesController
                                                                  .storeMyPartyListToDb("")
                                                                  .whenComplete(() async {
                                                                await myCandidatesController.cacheMyPartyList("");
                                                              }).whenComplete(() => Navigator.pop(context));
                                                            }
                                                          : position == "MAYOR"
                                                              ? () async {
                                                                  myCandidatesController.setMyMayor(-1);
                                                                  myCandidatesController.setMyMayorRunTime("");
                                                                  await myCandidatesController
                                                                      .storeMyMayorToDb("")
                                                                      .whenComplete(() async {
                                                                    await myCandidatesController.cacheMyMayor("");

                                                                    if (dataController.userData["my_candidates"]
                                                                                ["mayor"] !=
                                                                            "" &&
                                                                        dataController.userData["my_candidates"]
                                                                                ["mayor"] !=
                                                                            null) {
                                                                      await myCandidatesController.readMayor(
                                                                          dataController.userData["my_candidates"]
                                                                              ["mayor"]);
                                                                    }
                                                                  }).whenComplete(() => Navigator.pop(context));
                                                                }
                                                              : position == "VICE MAYOR"
                                                                  ? () async {
                                                                      myCandidatesController.setMyViceMayor(-1);
                                                                      myCandidatesController.setMyViceMayorRunTime("");
                                                                      await myCandidatesController
                                                                          .storeMyViceMayorToDb("")
                                                                          .whenComplete(() async {
                                                                        await myCandidatesController
                                                                            .cacheMyViceMayor("");

                                                                        if (dataController.userData["my_candidates"]
                                                                                    ["viceMayor"] !=
                                                                                "" &&
                                                                            dataController.userData["my_candidates"]
                                                                                    ["viceMayor"] !=
                                                                                null) {
                                                                          await myCandidatesController.readViceMayor(
                                                                              dataController.userData["my_candidates"]
                                                                                  ["viceMayor"]);
                                                                        }
                                                                      }).whenComplete(() => Navigator.pop(context));
                                                                    }
                                                                  : () async {
                                                                      myCandidatesController.setMyCouncilors(-1);
                                                                      myCandidatesController.setMyPartyListRunTime("");
                                                                      await myCandidatesController
                                                                          .storeMyPartyListToDb("")
                                                                          .whenComplete(() async {
                                                                        await myCandidatesController
                                                                            .cacheMyPartyList("");
                                                                      }).whenComplete(() => Navigator.pop(context));
                                                                    },
                          child: Container(
                            height: 60,
                            decoration: BoxDecoration(
                              color: const Color(0xff141414),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                "Add candidate to list",
                                style: veripolTextStyles.labelLarge.copyWith(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                            if (position == "PRESIDENT") {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PresidentViceCandidateProfile(
                                    data: myCandidatesController.myNationalData["president"],
                                  ),
                                ),
                              );
                            } else if (position == "VICE-PRESIDENT") {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PresidentViceCandidateProfile(
                                    data: myCandidatesController.myNationalData["vicePresident"],
                                  ),
                                ),
                              );
                            } else if (position == "SENATORS") {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SenatorsProfile(
                                    data: myCandidatesController.myNationalData["senators"],
                                  ),
                                ),
                              );
                            } else if (position == "HOUSE OF REP") {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HouseOfRepresentativesProfile(
                                    position: "House of Representative",
                                    data: myCandidatesController.myNationalData["houseRep"],
                                  ),
                                ),
                              );
                            } else if (position == "PARTY LIST") {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PartyListProfile(
                                    data: myCandidatesController.myNationalData["partyList"],
                                    description: "",
                                  ),
                                ),
                              );
                            } else if (position == "GOVERNOR") {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => GovernorViceProfile(
                                    position: "Governor",
                                    data: myCandidatesController.myNationalData["governor"],
                                  ),
                                ),
                              );
                            } else if (position == "VICE-GOVERNOR") {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => GovernorViceProfile(
                                    position: "Vice Governor",
                                    data: myCandidatesController.myNationalData["viceGovernor"],
                                  ),
                                ),
                              );
                            } else if (position == "PROVINCIAL BOARD") {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => GovernorViceProfile(
                                    position: "Governor",
                                    data: myCandidatesController.myNationalData["governor"],
                                  ),
                                ),
                              );
                            } else if (position == "MAYOR") {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MayorViceProfile(
                                      data: myCandidatesController.myNationalData["mayor"], position: "Mayor"),
                                ),
                              );
                            } else if (position == "VICE MAYOR") {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MayorViceProfile(
                                      data: myCandidatesController.myNationalData["mayor"], position: "Vice Mayor"),
                                ),
                              );
                            } else {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MayorViceProfile(
                                      data: myCandidatesController.myNationalData["mayor"], position: "viceMayor"),
                                ),
                              );
                            }
                          },
                          child: Container(
                            height: 60,
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: const Color(0xff141414),
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                "View Profile",
                                style: veripolTextStyles.labelLarge.copyWith(color: const Color(0xff141414)),
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
          );
        });
  }
}
