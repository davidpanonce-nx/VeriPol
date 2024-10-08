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

class GovernorViceProfile extends StatefulWidget {
  const GovernorViceProfile({
    super.key,
    required this.position,
    required this.data,
  });

  final String position;
  final CandidateData data;

  @override
  State<GovernorViceProfile> createState() => _GovernorViceProfileState();
}

class _GovernorViceProfileState extends State<GovernorViceProfile> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final dataController = Provider.of<DataController>(context);
    final myCandidatesController = Provider.of<MyCandidatesDataController>(context);
    return Scaffold(
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Positioned(
              top: 86,
              child: Image.asset(
                "assets/bg_pattern.png",
              ),
            ),
            DefaultTabController(
              length: 3,
              child: Container(
                width: size.width,
                height: size.height,
                padding: const EdgeInsets.only(
                  top: 48,
                ),
                child: Column(
                  children: [
                    Container(
                      width: 375,
                      height: 56,
                      padding: const EdgeInsets.only(
                        top: 12,
                        left: 16,
                        right: 16,
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
                            "Candidate",
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
                          widget.data.filedCandidacies["May 9, 2022"]["position"] == "PROVINCIAL GOVERNOR"
                              ? GestureDetector(
                                  onTap: () async {
                                    if (dataController.userData["my_candidates"]["governor"] == null ||
                                        dataController.userData["my_candidates"]["governor"] == "") {
                                      myCandidatesController.setMyGovernor(1);
                                      myCandidatesController.setMyGovernorRunTime(widget.data.id);
                                      await myCandidatesController
                                          .storeMyGovernorToDb(widget.data.id)
                                          .whenComplete(() async {
                                        await myCandidatesController.cacheMyGovernor(widget.data.id);

                                        if (dataController.userData["my_candidates"]["governor"] != "" &&
                                            dataController.userData["my_candidates"]["governor"] != null) {
                                          await myCandidatesController
                                              .readGovernor(dataController.userData["my_candidates"]["governor"]);
                                        }
                                      });
                                    } else {
                                      if (dataController.userData["my_candidates"]["governor"] == widget.data.id) {
                                        myCandidatesController.setMyGovernor(-1);
                                        myCandidatesController.setMyGovernorRunTime("");
                                        await myCandidatesController.storeMyGovernorToDb("").whenComplete(() async {
                                          await myCandidatesController.cacheMyGovernor("");
                                          myCandidatesController.setMyGovernorDataToNull();
                                        });
                                      } else {
                                        myCandidatesController.setMyGovernorRunTime(widget.data.id);
                                        await myCandidatesController
                                            .storeMyGovernorToDb(widget.data.id)
                                            .whenComplete(() async {
                                          await myCandidatesController.cacheMyGovernor(widget.data.id);
                                          await myCandidatesController
                                              .readGovernor(dataController.userData["my_candidates"]["governor"]);
                                        });
                                      }
                                    }
                                  },
                                  child: dataController.userData["my_candidates"]["governor"] == null ||
                                          dataController.userData["my_candidates"]["governor"] == ''
                                      ? Image.asset(
                                          'assets/heart_outlined.png',
                                          width: 24,
                                          height: 22,
                                        )
                                      : dataController.userData["my_candidates"]["governor"] == widget.data.id
                                          ? Image.asset(
                                              'assets/heart_filled.png',
                                              width: 24,
                                              height: 22,
                                            )
                                          : Image.asset(
                                              'assets/heart_outlined.png',
                                              width: 24,
                                              height: 22,
                                            ),
                                )
                              : GestureDetector(
                                  onTap: () async {
                                    if (dataController.userData["my_candidates"]["viceGovernor"] == null ||
                                        dataController.userData["my_candidates"]["viceGovernor"] == "") {
                                      myCandidatesController.setMyViceGovernor(1);
                                      myCandidatesController.setMyViceGovernorRunTime(widget.data.id);
                                      await myCandidatesController
                                          .storeMyViceGovernorToDb(widget.data.id)
                                          .whenComplete(() async {
                                        await myCandidatesController.cacheMyViceGovernor(widget.data.id);

                                        if (dataController.userData["my_candidates"]["viceGovernor"] != "" &&
                                            dataController.userData["my_candidates"]["viceGovernor"] != null) {
                                          await myCandidatesController.readViceGovernor(
                                              dataController.userData["my_candidates"]["viceGovernor"]);
                                        }
                                      });
                                    } else {
                                      if (dataController.userData["my_candidates"]["viceGovernor"] == widget.data.id) {
                                        myCandidatesController.setMyViceGovernor(-1);
                                        myCandidatesController.setMyViceGovernorRunTime("");
                                        await myCandidatesController.storeMyViceGovernorToDb("").whenComplete(() async {
                                          await myCandidatesController.cacheMyViceGovernor("");
                                          myCandidatesController.setMyViceGovernorDataToNull();
                                        });
                                      } else {
                                        myCandidatesController.setMyViceGovernorRunTime(widget.data.id);
                                        await myCandidatesController
                                            .storeMyViceGovernorToDb(widget.data.id)
                                            .whenComplete(() async {
                                          await myCandidatesController.cacheMyViceGovernor(widget.data.id);
                                          await myCandidatesController.readViceGovernor(
                                              dataController.userData["my_candidates"]["viceGovernor"]);
                                        });
                                      }
                                    }
                                  },
                                  child: dataController.userData["my_candidates"]["viceGovernor"] == null ||
                                          dataController.userData["my_candidates"]["viceGovernor"] == ''
                                      ? Image.asset(
                                          'assets/heart_outlined.png',
                                          width: 24,
                                          height: 22,
                                        )
                                      : dataController.userData["my_candidates"]["viceGovernor"] == widget.data.id
                                          ? Image.asset(
                                              'assets/heart_filled.png',
                                              width: 24,
                                              height: 22,
                                            )
                                          : Image.asset(
                                              'assets/heart_outlined.png',
                                              width: 24,
                                              height: 22,
                                            ),
                                ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: size.width,
                      height: size.height - 104,
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
                                  top: -30,
                                  right: -10,
                                  child: Text(
                                    "#${widget.data.filedCandidacies["May 9, 2022"]["ballot_number"]}",
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
                                      const SizedBox(height: 24),
                                      Text(
                                        "CAMPAIGNING FOR",
                                        style: veripolTextStyles.labelSmall.copyWith(
                                          color: const Color(0xffFFFFF0),
                                        ),
                                      ),
                                      Text(
                                        "${widget.position} of the Philippines",
                                        style: veripolTextStyles.titleMedium.copyWith(
                                          color: const Color(0xffFFFFF0),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        width: 105,
                                        height: 105,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          boxShadow: [
                                            BoxShadow(
                                              offset: const Offset(0, 8),
                                              blurRadius: 12,
                                              spreadRadius: 6,
                                              color: Colors.black.withOpacity(0.15),
                                            ),
                                            BoxShadow(
                                              offset: const Offset(0, 4),
                                              blurRadius: 4,
                                              spreadRadius: 0,
                                              color: Colors.black.withOpacity(0.30),
                                            ),
                                          ],
                                          image: const DecorationImage(
                                            image: AssetImage(
                                              "assets/default_profile_img.png",
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 19,
                                      ),
                                      Text(
                                        "${widget.data.filedCandidacies["May 9, 2022"]["ballot_number"]}. ${widget.data.filedCandidacies["May 9, 2022"]["ballot_name"]}",
                                        style: veripolTextStyles.titleMedium.copyWith(
                                          color: const Color(0xffFFFFF0),
                                        ),
                                      ),
                                      Text(
                                        widget.data.filedCandidacies["May 9, 2022"]["political_party"],
                                        style: veripolTextStyles.titleSmall.copyWith(
                                          color: const Color(0xffFFFFF0),
                                        ),
                                      ),
                                      const SizedBox(height: 29),
                                      SizedBox(
                                        height: 26,
                                        child: TabBar(
                                          labelPadding: EdgeInsets.zero,
                                          padding: EdgeInsets.zero,
                                          indicatorColor: veripolColors.sunYellow,
                                          indicatorSize: TabBarIndicatorSize.label,
                                          indicatorWeight: 5,
                                          isScrollable: true,
                                          unselectedLabelColor: Colors.white.withOpacity(0.50),
                                          labelColor: veripolColors.sunYellow,
                                          tabs: [
                                            Container(
                                              width: 125,
                                              padding: const EdgeInsets.only(
                                                bottom: 5,
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "Details",
                                                  style: veripolTextStyles.labelMedium,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: 125,
                                              padding: const EdgeInsets.only(
                                                bottom: 5,
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "About the area",
                                                  style: veripolTextStyles.labelMedium,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: 125,
                                              padding: const EdgeInsets.only(
                                                bottom: 5,
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "Statistics",
                                                  style: veripolTextStyles.labelMedium,
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
                            height: size.height - 395,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: TabBarView(
                                    children: [
                                      // About the Candidate

                                      ListView(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 20,
                                        ),
                                        children: [
                                          Container(
                                            width: size.width,
                                            margin: const EdgeInsets.symmetric(horizontal: 10),
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "About the Candidate",
                                                  style: veripolTextStyles.labelLarge.copyWith(
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                const SizedBox(width: 5),
                                                const Expanded(
                                                  child: Divider(
                                                    height: 20,
                                                    thickness: 1,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          widget.data.name != ""
                                              ? FullNameCard(fullName: widget.data.name)
                                              : const NoInformationAvailable(),
                                        ],
                                      ),

                                      // About the Area

                                      ListView(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 20,
                                        ),
                                        children: [
                                          Container(
                                            width: size.width,
                                            margin: const EdgeInsets.symmetric(horizontal: 10),
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "About the Area",
                                                  style: veripolTextStyles.labelLarge.copyWith(
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                const Expanded(
                                                  child: Divider(
                                                    height: 20,
                                                    thickness: 1,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          const NoInformationAvailable(),
                                        ],
                                      ),

                                      ListView(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 20,
                                        ),
                                        children: [
                                          Container(
                                            width: size.width,
                                            margin: const EdgeInsets.symmetric(horizontal: 10),
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "Graph Details",
                                                  style: veripolTextStyles.labelLarge.copyWith(
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                const Expanded(
                                                  child: Divider(
                                                    height: 20,
                                                    thickness: 1,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          const NoInformationAvailable(),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Container(
                                            width: size.width,
                                            margin: const EdgeInsets.symmetric(horizontal: 10),
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "Overall Score",
                                                  style: veripolTextStyles.labelLarge.copyWith(
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                const Expanded(
                                                  child: Divider(
                                                    height: 20,
                                                    thickness: 1,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          const NoInformationAvailable(),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 50),
                                  child: InkWell(
                                    onTap: () async {
                                      final query = widget.data.name.replaceAll(",", "").split(" ").join("+");
                                      final url = "https://www.google.com/search?q=$query";
                                      if (await canLaunch(url)) {
                                        await launch(url);
                                      }
                                    },
                                    child: Container(
                                      width: 345,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black, width: 4),
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.transparent,
                                      ),
                                      child: Center(
                                        child: SizedBox(
                                          width: 250,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Search Candidate on Google',
                                                style: veripolTextStyles.labelLarge.copyWith(
                                                  color: Colors.black,
                                                ),
                                              ),
                                              Image.asset('assets/google_logo.png')
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
          ],
        ),
      ),
    );
  }
}
