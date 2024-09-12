import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:veripol/controller/my_candidate_data_controller.dart';

import '../../components/full_name_card.dart';
import '../../components/no_information_available.dart';
import '../../components/themes.dart';
import '../../controller/data_controller.dart';
import '../../models/models.dart';

class PresidentViceCandidateProfile extends StatefulWidget {
  const PresidentViceCandidateProfile({
    super.key,
    required this.data,
  });

  final CandidateData data;
  @override
  State<PresidentViceCandidateProfile> createState() => _PresidentViceCandidateProfileState();
}

class _PresidentViceCandidateProfileState extends State<PresidentViceCandidateProfile> {
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
              length: 5,
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
                          widget.data.filedCandidacies["May 9, 2022"]["position"] == "PRESIDENT"
                              ? GestureDetector(
                                  onTap: () async {
                                    if (dataController.userData["my_candidates"]["president"] == null ||
                                        dataController.userData["my_candidates"]["president"] == "") {
                                      myCandidatesController.setMyPresident(1);
                                      myCandidatesController.setMyPresidentRunTime(widget.data.id);
                                      await myCandidatesController
                                          .storeMyPresidentToDb(widget.data.id)
                                          .whenComplete(() async {
                                        await myCandidatesController
                                            .cacheMyPresident(widget.data.id)
                                            .whenComplete(() async {
                                          if (dataController.userData["my_candidates"]["president"] != "" &&
                                              dataController.userData["my_candidates"]["president"] != null) {
                                            await myCandidatesController
                                                .readPresident(dataController.userData["my_candidates"]["president"])
                                                .whenComplete(() {
                                              myCandidatesController.getMyPresident(widget.data.id);
                                            });
                                          }
                                        });
                                      });
                                    } else {
                                      if (dataController.userData["my_candidates"]["president"] == widget.data.id) {
                                        myCandidatesController.setMyPresident(-1);
                                        myCandidatesController.setMyPresidentRunTime("");
                                        await myCandidatesController.storeMyPresidentToDb("").whenComplete(() async {
                                          await myCandidatesController.cacheMyPresident("");

                                          myCandidatesController.setMyPresidentDataToNull();
                                        });
                                      } else {
                                        myCandidatesController.setMyPresidentRunTime(widget.data.id);
                                        await myCandidatesController
                                            .storeMyPresidentToDb(widget.data.id)
                                            .whenComplete(() async {
                                          await myCandidatesController.cacheMyPresident(widget.data.id);
                                        });
                                        await myCandidatesController
                                            .readPresident(dataController.userData["my_candidates"]["president"])
                                            .whenComplete(() {
                                          myCandidatesController.getMyPresident(widget.data.id);
                                        });
                                      }
                                    }
                                  },
                                  child: dataController.userData["my_candidates"]["president"] == null ||
                                          dataController.userData["my_candidates"]["president"] == ''
                                      ? Image.asset(
                                          'assets/heart_outlined.png',
                                          width: 24,
                                          height: 22,
                                        )
                                      : dataController.userData["my_candidates"]["president"] == widget.data.id
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
                                    if (dataController.userData["my_candidates"]["vicePresident"] == null ||
                                        dataController.userData["my_candidates"]["vicePresident"] == "") {
                                      myCandidatesController.setMyVicePresident(1);
                                      myCandidatesController.setMyVicePresidentRunTime(widget.data.id);
                                      await myCandidatesController
                                          .storeMyVicePresidentToDb(widget.data.id)
                                          .whenComplete(() async {
                                        await myCandidatesController.cacheMyVicePresident(widget.data.id);
                                        if (dataController.userData["my_candidates"]["vicePresident"] != "" &&
                                            dataController.userData["my_candidates"]["vicePresident"] != null) {
                                          await myCandidatesController.readVicePresident(
                                              dataController.userData["my_candidates"]["vicePresident"]);
                                        }
                                      });
                                    } else {
                                      if (dataController.userData["my_candidates"]["vicePresident"] == widget.data.id) {
                                        myCandidatesController.setMyVicePresident(-1);
                                        myCandidatesController.setMyVicePresidentRunTime("");
                                        await myCandidatesController
                                            .storeMyVicePresidentToDb("")
                                            .whenComplete(() async {
                                          await myCandidatesController.cacheMyVicePresident("");
                                          myCandidatesController.setMyVicePresidentDataToNull();
                                        });
                                      } else {
                                        myCandidatesController.setMyVicePresidentRunTime(widget.data.id);
                                        await myCandidatesController
                                            .storeMyVicePresidentToDb(widget.data.id)
                                            .whenComplete(() async {
                                          await myCandidatesController.cacheMyVicePresident(widget.data.id);
                                          await myCandidatesController.readVicePresident(
                                              dataController.userData["my_candidates"]["vicePresident"]);
                                        });
                                      }
                                    }
                                  },
                                  child: dataController.userData["my_candidates"]["vicePresident"] == null ||
                                          dataController.userData["my_candidates"]["vicePresident"] == ''
                                      ? Image.asset(
                                          'assets/heart_outlined.png',
                                          width: 24,
                                          height: 22,
                                        )
                                      : dataController.userData["my_candidates"]["vicePresident"] == widget.data.id
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
                                        widget.data.filedCandidacies["May 9, 2022"]["position"] == "PRESIDENT"
                                            ? "President of the Philippines"
                                            : "Vice President of the Philippines",
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
                                        textAlign: TextAlign.center,
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
                                                  "Overview",
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
                                                  "Platforms",
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
                                                  "Accomplishments",
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
                                                  "Advocacies",
                                                  style: veripolTextStyles.labelMedium,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: 153,
                                              padding: const EdgeInsets.only(
                                                bottom: 5,
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "Relevant Exeperiences",
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
                                      //  ABOUT THE CANDIDATE
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
                                                  "About the the Candidate",
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

                                      //  PLATFORMS

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
                                                  "Platforms",
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

                                      // ACCOMPLISHMENTS

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
                                                  "Overview",
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
                                                  "Major Accomplishments",
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

                                      // Advocacies

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
                                                  "Major Advocacies",
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

                                      // Relevant Experiences

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
                                                  "Relevant Experiences",
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
                                  padding: const EdgeInsets.only(bottom: 15),
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
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 30),
                                  child: InkWell(
                                    onTap: () async {
                                      final url = widget.data.profileURL;
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
                                        color: const Color(0xFF141414),
                                      ),
                                      child: Center(
                                        child: SizedBox(
                                          width: 280,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'View Candidate Dashboard on',
                                                style: veripolTextStyles.labelLarge.copyWith(
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Image.asset('assets/votepilipinas_logo.png')
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
