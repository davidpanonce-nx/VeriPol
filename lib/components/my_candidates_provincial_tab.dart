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
  const MyCandidatesProvincialTab({
    Key? key,
    required this.textScale,
    required this.screenSize,
  }) : super(key: key);

  final double textScale;
  final Size screenSize;
  @override
  State<MyCandidatesProvincialTab> createState() =>
      _MyCandidatesProvincialTabState();
}

class _MyCandidatesProvincialTabState extends State<MyCandidatesProvincialTab> {
  @override
  void initState() {
    MyCandidatesDataController myCandidatesDataController =
        MyCandidatesDataController();
    myCandidatesDataController.initBuildProvincialBoardWidgets(
        context, widget.screenSize, widget.textScale);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textScale = size.width / mockUpWidth;

    final dataController = Provider.of<DataController>(context);
    final candidateDataController =
        Provider.of<CandidateDataController>(context);
    final paginationController = Provider.of<PaginationController>(context);
    final myCandidatesController =
        Provider.of<MyCandidatesDataController>(context);
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
                  "Governor",
                  textScaleFactor: textScale,
                  style: veripolTextStyles.labelLarge.copyWith(
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 10 / mockUpHeight * size.height,
                ),
                myCandidatesController.myNationalData["governor"] != null
                    ? InkWell(
                        onTap: () async {
                          DialogBoxes().removeOrViewDialog(
                              myCandidatesController
                                  .scaffoldKey.currentContext!,
                              size,
                              textScale,
                              "GOVERNOR",
                              "",
                              0);
                        },
                        child: MyCandidateSelectedCandidate(
                          data:
                              myCandidatesController.myNationalData["governor"],
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
                              .readGovernor(dataController.province)
                              .whenComplete(() {
                            Future.delayed(const Duration(seconds: 1), () {})
                                .whenComplete(
                              () => Navigator.pushReplacement(
                                myCandidatesController
                                    .scaffoldKey.currentContext!,
                                MaterialPageRoute(
                                  builder: (context) => AddCandidate(
                                    screenSize: widget.screenSize,
                                    textScale: widget.textScale,
                                    position: "Governor",
                                    posCardColor: veripolColors.blueTrust,
                                    posBgImageURL:
                                        "assets/governor_text_bg.png",
                                    bgImageOffset: Offset(
                                      170 /
                                          mockUpWidth *
                                          widget.screenSize.width,
                                      -5 /
                                          mockUpHeight *
                                          widget.screenSize.height,
                                    ),
                                    posBgImageSize: const Size(202, 71),
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
                  "Vice Governor",
                  textScaleFactor: textScale,
                  style: veripolTextStyles.labelLarge.copyWith(
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 10 / mockUpHeight * size.height,
                ),
                myCandidatesController.myNationalData["viceGovernor"] != null
                    ? InkWell(
                        onTap: () async {
                          DialogBoxes().removeOrViewDialog(
                              myCandidatesController
                                  .scaffoldKey.currentContext!,
                              size,
                              textScale,
                              "VICE-GOVERNOR",
                              "",
                              0);
                        },
                        child: MyCandidateSelectedCandidate(
                          data: myCandidatesController
                              .myNationalData["viceGovernor"],
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
                              .readViceGovernor(dataController.province)
                              .whenComplete(() {
                            Future.delayed(const Duration(seconds: 1), () {})
                                .whenComplete(
                              () => Navigator.pushReplacement(
                                myCandidatesController
                                    .scaffoldKey.currentContext!,
                                MaterialPageRoute(
                                  builder: (context) => AddCandidate(
                                    screenSize: widget.screenSize,
                                    textScale: widget.textScale,
                                    position: "Vice Governor",
                                    posCardColor: veripolColors.darkRedPassion,
                                    posBgImageURL:
                                        "assets/vice_governor_text_bg.png",
                                    bgImageOffset: Offset(
                                      60 /
                                          mockUpWidth *
                                          widget.screenSize.width,
                                      -5 /
                                          mockUpHeight *
                                          widget.screenSize.height,
                                    ),
                                    posBgImageSize: const Size(315, 75),
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
                "Provincial Board",
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
          children: myCandidatesController.provincialBoardWidgets,
        ),
      ],
    );
  }
}
