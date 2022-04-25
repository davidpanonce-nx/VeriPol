import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:veripol/components/my_candidates_municipal_tab.dart';
import 'package:veripol/components/my_candidates_overview_tab.dart';
import 'package:veripol/components/my_candidates_provincial_tab.dart';
import 'package:veripol/controller/data_controller.dart';

import '../../components/my_candidates_national_tab.dart';
import '../../components/themes.dart';

class MyCandidatesScreen extends StatefulWidget {
  const MyCandidatesScreen({Key? key}) : super(key: key);

  @override
  State<MyCandidatesScreen> createState() => _MyCandidatesScreenState();
}

class _MyCandidatesScreenState extends State<MyCandidatesScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final scale = mockUpWidth / size.width;
    final textScale = size.width / mockUpWidth;
    final dataController = Provider.of<DataController>(context);
    return Scaffold(
      backgroundColor: veripolColors.background,
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              child: Image.asset(
                "assets/bg_pattern.png",
                scale: scale,
              ),
            ),
            DefaultTabController(
              length: dataController.region == "National Capital Region (NCR)"
                  ? 3
                  : 4,
              child: SingleChildScrollView(
                child: Container(
                  width: size.width,
                  height: size.height,
                  padding: EdgeInsets.only(
                    top: 48 / mockUpHeight * size.height,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 375 / mockUpWidth * size.width,
                        height: 56 / mockUpHeight * size.height,
                        padding: EdgeInsets.only(
                          top: 12 / mockUpHeight * size.height,
                          left: 16 / mockUpWidth * size.width,
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
                              iconSize: 30 / mockUpWidth * size.width,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: 32 / mockUpWidth * size.width,
                            ),
                            Text(
                              "My Candidates",
                              textScaleFactor: textScale,
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
                              top: -5 / mockUpHeight * size.height,
                              height: 94 / mockUpHeight * size.height,
                              width: 326 / mockUpWidth * size.width,
                              child: Image.asset("assets/my_candidates_bg.png"),
                            ),
                            Container(
                              width: size.width,
                              decoration: const BoxDecoration(),
                              padding: EdgeInsets.only(
                                top: 6.5 / mockUpHeight * size.height,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 10 / mockUpWidth * size.width),
                                    child: Text(
                                      "My Candidates",
                                      style: veripolTextStyles.headlineLarge
                                          .copyWith(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                      height: 10 / mockUpHeight * size.height),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 10 / mockUpWidth * size.width),
                                    child: Text(
                                      "MAY 2022 ELECTIONS",
                                      style:
                                          veripolTextStyles.labelSmall.copyWith(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 26.5 / mockUpHeight * size.height,
                                  ),
                                  dataController.region ==
                                          "National Capital Region (NCR)"
                                      ? TabBar(
                                          labelPadding: EdgeInsets.zero,
                                          padding: EdgeInsets.zero,
                                          indicatorColor:
                                              veripolColors.sunYellow,
                                          indicatorSize:
                                              TabBarIndicatorSize.label,
                                          indicatorWeight:
                                              5 / mockUpHeight * size.height,
                                          isScrollable: true,
                                          unselectedLabelColor:
                                              Colors.white.withOpacity(0.50),
                                          labelColor: veripolColors.sunYellow,
                                          tabs: [
                                            Container(
                                              width: 125 /
                                                  mockUpWidth *
                                                  size.width,
                                              padding: EdgeInsets.only(
                                                bottom: 5 /
                                                    mockUpHeight *
                                                    size.height,
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "Overview",
                                                  style: veripolTextStyles
                                                      .labelMedium,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: 125 /
                                                  mockUpWidth *
                                                  size.width,
                                              padding: EdgeInsets.only(
                                                bottom: 5 /
                                                    mockUpHeight *
                                                    size.height,
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "National",
                                                  style: veripolTextStyles
                                                      .labelMedium,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: 125 /
                                                  mockUpWidth *
                                                  size.width,
                                              padding: EdgeInsets.only(
                                                bottom: 5 /
                                                    mockUpHeight *
                                                    size.height,
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "Municipal",
                                                  style: veripolTextStyles
                                                      .labelMedium,
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      : TabBar(
                                          labelPadding: EdgeInsets.zero,
                                          padding: EdgeInsets.zero,
                                          indicatorColor:
                                              veripolColors.sunYellow,
                                          indicatorSize:
                                              TabBarIndicatorSize.label,
                                          indicatorWeight:
                                              5 / mockUpHeight * size.height,
                                          isScrollable: true,
                                          unselectedLabelColor:
                                              Colors.white.withOpacity(0.50),
                                          labelColor: veripolColors.sunYellow,
                                          tabs: [
                                            Container(
                                              width: 93.75 /
                                                  mockUpWidth *
                                                  size.width,
                                              padding: EdgeInsets.only(
                                                bottom: 5 /
                                                    mockUpHeight *
                                                    size.height,
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "Overview",
                                                  style: veripolTextStyles
                                                      .labelMedium,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: 93.75 /
                                                  mockUpWidth *
                                                  size.width,
                                              padding: EdgeInsets.only(
                                                bottom: 5 /
                                                    mockUpHeight *
                                                    size.height,
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "National",
                                                  style: veripolTextStyles
                                                      .labelMedium,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: 93.75 /
                                                  mockUpWidth *
                                                  size.width,
                                              padding: EdgeInsets.only(
                                                bottom: 5 /
                                                    mockUpHeight *
                                                    size.height,
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "Provincial",
                                                  style: veripolTextStyles
                                                      .labelMedium,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: 93.75 /
                                                  mockUpWidth *
                                                  size.width,
                                              padding: EdgeInsets.only(
                                                bottom: 5 /
                                                    mockUpHeight *
                                                    size.height,
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "Municipal",
                                                  style: veripolTextStyles
                                                      .labelMedium,
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
                      dataController.region == "National Capital Region (NCR)"
                          ? Expanded(
                              child: TabBarView(
                                children: [
                                  const MyCandidatesOverviewTab(),
                                  MyCandidatesNationalTab(
                                    textScale: textScale,
                                    screenSize: size,
                                  ),
                                  MyCandidatesMunicipalTab(
                                    textScale: textScale,
                                    screenSize: size,
                                  ),
                                ],
                              ),
                            )
                          : Expanded(
                              child: TabBarView(
                                children: [
                                  const MyCandidatesOverviewTab(),
                                  MyCandidatesNationalTab(
                                    textScale: textScale,
                                    screenSize: size,
                                  ),
                                  MyCandidatesProvincialTab(
                                    textScale: textScale,
                                    screenSize: size,
                                  ),
                                  MyCandidatesMunicipalTab(
                                    textScale: textScale,
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
