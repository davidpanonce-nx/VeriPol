import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:veripol/models/models.dart';

import '../../components/full_name_card.dart';
import '../../components/no_information_available.dart';
import '../../components/themes.dart';
import '../../controller/data_controller.dart';
import '../../controller/my_candidate_data_controller.dart';

class ProvincialBoardCouncilorsProfile extends StatefulWidget {
  const ProvincialBoardCouncilorsProfile({
    Key? key,
    required this.position,
    required this.data,
    this.index,
  }) : super(key: key);

  final String position;
  final CandidateData data;
  final int? index;
  @override
  State<ProvincialBoardCouncilorsProfile> createState() => _ProvincialBoardCouncilorsProfileState();
}

class _ProvincialBoardCouncilorsProfileState extends State<ProvincialBoardCouncilorsProfile> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final dataController = Provider.of<DataController>(context);
    final myCandidatesController = Provider.of<MyCandidatesDataController>(context);
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
              length: 2,
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
                          widget.position == "Provincial Board"
                              ? GestureDetector(
                                  onTap: () async {
                                    if (List<String>.from(dataController.userData["my_candidates"]["provincialBoard"])
                                        .isEmpty) {
                                      if (widget.index != null) {
                                        myCandidatesController.setMyProvincialBoardIndices(widget.index!);
                                      }
                                      myCandidatesController.setMyProvincialBoardList(widget.data.id);
                                      myCandidatesController.setMyProvincialBoardRunTime(
                                          myCandidatesController.myProvincialBoardList,
                                          myCandidatesController.myProvincialBoardIndices);
                                      await myCandidatesController.storeMyProvincialBoardToDb();
                                      await myCandidatesController.cacheMyProvincivalBoardList();
                                      await myCandidatesController
                                          .readProvincialBoard(
                                            dataController.userData["my_candidates"]["provincialBoard"],
                                            dataController.userData["my_candidates"]["provincialBoardIndices"],
                                          )
                                          .whenComplete(
                                              () => myCandidatesController.buildProvincialBoardWidgets(context, size));
                                    } else {
                                      if (List<String>.from(dataController.userData["my_candidates"]["provincialBoard"])
                                          .contains(widget.data.id)) {
                                        if (widget.index != null) {
                                          if (myCandidatesController.myProvincialBoardIndices.contains(widget.index)) {
                                            myCandidatesController.removeMyProvincialBoardIndex(widget.index!);
                                          } else {
                                            Map<String, dynamic> temp = {};
                                            temp.addAll(
                                              Map<String, dynamic>.from(
                                                  myCandidatesController.myNationalData["provincialBoard"]),
                                            );
                                            String tempIndex = "";
                                            tempIndex = temp.keys.firstWhere(
                                              (element) => temp[element].id == widget.data.id,
                                            );
                                            myCandidatesController.removeMyProvincialBoardIndex(int.parse(tempIndex));
                                          }
                                        }
                                        myCandidatesController.removeProvincialBoard(widget.data.id);

                                        myCandidatesController.setMyProvincialBoardRunTime(
                                            myCandidatesController.myProvincialBoardList,
                                            myCandidatesController.myProvincialBoardIndices);
                                        await myCandidatesController.storeMyProvincialBoardToDb();
                                        await myCandidatesController.cacheMyProvincivalBoardList();

                                        await myCandidatesController
                                            .readProvincialBoard(
                                              dataController.userData["my_candidates"]["provincialBoard"],
                                              dataController.userData["my_candidates"]["provincialBoardIndices"],
                                            )
                                            .whenComplete(() =>
                                                myCandidatesController.buildProvincialBoardWidgets(context, size));
                                      } else {
                                        if (widget.index != null) {
                                          if (myCandidatesController.myProvincialBoardIndices.contains(widget.index)) {
                                            Map<String, dynamic> temp = {};
                                            temp.addAll(
                                              Map<String, dynamic>.from(
                                                  myCandidatesController.myNationalData["provincialBoard"]),
                                            );
                                            String tempId = "";
                                            tempId = temp[widget.index.toString()].id;

                                            myCandidatesController.removeProvincialBoard(tempId);
                                          } else {
                                            myCandidatesController.setMyProvincialBoardIndices(widget.index!);
                                          }
                                        }
                                        myCandidatesController.setMyProvincialBoardList(widget.data.id);
                                        myCandidatesController.setMyProvincialBoardRunTime(
                                            myCandidatesController.myProvincialBoardList,
                                            myCandidatesController.myProvincialBoardIndices);
                                        await myCandidatesController.storeMyProvincialBoardToDb();
                                        await myCandidatesController.cacheMyProvincivalBoardList();

                                        await myCandidatesController
                                            .readProvincialBoard(
                                              dataController.userData["my_candidates"]["provincialBoard"],
                                              dataController.userData["my_candidates"]["provincialBoardIndices"],
                                            )
                                            .whenComplete(() =>
                                                myCandidatesController.buildProvincialBoardWidgets(context, size));
                                      }
                                    }
                                  },
                                  child: List<String>.from(dataController.userData["my_candidates"]["provincialBoard"])
                                          .isEmpty
                                      ? Image.asset(
                                          'assets/heart_outlined.png',
                                          width: 24,
                                          height: 22,
                                        )
                                      : List<String>.from(myCandidatesController.myProvincialBoardList)
                                              .contains(widget.data.id)
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
                                    if (List<String>.from(dataController.userData["my_candidates"]["cityCouncilors"])
                                        .isEmpty) {
                                      if (widget.index != null) {
                                        myCandidatesController.setMyCouncilorIndices(widget.index!);
                                      }
                                      myCandidatesController.setMyCouncilorsList(widget.data.id);
                                      myCandidatesController.setMyCouncilorRunTime(
                                          myCandidatesController.myCouncilorList,
                                          myCandidatesController.myCouncilorIndices);
                                      await myCandidatesController.storeMyCouncilorsToDb();
                                      await myCandidatesController.cacheMyCouncilorsList();
                                      await myCandidatesController
                                          .readMyCouncilors(
                                            dataController.userData["my_candidates"]["cityCouncilors"],
                                            dataController.userData["my_candidates"]["cityCouncilorIndices"],
                                          )
                                          .whenComplete(
                                              () => myCandidatesController.buildCouncilorWidgets(context, size));
                                    } else {
                                      if (List<String>.from(dataController.userData["my_candidates"]["cityCouncilors"])
                                          .contains(widget.data.id)) {
                                        if (widget.index != null) {
                                          if (myCandidatesController.myCouncilorIndices.contains(widget.index)) {
                                            myCandidatesController.removeMyCouncilorIndex(widget.index!);
                                          } else {
                                            Map<String, dynamic> temp = {};
                                            temp.addAll(
                                              Map<String, dynamic>.from(
                                                  myCandidatesController.myNationalData["councilors"]),
                                            );
                                            String tempIndex = "";
                                            tempIndex = temp.keys.firstWhere(
                                              (element) => temp[element].id == widget.data.id,
                                            );
                                            myCandidatesController.removeMyCouncilorIndex(int.parse(tempIndex));
                                          }
                                        }
                                        myCandidatesController.removeCouncilor(widget.data.id);

                                        myCandidatesController.setMyCouncilorRunTime(
                                            myCandidatesController.myCouncilorList,
                                            myCandidatesController.myCouncilorIndices);
                                        await myCandidatesController.storeMyCouncilorsToDb();
                                        await myCandidatesController.cacheMyCouncilorsList();

                                        await myCandidatesController
                                            .readMyCouncilors(
                                              dataController.userData["my_candidates"]["cityCouncilors"],
                                              dataController.userData["my_candidates"]["cityCouncilorIndices"],
                                            )
                                            .whenComplete(
                                                () => myCandidatesController.buildCouncilorWidgets(context, size));
                                      } else {
                                        if (widget.index != null) {
                                          if (myCandidatesController.myCouncilorIndices.contains(widget.index)) {
                                            Map<String, dynamic> temp = {};
                                            temp.addAll(
                                              Map<String, dynamic>.from(
                                                  myCandidatesController.myNationalData["councilors"]),
                                            );
                                            String tempId = "";
                                            tempId = temp[widget.index.toString()].id;

                                            myCandidatesController.removeCouncilor(tempId);
                                          } else {
                                            myCandidatesController.setMyCouncilorIndices(widget.index!);
                                          }
                                        }
                                        myCandidatesController.setMyCouncilorsList(widget.data.id);
                                        myCandidatesController.setMyCouncilorRunTime(
                                            myCandidatesController.myCouncilorList,
                                            myCandidatesController.myCouncilorIndices);
                                        await myCandidatesController.storeMyCouncilorsToDb();
                                        await myCandidatesController.cacheMyCouncilorsList();

                                        await myCandidatesController
                                            .readMyCouncilors(
                                              dataController.userData["my_candidates"]["cityCouncilors"],
                                              dataController.userData["my_candidates"]["cityCouncilorIndices"],
                                            )
                                            .whenComplete(
                                                () => myCandidatesController.buildCouncilorWidgets(context, size));
                                      }
                                    }
                                  },
                                  child: List<String>.from(dataController.userData["my_candidates"]["cityCouncilors"])
                                          .isEmpty
                                      ? Image.asset(
                                          'assets/heart_outlined.png',
                                          width: 24,
                                          height: 22,
                                        )
                                      : List<String>.from(myCandidatesController.myCouncilorList)
                                              .contains(widget.data.id)
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
                                              width: 187.5,
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
                                              width: 187.5,
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
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 50),
                                  child: InkWell(
                                    onTap: () async {
                                      final query = widget.data.name.replaceAll(",", "").split(" ").join("+");
                                      final url = Uri.parse("https://www.google.com/search?q=$query");
                                      if (await canLaunchUrl(url)) {
                                        await launchUrl(url);
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
