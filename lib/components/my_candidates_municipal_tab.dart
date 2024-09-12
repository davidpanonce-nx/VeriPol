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
  const MyCandidatesMunicipalTab({super.key, required this.screenSize});

  final Size screenSize;
  @override
  State<MyCandidatesMunicipalTab> createState() => _MyCandidatesMunicipalTabState();
}

class _MyCandidatesMunicipalTabState extends State<MyCandidatesMunicipalTab> {
  List<Widget> cityCouncilorWidgets = [];

  @override
  void initState() {
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
                  "Mayor",
                  style: veripolTextStyles.labelLarge.copyWith(
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                myCandidatesController.myNationalData["mayor"] != null
                    ? InkWell(
                        onTap: () async {
                          DialogBoxes().removeOrViewDialog(context, size, "MAYOR", "", 0);
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
                              .readMayor(dataController.province, dataController.city)
                              .whenComplete(() {
                            Future.delayed(const Duration(seconds: 1), () {}).whenComplete(
                              () => Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AddCandidate(
                                    screenSize: widget.screenSize,
                                    position: "Mayor",
                                    posCardColor: veripolColors.blueTrust,
                                    posBgImageURL: "assets/mayor_text_bg.png",
                                    bgImageOffset: const Offset(
                                      180,
                                      -5,
                                    ),
                                    posBgImageSize: const Size(166, 92),
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
                  "Vice Mayor",
                  style: veripolTextStyles.labelLarge.copyWith(
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                myCandidatesController.myNationalData["viceMayor"] != null
                    ? InkWell(
                        onTap: () async {
                          DialogBoxes().removeOrViewDialog(context, size, "VICE MAYOR", "", 0);
                        },
                        child: MyCandidateSelectedCandidate(
                          data: myCandidatesController.myNationalData["viceMayor"],
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
                              .readViceMayor(dataController.province, dataController.city)
                              .whenComplete(() {
                            Future.delayed(const Duration(seconds: 1), () {}).whenComplete(
                              () => Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AddCandidate(
                                    screenSize: widget.screenSize,
                                    position: "Vice Mayor",
                                    posCardColor: veripolColors.darkRedPassion,
                                    posBgImageURL: "assets/vice_mayor_text_bg.png",
                                    bgImageOffset: const Offset(
                                      70,
                                      -5,
                                    ),
                                    posBgImageSize: const Size(276, 97),
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
              const Expanded(
                child: Divider(
                  height: 20,
                  thickness: 1,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                "Councilors",
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
          children: myCandidatesController.councilorWidgets,
        ),
      ],
    );
  }
}
