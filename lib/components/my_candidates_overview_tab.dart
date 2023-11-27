import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:veripol/controller/data_controller.dart';
import 'package:veripol/controller/my_candidate_data_controller.dart';

import '../controller/candidate_data_controller.dart';
import 'themes.dart';

class MyCandidatesOverviewTab extends StatefulWidget {
  const MyCandidatesOverviewTab({Key? key, required this.screenSize}) : super(key: key);

  final Size screenSize;
  @override
  State<MyCandidatesOverviewTab> createState() => _MyCandidatesOverviewTabState();
}

class _MyCandidatesOverviewTabState extends State<MyCandidatesOverviewTab> {
  @override
  void initState() {
    MyCandidatesDataController myCandidatesDataController = MyCandidatesDataController();
    myCandidatesDataController.initBuildSenatorWidgets(context, widget.screenSize);

    myCandidatesDataController.initBuildCouncilorWidgets(context, widget.screenSize);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final dataController = Provider.of<DataController>(context);
    final candidateDataController = Provider.of<CandidateDataController>(context);
    final myCandidatesDataController = Provider.of<MyCandidatesDataController>(context);
    return ListView(
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
        Container(
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
            horizontal: 15,
            vertical: 15,
          ),
          margin: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Your Total Number of Candidates",
                style: veripolTextStyles.titleSmall.copyWith(
                  color: Colors.black,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 15,
                  left: 10,
                  right: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "For May 2022 Elections",
                      style: veripolTextStyles.bodySmall.copyWith(
                        color: const Color(0xff575E71),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text(
                          myCandidatesDataController.myTotalCandidates.toString(),
                          style: veripolTextStyles.titleLarge.copyWith(
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "out of ${myCandidatesDataController.totalCandidates} total candidates",
                          style: veripolTextStyles.labelLarge.copyWith(
                            color: const Color(0xff575E71),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Divider(
                      height: 20,
                      thickness: 1,
                      color: Colors.black.withOpacity(0.20),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "National",
                              style: veripolTextStyles.bodySmall.copyWith(
                                color: const Color(0xff575E71),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  myCandidatesDataController.myNationalCandidates.toString(),
                                  style: veripolTextStyles.titleLarge.copyWith(color: Colors.black),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "/ ${myCandidatesDataController.nationalCandidates}",
                                  style: veripolTextStyles.labelLarge.copyWith(
                                    color: const Color(0xff575E71),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 45.67,
                        ),
                        candidateDataController.highlyUrbanizedCities.contains(dataController.city)
                            ? const SizedBox()
                            : Padding(
                                padding: const EdgeInsets.only(
                                  right: 43.67,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Provincial",
                                      style: veripolTextStyles.bodySmall.copyWith(
                                        color: const Color(0xff575E71),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          myCandidatesDataController.myProvincialCandidates.toString(),
                                          style: veripolTextStyles.titleLarge.copyWith(color: Colors.black),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          "/ ${myCandidatesDataController.provincialCandidates}",
                                          style: veripolTextStyles.labelLarge.copyWith(
                                            color: const Color(0xff575E71),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Municipal",
                              style: veripolTextStyles.bodySmall.copyWith(
                                color: const Color(0xff575E71),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  myCandidatesDataController.myMunicipalCandidates.toString(),
                                  style: veripolTextStyles.titleLarge.copyWith(color: Colors.black),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "/ ${myCandidatesDataController.municipalCandidates}",
                                  style: veripolTextStyles.labelLarge.copyWith(
                                    color: const Color(0xff575E71),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
