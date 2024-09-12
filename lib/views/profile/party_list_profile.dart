import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:veripol/components/no_information_available.dart';

import '../../components/full_name_card.dart';
import '../../components/themes.dart';
import '../../controller/data_controller.dart';
import '../../controller/my_candidate_data_controller.dart';
import '../../models/models.dart';

class PartyListProfile extends StatefulWidget {
  const PartyListProfile({
    super.key,
    required this.data,
    required this.description,
  });

  final CandidateData data;
  final String description;
  @override
  State<PartyListProfile> createState() => _PartyListProfileState();
}

class _PartyListProfileState extends State<PartyListProfile> {
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
            Container(
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
                        GestureDetector(
                          onTap: () async {
                            if (dataController.userData["my_candidates"]["partyList"] == null ||
                                dataController.userData["my_candidates"]["partyList"] == "") {
                              myCandidatesController.setMyPartyList(1);
                              myCandidatesController.setMyPartyListRunTime(widget.data.id);
                              await myCandidatesController.storeMyPartyListToDb(widget.data.id).whenComplete(() async {
                                await myCandidatesController.cacheMyPartyList(widget.data.id);

                                if (dataController.userData["my_candidates"]["partyList"] != "" &&
                                    dataController.userData["my_candidates"]["partyList"] != null) {
                                  await myCandidatesController
                                      .readPartyList(dataController.userData["my_candidates"]["partyList"]);
                                }
                              });
                            } else {
                              if (dataController.userData["my_candidates"]["partyList"] == widget.data.id) {
                                myCandidatesController.setMyPartyList(-1);
                                myCandidatesController.setMyPartyListRunTime("");
                                await myCandidatesController.storeMyPartyListToDb("").whenComplete(() async {
                                  await myCandidatesController.cacheMyPartyList("");
                                  myCandidatesController.setMyPartyListDataToNull();
                                });
                              } else {
                                myCandidatesController.setMyPartyListRunTime(widget.data.id);
                                await myCandidatesController
                                    .storeMyPartyListToDb(widget.data.id)
                                    .whenComplete(() async {
                                  await myCandidatesController.cacheMyPartyList(widget.data.id);
                                  await myCandidatesController
                                      .readPartyList(dataController.userData["my_candidates"]["partyList"]);
                                });
                              }
                            }
                          },
                          child: dataController.userData["my_candidates"]["partyList"] == null ||
                                  dataController.userData["my_candidates"]["partyList"] == ''
                              ? Image.asset(
                                  'assets/heart_outlined.png',
                                  width: 24,
                                  height: 22,
                                )
                              : dataController.userData["my_candidates"]["partyList"] == widget.data.id
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
                                    const SizedBox(height: 32),
                                    Text(
                                      "PARTY LIST",
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
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 20),
                                      child: Text(
                                        widget.data.filedCandidacies["May 9, 2022"]["political_party"],
                                        textAlign: TextAlign.center,
                                        style: veripolTextStyles.titleSmall.copyWith(
                                          color: const Color(0xffFFFFF0),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 29,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: size.width,
                          height: size.height - 360,
                          padding: const EdgeInsets.symmetric(
                            vertical: 20,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: size.width,
                                      margin: const EdgeInsets.symmetric(horizontal: 10),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            "About the Party-List",
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
                                    widget.data.filedCandidacies["May 9, 2022"]["political_party"] != ""
                                        ? FullNameCard(
                                            fullName: widget.data.filedCandidacies["May 9, 2022"]["political_party"])
                                        : const NoInformationAvailable(),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    widget.description != ""
                                        ? Container(
                                            width: 345,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(
                                                8,
                                              ),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black.withOpacity(0.30),
                                                  spreadRadius: 0,
                                                  blurRadius: 2,
                                                  offset: const Offset(0, 1),
                                                ),
                                                BoxShadow(
                                                  color: Colors.black.withOpacity(0.15),
                                                  spreadRadius: 1,
                                                  blurRadius: 3,
                                                  offset: const Offset(
                                                    0,
                                                    1,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 20,
                                              vertical: 20,
                                            ),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  widget.data.name,
                                                  style: veripolTextStyles.titleSmall.copyWith(
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  "Description",
                                                  style: veripolTextStyles.bodySmall.copyWith(
                                                    color: const Color(0xff575E71),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  widget.description,
                                                  style: veripolTextStyles.bodyMedium.copyWith(
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
                              Padding(
                                padding: const EdgeInsets.only(bottom: 50),
                                child: InkWell(
                                  onTap: () async {
                                    final query = widget.data.filedCandidacies["May 9, 2022"]["political_party"]
                                        .replaceAll(",", "")
                                        .split(" ")
                                        .join("+");
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
          ],
        ),
      ),
    );
  }
}
