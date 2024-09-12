import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:veripol/controller/my_candidate_data_controller.dart';

import '../controller/candidate_data_controller.dart';
import '../controller/data_controller.dart';
import '../controller/pagination_controllers.dart';
import '../views/candidates/add_candidate.dart';
import '../views/splash.dart';
import 'dialog_boxes.dart';
import 'my_candidate_add_button.dart';
import 'my_candidate_selected_card.dart';
import 'themes.dart';

class MyCandidatesProvincialTab extends StatefulWidget {
  const MyCandidatesProvincialTab({super.key, required this.screenSize});

  final Size screenSize;
  @override
  State<MyCandidatesProvincialTab> createState() => _MyCandidatesProvincialTabState();
}

class _MyCandidatesProvincialTabState extends State<MyCandidatesProvincialTab> {
  @override
  void initState() {
    MyCandidatesDataController myCandidatesDataController = MyCandidatesDataController();
    myCandidatesDataController.initBuildProvincialBoardWidgets(context, widget.screenSize);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final dataController = Provider.of<DataController>(context);
    final candidateDataController = Provider.of<CandidateDataController>(context);
    final paginationController = Provider.of<PaginationController>(context);
    final myCandidatesController = Provider.of<MyCandidatesDataController>(context);
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
                  "Governor",
                  style: veripolTextStyles.labelLarge.copyWith(
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                myCandidatesController.myNationalData["governor"] != null
                    ? InkWell(
                        onTap: () async {
                          DialogBoxes().removeOrViewDialog(
                              myCandidatesController.scaffoldKey.currentContext!, size, "GOVERNOR", "", 0);
                        },
                        child: MyCandidateSelectedCandidate(
                          data: myCandidatesController.myNationalData["governor"],
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
                          await candidateDataController.readGovernor(dataController.province).whenComplete(() {
                            Future.delayed(const Duration(seconds: 1), () {}).whenComplete(
                              () => Navigator.pushReplacement(
                                myCandidatesController.scaffoldKey.currentContext!,
                                MaterialPageRoute(
                                  builder: (context) => AddCandidate(
                                    screenSize: widget.screenSize,
                                    position: "Governor",
                                    posCardColor: veripolColors.blueTrust,
                                    posBgImageURL: "assets/governor_text_bg.png",
                                    bgImageOffset: const Offset(170, -5),
                                    posBgImageSize: const Size(202, 71),
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
                  "Vice Governor",
                  style: veripolTextStyles.labelLarge.copyWith(
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                myCandidatesController.myNationalData["viceGovernor"] != null
                    ? InkWell(
                        onTap: () async {
                          DialogBoxes().removeOrViewDialog(
                              myCandidatesController.scaffoldKey.currentContext!, size, "VICE-GOVERNOR", "", 0);
                        },
                        child: MyCandidateSelectedCandidate(
                          data: myCandidatesController.myNationalData["viceGovernor"],
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
                          await candidateDataController.readViceGovernor(dataController.province).whenComplete(() {
                            Future.delayed(const Duration(seconds: 1), () {}).whenComplete(
                              () => Navigator.pushReplacement(
                                myCandidatesController.scaffoldKey.currentContext!,
                                MaterialPageRoute(
                                  builder: (context) => AddCandidate(
                                    screenSize: widget.screenSize,
                                    position: "Vice Governor",
                                    posCardColor: veripolColors.darkRedPassion,
                                    posBgImageURL: "assets/vice_governor_text_bg.png",
                                    bgImageOffset: const Offset(
                                      60,
                                      -5,
                                    ),
                                    posBgImageSize: const Size(315, 75),
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
                "Provincial Board",
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
          children: myCandidatesController.provincialBoardWidgets,
        ),
      ],
    );
  }
}
