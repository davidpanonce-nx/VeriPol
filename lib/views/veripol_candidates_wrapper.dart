import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:veripol/views/registration%20location/registered_voter.dart';
import 'package:veripol/views/splash/splash.dart';

import '../controller/data_controller.dart';
import '../controller/my_candidate_data_controller.dart';
import 'candidates/candidates_type.dart';
import 'candidates/my_candidates.dart';

class VeripolCandidatesWrapper extends StatefulWidget {
  const VeripolCandidatesWrapper({super.key});

  @override
  State<VeripolCandidatesWrapper> createState() => _VeripolCandidatesWrapperState();
}

class _VeripolCandidatesWrapperState extends State<VeripolCandidatesWrapper> {
  Future<void> buildNationalData() async {
    MyCandidatesDataController mycandidateController = MyCandidatesDataController();
    DataController dataController = DataController();
    if (dataController.userData["my_candidates"]["president"] != "" &&
        dataController.userData["my_candidates"]["president"] != null) {
      await mycandidateController.initReadPresident(dataController.userData["my_candidates"]["president"]);
      mycandidateController.initMyPresident(1);
    } else {
      mycandidateController.initMyPresident(0);
    }

    if (dataController.userData["my_candidates"]["vicePresident"] != "" &&
        dataController.userData["my_candidates"]["vicePresident"] != null) {
      await mycandidateController.initReadVicePresident(dataController.userData["my_candidates"]["vicePresident"]);
      mycandidateController.initMyVicePresident(1);
    } else {
      mycandidateController.initMyVicePresident(0);
    }

    if (dataController.userData["my_candidates"]["houseRep"] != "" &&
        dataController.userData["my_candidates"]["houseRep"] != null) {
      await mycandidateController.initReadHouseOfReps(dataController.userData["my_candidates"]["houseRep"]);
      mycandidateController.initMyHouseReps(1);
    } else {
      mycandidateController.initMyHouseReps(0);
    }

    if (List<String>.from(dataController.userData["my_candidates"]["senators"]).isNotEmpty &&
        dataController.userData["my_candidates"]["senators"] != null) {
      await mycandidateController.initReadSenators(dataController.userData["my_candidates"]["senators"],
          dataController.userData["my_candidates"]["senatorIndices"]);

      mycandidateController
          .initMySenators(List<String>.from(dataController.userData["my_candidates"]["senators"]).length);

      mycandidateController.initMySenatorIndices(dataController.userData["my_candidates"]["senatorIndices"]);

      mycandidateController.initMySenatorList(dataController.userData["my_candidates"]["senators"] ?? []);
    } else {
      mycandidateController.initMySenators(0);
    }

    if (dataController.userData["my_candidates"]["partyList"] != "" &&
        dataController.userData["my_candidates"]["partyList"] != null) {
      await mycandidateController.initReadPartyList(dataController.userData["my_candidates"]["partyList"]);
      mycandidateController.initMyPartyList(1);
    } else {
      mycandidateController.initMyPartyList(0);
    }

    if (dataController.userData["my_candidates"]["governor"] != "" &&
        dataController.userData["my_candidates"]["governor"] != null) {
      await mycandidateController.initReadGovernor(dataController.userData["my_candidates"]["governor"]);
      mycandidateController.initMyGovernor(1);
    } else {
      mycandidateController.initMyGovernor(0);
    }

    if (dataController.userData["my_candidates"]["viceGovernor"] != "" &&
        dataController.userData["my_candidates"]["viceGovernor"] != null) {
      await mycandidateController.initReadViceGovernor(dataController.userData["my_candidates"]["viceGovernor"]);
      mycandidateController.initMyViceGovernor(1);
    } else {
      mycandidateController.initMyViceGovernor(0);
    }

    if (List<String>.from(dataController.userData["my_candidates"]["provincialBoard"]).isNotEmpty &&
        dataController.userData["my_candidates"]["provincialBoard"] != null) {
      await mycandidateController.initReadProvincialBoard(dataController.userData["my_candidates"]["provincialBoard"],
          dataController.userData["my_candidates"]["provincialBoardIndices"]);

      mycandidateController.initMyProvincialBoards(
          List<String>.from(dataController.userData["my_candidates"]["provincialBoard"]).length);

      mycandidateController
          .initMyProvincialBoardIndices(dataController.userData["my_candidates"]["provincialBoardIndices"]);

      mycandidateController
          .initMyProvincialBoardList(dataController.userData["my_candidates"]["provincialBoard"] ?? []);
    } else {
      mycandidateController.initMyProvincialBoards(0);
    }

    if (dataController.userData["my_candidates"]["mayor"] != "" &&
        dataController.userData["my_candidates"]["mayor"] != null) {
      await mycandidateController.initReadMayor(dataController.userData["my_candidates"]["mayor"]);
      mycandidateController.initMyMayor(1);
    } else {
      mycandidateController.initMyMayor(0);
    }

    if (dataController.userData["my_candidates"]["viceMayor"] != "" &&
        dataController.userData["my_candidates"]["viceMayor"] != null) {
      await mycandidateController.initReadViceMayor(dataController.userData["my_candidates"]["viceMayor"]);
      mycandidateController.initMyViceMayor(1);
    } else {
      mycandidateController.initMyViceMayor(0);
    }

    if (List<String>.from(dataController.userData["my_candidates"]["cityCouncilors"]).isNotEmpty &&
        dataController.userData["my_candidates"]["cityCouncilors"] != null) {
      await mycandidateController.initReadCouncilors(dataController.userData["my_candidates"]["cityCouncilors"],
          dataController.userData["my_candidates"]["cityCouncilorIndices"]);

      mycandidateController
          .initMyCouncilors(List<String>.from(dataController.userData["my_candidates"]["cityCouncilors"]).length);

      mycandidateController.initMyCouncilorsIndices(dataController.userData["my_candidates"]["cityCouncilorIndices"]);

      mycandidateController.initMyCouncilorsList(dataController.userData["my_candidates"]["cityCouncilors"] ?? []);
    } else {
      mycandidateController.initMyCouncilors(0);
    }
  }

