import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:veripol/components/my_candidates_municipal_tab.dart';
import 'package:veripol/components/my_candidates_overview_tab.dart';
import 'package:veripol/components/my_candidates_provincial_tab.dart';
import 'package:veripol/controller/candidate_data_controller.dart';
import 'package:veripol/controller/data_controller.dart';

import '../../components/my_candidates_national_tab.dart';
import '../../components/themes.dart';
import '../../controller/my_candidate_data_controller.dart';

class MyCandidatesScreen extends StatefulWidget {
  const MyCandidatesScreen({super.key});

  @override
  State<MyCandidatesScreen> createState() => _MyCandidatesScreenState();
}

class _MyCandidatesScreenState extends State<MyCandidatesScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final dataController = Provider.of<DataController>(context);
    final candidateDataController = Provider.of<CandidateDataController>(context);
    final myCandidatesController = Provider.of<MyCandidatesDataController>(context);
    return Scaffold(
      key: myCandidatesController.scaffoldKey,
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              child: Image.asset(
                "assets/bg_pattern.png",
              ),
            ),
            DefaultTabController(
              length: candidateDataController.highlyUrbanizedCities.contains(dataController.city) ? 3 : 4,
              child: SingleChildScrollView(
                child: Container(
                  width: size.width,
                  height: size.height,
                  padding: const EdgeInsets.only(
                    top: 48,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 375,
                        height: 56,
                        padding: const EdgeInsets.only(
                          top: 12,
                          left: 16,
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
                              "My Candidates",
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
                          ],
                        ),
                      ),
                      Container(
                        width: size.width,
                        decoration: const BoxDecoration(
                          color: Color(0xff051923),
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              right: 0,
                              top: -5,
                              height: 94,
                              width: 326,
                              child: Image.asset("assets/my_candidates_bg.png"),
                            ),
                            Container(
                              width: size.width,
                              decoration: const BoxDecoration(),
                              padding: const EdgeInsets.only(
                                top: 6.5,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      "My Candidates",
                                      style: veripolTextStyles.headlineLarge.copyWith(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      "MAY 2022 ELECTIONS",
                                      style: veripolTextStyles.labelSmall.copyWith(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 26.5,
                                  ),
                                  candidateDataController.highlyUrbanizedCities.contains(dataController.city)
                                      ? TabBar(
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
                                                  "National",
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
                                                  "Municipal",
                                                  style: veripolTextStyles.labelMedium,
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      : TabBar(
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
                                              width: 93.75,
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
                                              width: 93.75,
                                              padding: const EdgeInsets.only(
                                                bottom: 5,
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "National",
                                                  style: veripolTextStyles.labelMedium,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: 93.75,
                                              padding: const EdgeInsets.only(
                                                bottom: 5,
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "Provincial",
                                                  style: veripolTextStyles.labelMedium,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: 93.75,
                                              padding: const EdgeInsets.only(
                                                bottom: 5,
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "Municipal",
                                                  style: veripolTextStyles.labelMedium,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      candidateDataController.highlyUrbanizedCities.contains(dataController.city)
                          ? Expanded(
                              child: TabBarView(
                                children: [
                                  MyCandidatesOverviewTab(
                                    screenSize: size,
                                  ),
                                  MyCandidatesNationalTab(
                                    screenSize: size,
                                  ),
                                  MyCandidatesMunicipalTab(
                                    screenSize: size,
                                  ),
                                ],
                              ),
                            )
                          : Expanded(
                              child: TabBarView(
                                children: [
                                  MyCandidatesOverviewTab(
                                    screenSize: size,
                                  ),
                                  MyCandidatesNationalTab(
                                    screenSize: size,
                                  ),
                                  MyCandidatesProvincialTab(
                                    screenSize: size,
                                  ),
                                  MyCandidatesMunicipalTab(
                                    screenSize: size,
                                  ),
                                ],
                              ),
                            ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
