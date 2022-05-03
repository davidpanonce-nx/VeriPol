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

class MyCandidatesMunicipalTab extends StatefulWidget {
  const MyCandidatesMunicipalTab({
    Key? key,
    required this.textScale,
    required this.screenSize,
  }) : super(key: key);

  final double textScale;
  final Size screenSize;
  @override
  State<MyCandidatesMunicipalTab> createState() =>
      _MyCandidatesMunicipalTabState();
}

class _MyCandidatesMunicipalTabState extends State<MyCandidatesMunicipalTab> {
  List<Widget> cityCouncilorWidgets = [];

  @override
  void initState() {
    MyCandidatesDataController myCandidatesDataController =
        MyCandidatesDataController();
    myCandidatesDataController.initBuildCouncilorWidgets(
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
                  "Mayor",
                  textScaleFactor: textScale,
                  style: veripolTextStyles.labelLarge.copyWith(
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 10 / mockUpHeight * size.height,
                ),
                myCandidatesController.myNationalData["mayor"] != null
                    ? InkWell(
                        onTap: () async {
                          DialogBoxes().removeOrViewDialog(
                              context, size, textScale, "MAYOR", "", 0);
                        },
                        child: MyCandidateSelectedCandidate(
                          data: myCandidatesController.myNationalData["mayor"],
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
                              .readMayor(
                                  dataController.province, dataController.city)
                              .whenComplete(() {
                            Future.delayed(const Duration(seconds: 1), () {})
                                .whenComplete(
                              () => Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AddCandidate(
                                    screenSize: widget.screenSize,
                                    textScale: widget.textScale,
                                    position: "Mayor",
                                    posCardColor: veripolColors.blueTrust,
                                    posBgImageURL: "assets/mayor_text_bg.png",
                                    bgImageOffset: Offset(
                                      180 /
                                          mockUpWidth *
                                          widget.screenSize.width,
                                      -5 /
                                          mockUpHeight *
                                          widget.screenSize.height,
                                    ),
                                    posBgImageSize: const Size(166, 92),
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
                  "Vice Mayor",
                  textScaleFactor: textScale,
                  style: veripolTextStyles.labelLarge.copyWith(
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 10 / mockUpHeight * size.height,
                ),
                myCandidatesController.myNationalData["viceMayor"] != null
                    ? InkWell(
                        onTap: () async {
                          DialogBoxes().removeOrViewDialog(
                              context, size, textScale, "VICE MAYOR", "", 0);
                        },
                        child: MyCandidateSelectedCandidate(
                          data: myCandidatesController
                              .myNationalData["viceMayor"],
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
                              .readViceMayor(
                                  dataController.province, dataController.city)
                              .whenComplete(() {
                            Future.delayed(const Duration(seconds: 1), () {})
                                .whenComplete(
                              () => Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AddCandidate(
                                    screenSize: widget.screenSize,
                                    textScale: widget.textScale,
                                    position: "Vice Mayor",
                                    posCardColor: veripolColors.darkRedPassion,
                                    posBgImageURL:
                                        "assets/vice_mayor_text_bg.png",
                                    bgImageOffset: Offset(
                                      70 /
                                          mockUpWidth *
                                          widget.screenSize.width,
                                      -5 /
                                          mockUpHeight *
                                          widget.screenSize.height,
                                    ),
                                    posBgImageSize: const Size(276, 97),
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
              Expanded(
                child: Divider(
                  height: 20 / mockUpHeight * size.height,
                  thickness: 1 / mockUpHeight * size.height,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                width: 5 / mockUpWidth * size.width,
              ),
              Text(
                "Councilors",
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
          children: myCandidatesController.councilorWidgets,
        ),
      ],
    );
  }
}
