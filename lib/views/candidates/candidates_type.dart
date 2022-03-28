import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../components/themes.dart';
import '../../components/veripol_pic_nav.dart';
import '../../controller/data_controller.dart';
import '../registration location/voter.dart';
import 'candidate_selection.dart';

class CandidateTypeSelection extends StatefulWidget {
  const CandidateTypeSelection({Key? key}) : super(key: key);

  @override
  State<CandidateTypeSelection> createState() => _CandidateTypeSelectionState();
}

class _CandidateTypeSelectionState extends State<CandidateTypeSelection> {
  @override
  Widget build(BuildContext context) {
    final dataController = Provider.of<DataController>(context);
    final size = MediaQuery.of(context).size;
    final scale = mockUpWidth / size.width;
    final textScale = size.width / mockUpWidth;
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
            Positioned(
              top: 101 / mockUpHeight * size.height,
              left: -6 / mockUpWidth * size.width,
              child: Text(
                "VOTING IS NOT\nONLY OUR RIGHT\n-IT IS OUR POWER",
                textScaleFactor: textScale,
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontSize: 43.66,
                    fontWeight: FontWeight.w700,
                    height: 0.80,
                    letterSpacing: 0,
                    color: const Color(0xffF6C15C).withOpacity(0.50),
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
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
                            "Candidates",
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
                    SizedBox(
                      width: size.width,
                      height: size.height - 104 / mockUpHeight * size.height,
                      child: ListView(
                        padding: const EdgeInsets.only(top: 0, left: 0),
                        children: [
                          Container(
                            width: size.width,
                            decoration: BoxDecoration(
                              color: veripolColors.sunYellow,
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: 15 / mockUpWidth * size.width,
                              vertical: 15 / mockUpHeight * size.height,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Selected Location",
                                  style: veripolTextStyles.titleSmall.copyWith(
                                    color: Colors.black.withOpacity(0.50),
                                  ),
                                ),
                                SizedBox(
                                  height: 5 / mockUpHeight * size.height,
                                ),
                                Text(
                                  dataController.province == ""
                                      ? dataController.barangay +
                                          ", " +
                                          dataController.city +
                                          ", " +
                                          dataController.region
                                      : dataController.barangay +
                                          ", " +
                                          dataController.city +
                                          ", " +
                                          dataController.province +
                                          ", " +
                                          dataController.region,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  textScaleFactor: textScale,
                                  textAlign: TextAlign.start,
                                  style: veripolTextStyles.bodyMedium.copyWith(
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(
                                  height: 5 / mockUpHeight * size.height,
                                ),
                                Text(
                                  "YOU WILL SEE CANDIDATES FROM YOUR SET LOCATION",
                                  style: veripolTextStyles.labelSmall.copyWith(
                                    color: Colors.black.withOpacity(0.50),
                                  ),
                                ),
                                SizedBox(
                                  height: 5 / mockUpHeight * size.height,
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const Voter(),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    height: 40 / mockUpHeight * size.height,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 1,
                                        color: Colors.black,
                                      ),
                                      borderRadius: BorderRadius.circular(
                                        5 / mockUpWidth * size.width,
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Change Location",
                                        textAlign: TextAlign.center,
                                        textScaleFactor: textScale,
                                        style: veripolTextStyles.labelLarge
                                            .copyWith(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20 / mockUpHeight * size.height,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 12.5 / mockUpWidth * size.width,
                            ),
                            child: Column(
                              children: [
                                VeripolPicNavigationButton(
                                  label: "National",
                                  subLabel: "PRESIDENT TO SENATORS",
                                  imageURL: "assets/state_of_the_nation_bg.png",
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const CandidatesSelection(
                                          type: "National",
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                SizedBox(
                                  height: 10 / mockUpHeight * size.height,
                                ),
                                VeripolPicNavigationButton(
                                  label: "Provincial",
                                  subLabel: "GOVERNORS AND PROVINCIAL BOARD",
                                  imageURL: "assets/provincial_bg.png",
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const CandidatesSelection(
                                          type: "Provincial",
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                SizedBox(
                                  height: 10 / mockUpHeight * size.height,
                                ),
                                VeripolPicNavigationButton(
                                  label: "Municipal",
                                  subLabel: "MAYORS TO COUNCILORS",
                                  imageURL: "assets/courses_articles_bg.png",
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const CandidatesSelection(
                                          type: "Municipal",
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                SizedBox(
                                  height: 10 / mockUpHeight * size.height,
                                ),
                                VeripolPicNavigationButton(
                                  label: "Barangay",
                                  subLabel: "BRGY. CAPTAIN TO SK CHAIRMAN",
                                  imageURL: "assets/courses_articles_bg.png",
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const CandidatesSelection(
                                          type: "Barangay",
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20 / mockUpHeight * size.height,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