  @override
  Widget build(BuildContext context) {
    final dataController = Provider.of<DataController>(context);
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: size.height,
      child: Stack(
        children: [
          SizedBox(
            width: size.width,
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(color: Colors.black),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color(0xffCB3B39),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            child: Image.asset("assets/bg_pattern.png"),
          ),
          InkWell(
            onTap: () async {
              await dataController.getLocationData()
                  ? Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CandidateTypeSelection(),
                      ),
                    )
                  : Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegisteredVoterSelection(),
                      ),
                    );
            },
            child: SizedBox(
              width: size.width,
              height: size.height / 2,
              child: Center(
                child: Text(
                  "Candidates of 2022",
                  style: GoogleFonts.notoSans(
                    textStyle: const TextStyle(
                      fontStyle: FontStyle.normal,
                      fontSize: 20.26,
                      fontWeight: FontWeight.w700,
                      height: 1.27,
                      letterSpacing: 0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: InkWell(
              onTap: () async {
                !await dataController.getLocationData()
                    ? Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegisteredVoterSelection(),
                        ),
                      )
                    : {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const VeripolSplash(),
                          ),
                        ),
                        Future.delayed(const Duration(seconds: 1), () {}).whenComplete(() async {
                          await buildNationalData().whenComplete(() {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const MyCandidatesScreen(),
                              ),
                            );
                          });
                        })
                      };
              },
              child: SizedBox(
                width: size.width,
                height: size.height / 2,
                child: Center(
                  child: Text(
                    "My Candidates",
                    style: GoogleFonts.notoSans(
                      textStyle: const TextStyle(
                        fontStyle: FontStyle.normal,
                        fontSize: 20.26,
                        fontWeight: FontWeight.w700,
                        height: 1.27,
                        letterSpacing: 0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
