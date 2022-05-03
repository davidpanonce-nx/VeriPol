import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:veripol/components/dialog_boxes.dart';
import 'package:veripol/components/my_candidate_add_button.dart';
import 'package:veripol/components/my_candidate_selected_card.dart';
import 'package:veripol/controller/my_candidate_data_controller.dart';
import 'package:veripol/views/candidates/add_candidate.dart';

import '../controller/candidate_data_controller.dart';
import '../controller/data_controller.dart';
import '../controller/pagination_controllers.dart';
import '../views/splash.dart';
import 'themes.dart';

class MyCandidatesNationalTab extends StatefulWidget {
  const MyCandidatesNationalTab({
    Key? key,
    required this.textScale,
    required this.screenSize,
  }) : super(key: key);

  final double textScale;
  final Size screenSize;
  @override
  State<MyCandidatesNationalTab> createState() =>
      _MyCandidatesNationalTabState();
}

class _MyCandidatesNationalTabState extends State<MyCandidatesNationalTab> {
  List<Widget> senatorWidgets = [];

  @override
  void initState() {
    MyCandidatesDataController myCandidatesDataController =
        MyCandidatesDataController();
    myCandidatesDataController.initBuildSenatorWidgets(
        context, widget.screenSize, widget.textScale);

    myCandidatesDataController.initBuildCouncilorWidgets(
        context, widget.screenSize, widget.textScale);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final myCandidatesController =
        Provider.of<MyCandidatesDataController>(context);
    final textScale = size.width / mockUpWidth;
    final dataController = Provider.of<DataController>(context);
    final candidateDataController =
        Provider.of<CandidateDataController>(context);
    final paginationController = Provider.of<PaginationController>(context);

    return ListView(
      padding: EdgeInsets.symmetric(
        vertical: 20 / mockUpHeight * size.height,
        horizontal: 10 / mockUpWidth * size.width,
      ),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "President",
                  textScaleFactor: textScale,
                  style: veripolTextStyles.labelLarge.copyWith(
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 10 / mockUpHeight * size.height,
                ),
                myCandidatesController.myNationalData["president"] != null
                    ? InkWell(
                        onTap: () async {
                          DialogBoxes().removeOrViewDialog(
                              context, size, textScale, "PRESIDENT", "", 0);
                        },
                        child: MyCandidateSelectedCandidate(
                          data: myCandidatesController
                              .myNationalData["president"],
                        ),
                      )
                    : InkWell(
                        onTap: () async {
                          paginationController.clearFields();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const VeripolSplash(),
                            ),
                          );
                          await candidateDataController
                              .readPresident()
                              .whenComplete(() {
                            Future.delayed(const Duration(seconds: 1), () {})
                                .whenComplete(
                              () => Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AddCandidate(
                                    screenSize: widget.screenSize,
                                    textScale: widget.textScale,
                                    position: "President",
                                    posCardColor: veripolColors.blueTrust,
                                    posBgImageURL:
                                        "assets/president_text_bg.png",
                                    bgImageOffset: Offset(
                                      70 / mockUpWidth * size.width,
                                      -10 / mockUpHeight * size.height,
                                    ),
                                    posBgImageSize: const Size(355, 128),
                                    candidates:
                                        candidateDataController.candidates,
                                  ),
                                ),
                              ),
                            );
                          });
                        },
                        child: const MyCandidateAddButton(),
                      ),
              ],
            ),
            SizedBox(
              width: 15 / mockUpWidth * size.width,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Vice President",
                  textScaleFactor: textScale,
                  style: veripolTextStyles.labelLarge.copyWith(
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 10 / mockUpHeight * size.height,
                ),
                myCandidatesController.myNationalData["vicePresident"] != null
                    ? InkWell(
                        onTap: () {
                          DialogBoxes().removeOrViewDialog(context, size,
                              textScale, "VICE-PRESIDENT", "", 0);
                        },
                        child: MyCandidateSelectedCandidate(
                          data: myCandidatesController
                              .myNationalData["vicePresident"],
                        ),
                      )
                    : InkWell(
                        onTap: () async {
                          paginationController.clearFields();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const VeripolSplash(),
                            ),
                          );
                          await candidateDataController
                              .readVicePresident()
                              .whenComplete(() {
                            Future.delayed(const Duration(seconds: 1), () {})
                                .whenComplete(
                              () => Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AddCandidate(
                                    screenSize: widget.screenSize,
                                    textScale: widget.textScale,
                                    position: "Vice President",
                                    posCardColor: veripolColors.darkRedPassion,
                                    posBgImageURL:
                                        "assets/vice_president_text_bg.png",
                                    bgImageOffset: Offset(
                                      70 / mockUpWidth * size.width,
                                      -10 / mockUpHeight * size.height,
                                    ),
                                    posBgImageSize: const Size(368, 75),
                                    candidates:
                                        candidateDataController.candidates,
                                  ),
                                ),
                              ),
                            );
                          });
                        },
                        child: const MyCandidateAddButton(),
                      ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 20 / mockUpHeight * size.height,
        ),
        SizedBox(
          width: size.width,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Senators",
                textScaleFactor: textScale,
                style: veripolTextStyles.labelLarge.copyWith(
                  color: Colors.black,
                ),
              ),
              SizedBox(
                width: 5 / mockUpWidth * size.width,
              ),
              Expanded(
                child: Divider(
                  height: 20 / mockUpHeight * size.height,
                  thickness: 1 / mockUpHeight * size.height,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10 / mockUpHeight * size.height,
        ),
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 15 / mockUpWidth * size.width,
          runSpacing: 10 / mockUpHeight * size.height,
          children: myCandidatesController.senatorWidgets,
        ),
        SizedBox(
          height: 20 / mockUpHeight * size.height,
        ),
        // myCandidatesController.houseOfRep == 1 ?

        Column(
          children: [
            SizedBox(
              width: size.width,
              child: Divider(
                height: 20 / mockUpHeight * size.height,
                thickness: 1 / mockUpHeight * size.height,
                color: Colors.black,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "House of\nRepresentatives",
                      textAlign: TextAlign.center,
                      textScaleFactor: textScale,
                      style: veripolTextStyles.labelLarge.copyWith(
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 10 / mockUpHeight * size.height,
                    ),
                    myCandidatesController.myNationalData["houseRep"] != null
                        ? InkWell(
                            onTap: () {
                              DialogBoxes().removeOrViewDialog(
                                myCandidatesController
                                    .scaffoldKey.currentContext!,
                                size,
                                textScale,
                                "HOUSE OF REP",
                                "",
                                0,
                              );
                            },
                            child: MyCandidateSelectedCandidate(
                              data: myCandidatesController
                                  .myNationalData["houseRep"],
                            ),
                          )
                        : InkWell(
                            onTap: () async {
                              paginationController.clearFields();
                              Navigator.push(
                                myCandidatesController
                                    .scaffoldKey.currentContext!,
                                MaterialPageRoute(
                                  builder: (context) => const VeripolSplash(),
                                ),
                              );
                              await candidateDataController
                                  .readHouseOfReps(
                                dataController.region,
                                dataController.province,
                              )
                                  .whenComplete(() {
                                Future.delayed(
                                        const Duration(seconds: 1), () {})
                                    .whenComplete(
                                  () => Navigator.pushReplacement(
                                    myCandidatesController
                                        .scaffoldKey.currentContext!,
                                    MaterialPageRoute(
                                      builder: (context) => AddCandidate(
                                        screenSize: widget.screenSize,
                                        textScale: widget.textScale,
                                        position: "House of Representatives",
                                        posCardColor: veripolColors.blueTrust,
                                        posBgImageURL:
                                            "assets/house_of_reps_text_bg_1.png",
                                        bgImageOffset: Offset(
                                          70 /
                                              mockUpWidth *
                                              widget.screenSize.width,
                                          -10 /
                                              mockUpHeight *
                                              widget.screenSize.height,
                                        ),
                                        posBgImageSize: const Size(302, 41),
                                        candidates:
                                            candidateDataController.candidates,
                                      ),
                                    ),
                                  ),
                                );
                              });
                            },
                            child: const MyCandidateAddButton(),
                          ),
                  ],
                ),
                SizedBox(
                  width: 15 / mockUpWidth * size.width,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Party List",
                      textScaleFactor: textScale,
                      style: veripolTextStyles.labelLarge.copyWith(
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 20 / mockUpHeight * size.height,
                    ),
                    myCandidatesController.myNationalData["partyList"] != null
                        ? InkWell(
                            onTap: () {
                              DialogBoxes().removeOrViewDialog(context, size,
                                  textScale, "PARTY LIST", "", 0);
                            },
                            child: MyCandidateSelectedCandidate(
                              data: myCandidatesController
                                  .myNationalData["partyList"],
                            ),
                          )
                        : InkWell(
                            onTap: () async {
                              paginationController.clearFields();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const VeripolSplash(),
                                ),
                              );
                              await candidateDataController
                                  .readPartyList()
                                  .whenComplete(() {
                                Future.delayed(
                                        const Duration(seconds: 1), () {})
                                    .whenComplete(
                                  () => Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => AddCandidate(
                                        screenSize: widget.screenSize,
                                        textScale: widget.textScale,
                                        position: "Party List",
                                        posCardColor: veripolColors.passionRed,
                                        posBgImageURL:
                                            "assets/party_list_text_bg_1.png",
                                        bgImageOffset: Offset(
                                          70 /
                                              mockUpWidth *
                                              widget.screenSize.width,
                                          -10 /
                                              mockUpHeight *
                                              widget.screenSize.height,
                                        ),
                                        posBgImageSize: const Size(286, 94),
                                        candidates:
                                            candidateDataController.candidates,
                                      ),
                                    ),
                                  ),
                                );
                              });
                            },
                            child: const MyCandidateAddButton(),
                          ),
                  ],
                ),
              ],
            ),
          ],
        ),
        // : Column(
        //     children: [
        //       SizedBox(
        //         width: size.width,
        //         child: Row(
        //           crossAxisAlignment: CrossAxisAlignment.center,
        //           children: [
        //             Text(
        //               "House Of Representatives",
        //               textScaleFactor: textScale,
        //               style: veripolTextStyles.labelLarge.copyWith(
        //                 color: Colors.black,
        //               ),
        //             ),
        //             SizedBox(
        //               width: 5 / mockUpWidth * size.width,
        //             ),
        //             Expanded(
        //               child: Divider(
        //                 height: 20 / mockUpHeight * size.height,
        //                 thickness: 1 / mockUpHeight * size.height,
        //                 color: Colors.black,
        //               ),
        //             ),
        //           ],
        //         ),
        //       ),
        //       SizedBox(
        //         height: 10 / mockUpHeight * size.height,
        //       ),
        //       Wrap(
        //         alignment: WrapAlignment.center,
        //         spacing: 15 / mockUpWidth * size.width,
        //         runSpacing: 10 / mockUpHeight * size.height,
        //         children: houseOfRepsWidgets,
        //       ),
        //       SizedBox(
        //         height: 20 / mockUpHeight * size.height,
        //       ),
        //       SizedBox(
        //         width: size.width,
        //         child: Row(
        //           crossAxisAlignment: CrossAxisAlignment.center,
        //           children: [
        //             Text(
        //               "Party List",
        //               textScaleFactor: textScale,
        //               style: veripolTextStyles.labelLarge.copyWith(
        //                 color: Colors.black,
        //               ),
        //             ),
        //             SizedBox(
        //               width: 5 / mockUpWidth * size.width,
        //             ),
        //             Expanded(
        //               child: Divider(
        //                 height: 20 / mockUpHeight * size.height,
        //                 thickness: 1 / mockUpHeight * size.height,
        //                 color: Colors.black,
        //               ),
        //             ),
        //           ],
        //         ),
        //       ),
        //       SizedBox(
        //         height: 10 / mockUpHeight * size.height,
        //       ),
        //       InkWell(
        //         onTap: () async {
        //           paginationController.clearFields();
        //           Navigator.push(
        //             context,
        //             MaterialPageRoute(
        //               builder: (context) => const VeripolSplash(),
        //             ),
        //           );
        //           await candidateDataController
        //               .readPartyList()
        //               .whenComplete(() {
        //             Future.delayed(const Duration(seconds: 1), () {})
        //                 .whenComplete(
        //               () => Navigator.pushReplacement(
        //                 context,
        //                 MaterialPageRoute(
        //                   builder: (context) => AddCandidate(
        //                     screenSize: widget.screenSize,
        //                     textScale: widget.textScale,
        //                     position: "Party List",
        //                     posCardColor: veripolColors.passionRed,
        //                     posBgImageURL:
        //                         "assets/party_list_text_bg_1.png",
        //                     bgImageOffset: Offset(
        //                       70 / mockUpWidth * widget.screenSize.width,
        //                       -10 / mockUpHeight * widget.screenSize.height,
        //                     ),
        //                     posBgImageSize: const Size(286, 94),
        //                     candidates: candidateDataController.candidates,
        //                   ),
        //                 ),
        //               ),
        //             );
        //           });
        //         },
        //         child: const MyCandidateAddButton(),
        //       ),
        //       SizedBox(
        //         height: 20 / mockUpHeight * size.height,
        //       ),
        //     ],
        //   ),
      ],
    );
  }
}
