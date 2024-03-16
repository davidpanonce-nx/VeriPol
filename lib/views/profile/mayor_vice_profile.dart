import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:veripol/charts/chart_card.dart';
import 'package:veripol/charts/chart_details.dart';
import 'package:veripol/components/about_card.dart';

import 'package:veripol/models/models.dart';

import '../../components/full_name_card.dart';
import '../../components/no_information_available.dart';
import '../../components/themes.dart';
import '../../controller/chart_controller.dart';
import '../../controller/data_controller.dart';
import '../../controller/my_candidate_data_controller.dart';

class MayorViceProfile extends StatefulWidget {
  const MayorViceProfile({
    Key? key,
    required this.data,
    required this.position,
    this.id,
  }) : super(key: key);

  final CandidateData data;
  final String position;
  final String? id;

  @override
  State<MayorViceProfile> createState() => _MayorViceProfileState();
}

class _MayorViceProfileState extends State<MayorViceProfile> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final dataController = Provider.of<DataController>(context);
    final myCandidatesController = Provider.of<MyCandidatesDataController>(context);
    final chartController = Provider.of<ChartController>(context);
    return Scaffold(
      backgroundColor: veripolColors.background,
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
                              chartController.clearChartRunTime();
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
                          widget.data.filedCandidacies["May 9, 2022"]["position"] == "MAYOR"
                              ? GestureDetector(
                                  onTap: () async {
                                    if (dataController.userData["my_candidates"]["mayor"] == null ||
                                        dataController.userData["my_candidates"]["mayor"] == "") {
                                      myCandidatesController.setMyMayor(1);
                                      myCandidatesController.setMyMayorRunTime(widget.data.id);
                                      await myCandidatesController
                                          .storeMyMayorToDb(widget.data.id)
                                          .whenComplete(() async {
                                        await myCandidatesController.cacheMyMayor(widget.data.id);

                                        if (dataController.userData["my_candidates"]["mayor"] != "" &&
                                            dataController.userData["my_candidates"]["mayor"] != null) {
                                          await myCandidatesController
                                              .readMayor(dataController.userData["my_candidates"]["mayor"]);
                                        }
                                      });
                                    } else {
                                      if (dataController.userData["my_candidates"]["mayor"] == widget.data.id) {
                                        myCandidatesController.setMyMayor(-1);
                                        myCandidatesController.setMyMayorRunTime("");
                                        await myCandidatesController.storeMyMayorToDb("").whenComplete(() async {
                                          await myCandidatesController.cacheMyMayor("");
                                          myCandidatesController.setMyMayorDataToNull();
                                        });
                                      } else {
                                        myCandidatesController.setMyMayorRunTime(widget.data.id);
                                        await myCandidatesController
                                            .storeMyMayorToDb(widget.data.id)
                                            .whenComplete(() async {
                                          await myCandidatesController.cacheMyMayor(widget.data.id);
                                          await myCandidatesController
                                              .readMayor(dataController.userData["my_candidates"]["mayor"]);
                                        });
                                      }
                                    }
                                  },
                                  child: dataController.userData["my_candidates"]["mayor"] == null ||
                                          dataController.userData["my_candidates"]["mayor"] == ''
                                      ? Image.asset(
                                          'assets/heart_outlined.png',
                                          width: 24,
                                          height: 22,
                                        )
                                      : dataController.userData["my_candidates"]["mayor"] == widget.data.id
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
                                    if (dataController.userData["my_candidates"]["viceMayor"] == null ||
                                        dataController.userData["my_candidates"]["viceMayor"] == "") {
                                      myCandidatesController.setMyViceMayor(1);
                                      myCandidatesController.setMyViceMayorRunTime(widget.data.id);
                                      await myCandidatesController
                                          .storeMyViceMayorToDb(widget.data.id)
                                          .whenComplete(() async {
                                        await myCandidatesController.cacheMyViceMayor(widget.data.id);

                                        if (dataController.userData["my_candidates"]["viceMayor"] != "" &&
                                            dataController.userData["my_candidates"]["viceMayor"] != null) {
                                          await myCandidatesController
                                              .readViceMayor(dataController.userData["my_candidates"]["viceMayor"]);
                                        }
                                      });
                                    } else {
                                      if (dataController.userData["my_candidates"]["viceMayor"] == widget.data.id) {
                                        myCandidatesController.setMyViceMayor(-1);
                                        myCandidatesController.setMyViceMayorRunTime("");
                                        await myCandidatesController.storeMyViceMayorToDb("").whenComplete(() async {
                                          await myCandidatesController.cacheMyViceMayor("");
                                          myCandidatesController.setMyViceMayorDataToNull();
                                        });
                                      } else {
                                        myCandidatesController.setMyViceMayorRunTime(widget.data.id);
                                        await myCandidatesController
                                            .storeMyViceMayorToDb(widget.data.id)
                                            .whenComplete(() async {
                                          await myCandidatesController.cacheMyViceMayor(widget.data.id);

                                          await myCandidatesController
                                              .readViceMayor(dataController.userData["my_candidates"]["viceMayor"]);
                                        });
                                      }
                                    }
                                  },
                                  child: dataController.userData["my_candidates"]["viceMayor"] == null ||
                                          dataController.userData["my_candidates"]["viceMayor"] == ''
                                      ? Image.asset(
                                          'assets/heart_outlined.png',
                                          width: 24,
                                          height: 22,
                                        )
                                      : dataController.userData["my_candidates"]["viceMayor"] == widget.data.id
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
                                          image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: AssetImage(
                                              widget.data.imgURL == ""
                                                  ? "assets/default_profile_img.png"
                                                  : widget.data.imgURL,
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

                                      // Statistics

                                      widget.position == "Mayor"
                                          ? ListView(
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
                                                chartController.overAllScore.isEmpty &&
                                                        chartController.economicDynamism.isEmpty &&
                                                        chartController.governmentEfficiency.isEmpty &&
                                                        chartController.infrastructure.isEmpty &&
                                                        chartController.resilliency.isEmpty
                                                    ? const NoInformationAvailable()
                                                    : const AboutCard(
                                                        about:
                                                            "The following data was taken from Cities and Municipalities Competitive Index (CMCI).",
                                                      ),
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
                                                const SizedBox(height: 10),
                                                chartController.overAllScore.isEmpty
                                                    ? const NoInformationAvailable()
                                                    : GestureDetector(
                                                        onTap: () {
                                                          Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) => ChartDetails(
                                                                id: widget.id,
                                                                city: dataController.city,
                                                                lastName: widget.data.name.split(",").first,
                                                                pillar: "Overall Score",
                                                                pillarDescription:
                                                                    chartController.pillarDescription["Overall Score"]!,
                                                                bgImageUrl: 'assets/overall_score.png',
                                                                bgImageOffset: const Offset(
                                                                  230,
                                                                  -5,
                                                                ),
                                                                bgImageSize: const Size(
                                                                  133,
                                                                  105,
                                                                ),
                                                                data: chartController.overAllScore,
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                        child: ChartCard(
                                                          id: widget.id,
                                                          chartData: chartController.overAllScore,
                                                          pillar: "Overall Score",
                                                          lastName: widget.data.name.split(",").first,
                                                        ),
                                                      ),
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
                                                        "Economic Dynamism",
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
                                                chartController.overAllScore.isEmpty
                                                    ? const NoInformationAvailable()
                                                    : GestureDetector(
                                                        onTap: () {
                                                          Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) => ChartDetails(
                                                                id: widget.id,
                                                                city: dataController.city,
                                                                lastName: widget.data.name.split(",").first,
                                                                pillar: "Economic Dynamism",
                                                                pillarDescription: chartController
                                                                    .pillarDescription["Economic Dynamism"]!,
                                                                bgImageUrl: 'assets/economic_dynamism.png',
                                                                bgImageOffset: const Offset(
                                                                  180,
                                                                  -5,
                                                                ),
                                                                bgImageSize: const Size(
                                                                  195,
                                                                  105,
                                                                ),
                                                                data: chartController.economicDynamism,
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                        child: ChartCard(
                                                          id: widget.id,
                                                          chartData: chartController.economicDynamism,
                                                          pillar: "Economic Dynamism",
                                                          lastName: widget.data.name.split(",").first,
                                                        ),
                                                      ),
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
                                                        "Government Efficiency",
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
                                                chartController.overAllScore.isEmpty
                                                    ? const NoInformationAvailable()
                                                    : GestureDetector(
                                                        onTap: () {
                                                          Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) => ChartDetails(
                                                                  id: widget.id,
                                                                  city: dataController.city,
                                                                  lastName: widget.data.name.split(",").first,
                                                                  pillar: "Government Efficiency",
                                                                  pillarDescription: chartController
                                                                      .pillarDescription["Government Efficiency"]!,
                                                                  bgImageUrl: 'assets/government_efficiency.png',
                                                                  bgImageOffset: const Offset(
                                                                    180,
                                                                    -5,
                                                                  ),
                                                                  bgImageSize: const Size(
                                                                    208,
                                                                    105,
                                                                  ),
                                                                  data: chartController.governmentEfficiency),
                                                            ),
                                                          );
                                                        },
                                                        child: ChartCard(
                                                          id: widget.id,
                                                          chartData: chartController.governmentEfficiency,
                                                          pillar: "Government Efficiency",
                                                          lastName: widget.data.name.split(",").first,
                                                        ),
                                                      ),
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
                                                        "Infrastructure",
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
                                                chartController.overAllScore.isEmpty
                                                    ? const NoInformationAvailable()
                                                    : GestureDetector(
                                                        onTap: () {
                                                          Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) => ChartDetails(
                                                                  id: widget.id,
                                                                  city: dataController.city,
                                                                  lastName: widget.data.name.split(",").first,
                                                                  pillar: "Infrastructure",
                                                                  pillarDescription: chartController
                                                                      .pillarDescription["Infrastructure"]!,
                                                                  bgImageUrl: 'assets/infrastructure.png',
                                                                  bgImageOffset: const Offset(
                                                                    125,
                                                                    -20,
                                                                  ),
                                                                  bgImageSize: const Size(
                                                                    242,
                                                                    105,
                                                                  ),
                                                                  data: chartController.infrastructure),
                                                            ),
                                                          );
                                                        },
                                                        child: ChartCard(
                                                          id: widget.id,
                                                          chartData: chartController.infrastructure,
                                                          pillar: "Infrastructure",
                                                          lastName: widget.data.name.split(",").first,
                                                        ),
                                                      ),
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
                                                        "Resilliency",
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
                                                chartController.overAllScore.isEmpty
                                                    ? const NoInformationAvailable()
                                                    : GestureDetector(
                                                        onTap: () {
                                                          Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) => ChartDetails(
                                                                id: widget.id,
                                                                city: dataController.city,
                                                                lastName: widget.data.name.split(",").first,
                                                                pillar: "Resilliency",
                                                                pillarDescription:
                                                                    chartController.pillarDescription["Resilliency"]!,
                                                                bgImageUrl: 'assets/resilliency.png',
                                                                bgImageOffset: const Offset(
                                                                  190,
                                                                  -15,
                                                                ),
                                                                bgImageSize: const Size(
                                                                  185,
                                                                  105,
                                                                ),
                                                                data: chartController.resilliency,
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                        child: ChartCard(
                                                          id: widget.id,
                                                          chartData: chartController.resilliency,
                                                          pillar: "Resilliency",
                                                          lastName: widget.data.name.split(",").first,
                                                        ),
                                                      ),
                                              ],
                                            )
                                          : ListView(
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
                                  padding: const EdgeInsets.only(bottom: 30),
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
