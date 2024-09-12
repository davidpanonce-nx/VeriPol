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
import '../views/splash/splash.dart';
import 'themes.dart';

class MyCandidatesNationalTab extends StatefulWidget {
  const MyCandidatesNationalTab({super.key, required this.screenSize});

  final Size screenSize;
  @override
  State<MyCandidatesNationalTab> createState() => _MyCandidatesNationalTabState();
}

class _MyCandidatesNationalTabState extends State<MyCandidatesNationalTab> {
  List<Widget> senatorWidgets = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final myCandidatesController = Provider.of<MyCandidatesDataController>(context);
    final dataController = Provider.of<DataController>(context);
    final candidateDataController = Provider.of<CandidateDataController>(context);
    final paginationController = Provider.of<PaginationController>(context);

    return ListView(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 10,
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
                  style: veripolTextStyles.labelLarge.copyWith(
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                myCandidatesController.myNationalData["president"] != null
                    ? InkWell(
                        onTap: () async {
                          DialogBoxes().removeOrViewDialog(context, size, "PRESIDENT", "", 0);
                        },
                        child: MyCandidateSelectedCandidate(
                          data: myCandidatesController.myNationalData["president"],
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
                          await candidateDataController.readPresident().whenComplete(() {
                            Future.delayed(const Duration(seconds: 1), () {}).whenComplete(
                              () => Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AddCandidate(
                                    screenSize: widget.screenSize,
                                    position: "President",
                                    posCardColor: veripolColors.blueTrust,
                                    posBgImageURL: "assets/president_text_bg.png",
                                    bgImageOffset: const Offset(
                                      70,
                                      -10,
                                    ),
                                    posBgImageSize: const Size(355, 128),
                                    candidates: candidateDataController.candidates,
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
            const SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Vice President",
                  style: veripolTextStyles.labelLarge.copyWith(
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                myCandidatesController.myNationalData["vicePresident"] != null
                    ? InkWell(
                        onTap: () {
                          DialogBoxes().removeOrViewDialog(context, size, "VICE-PRESIDENT", "", 0);
                        },
                        child: MyCandidateSelectedCandidate(
                          data: myCandidatesController.myNationalData["vicePresident"],
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
                          await candidateDataController.readVicePresident().whenComplete(() {
                            Future.delayed(const Duration(seconds: 1), () {}).whenComplete(
                              () => Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AddCandidate(
                                    screenSize: widget.screenSize,
                                    position: "Vice President",
                                    posCardColor: veripolColors.darkRedPassion,
                                    posBgImageURL: "assets/vice_president_text_bg.png",
                                    bgImageOffset: const Offset(
                                      70,
                                      -10,
                                    ),
                                    posBgImageSize: const Size(368, 75),
                                    candidates: candidateDataController.candidates,
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
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          width: size.width,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Senators",
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
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 15,
          runSpacing: 10,
          children: myCandidatesController.senatorWidgets,
        ),
        const SizedBox(
          height: 20,
        ),
        // myCandidatesController.houseOfRep == 1 ?

        Column(
          children: [
            SizedBox(
              width: size.width,
              child: const Divider(
                height: 20,
                thickness: 1,
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
                      style: veripolTextStyles.labelLarge.copyWith(
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    myCandidatesController.myNationalData["houseRep"] != null
                        ? InkWell(
                            onTap: () {
                              DialogBoxes().removeOrViewDialog(
                                myCandidatesController.scaffoldKey.currentContext!,
                                size,
                                "HOUSE OF REP",
                                "",
                                0,
                              );
                            },
                            child: MyCandidateSelectedCandidate(
                              data: myCandidatesController.myNationalData["houseRep"],
                            ),
                          )
                        : InkWell(
                            onTap: () async {
                              paginationController.clearFields();
                              Navigator.push(
                                myCandidatesController.scaffoldKey.currentContext!,
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
                                Future.delayed(const Duration(seconds: 1), () {}).whenComplete(
                                  () => Navigator.pushReplacement(
                                    myCandidatesController.scaffoldKey.currentContext!,
                                    MaterialPageRoute(
                                      builder: (context) => AddCandidate(
                                        screenSize: widget.screenSize,
                                        position: "House of Representatives",
                                        posCardColor: veripolColors.blueTrust,
                                        posBgImageURL: "assets/house_of_reps_text_bg_1.png",
                                        bgImageOffset: const Offset(70, -10),
                                        posBgImageSize: const Size(302, 41),
                                        candidates: candidateDataController.candidates,
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
                const SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Party List",
                      style: veripolTextStyles.labelLarge.copyWith(
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    myCandidatesController.myNationalData["partyList"] != null
                        ? InkWell(
                            onTap: () {
                              DialogBoxes().removeOrViewDialog(context, size, "PARTY LIST", "", 0);
                            },
                            child: MyCandidateSelectedCandidate(
                              data: myCandidatesController.myNationalData["partyList"],
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
                              await candidateDataController.readPartyList().whenComplete(() {
                                Future.delayed(const Duration(seconds: 1), () {}).whenComplete(
                                  () => Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => AddCandidate(
                                        screenSize: widget.screenSize,
                                        position: "Party List",
                                        posCardColor: veripolColors.passionRed,
                                        posBgImageURL: "assets/party_list_text_bg_1.png",
                                        bgImageOffset: const Offset(
                                          70,
                                          -10,
                                        ),
                                        posBgImageSize: const Size(286, 94),
                                        candidates: candidateDataController.candidates,
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
        //
        //               style: veripolTextStyles.labelLarge.copyWith(
        //                 color: Colors.black,
        //               ),
        //             ),
        //             SizedBox(
        //               width: 5 ,
        //             ),
        //             Expanded(
        //               child: Divider(
        //                 height: 20 ,
        //                 thickness: 1 ,
        //                 color: Colors.black,
        //               ),
        //             ),
        //           ],
        //         ),
        //       ),
        //       SizedBox(
        //         height: 10 ,
        //       ),
        //       Wrap(
        //         alignment: WrapAlignment.center,
        //         spacing: 15 ,
        //         runSpacing: 10 ,
        //         children: houseOfRepsWidgets,
        //       ),
        //       SizedBox(
        //         height: 20 ,
        //       ),
        //       SizedBox(
        //         width: size.width,
        //         child: Row(
        //           crossAxisAlignment: CrossAxisAlignment.center,
        //           children: [
        //             Text(
        //               "Party List",
        //
        //               style: veripolTextStyles.labelLarge.copyWith(
        //                 color: Colors.black,
        //               ),
        //             ),
        //             SizedBox(
        //               width: 5 ,
        //             ),
        //             Expanded(
        //               child: Divider(
        //                 height: 20 ,
        //                 thickness: 1 ,
        //                 color: Colors.black,
        //               ),
        //             ),
        //           ],
        //         ),
        //       ),
        //       SizedBox(
        //         height: 10 ,
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
        //                     textScale:,
        //                     position: "Party List",
        //                     posCardColor: veripolColors.passionRed,
        //                     posBgImageURL:
        //                         "assets/party_list_text_bg_1.png",
        //                     bgImageOffset: Offset(
        //                       70 ,
        //                       -10 ,
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
        //         height: 20 ,
        //       ),
        //     ],
        //   ),
      ],
    );
  }
}
