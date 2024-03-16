import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:veripol/components/dialog_boxes.dart';
import 'package:veripol/controller/candidate_data_controller.dart';

import '../../components/themes.dart';
import '../../components/veripol_pic_nav.dart';
import '../../controller/data_controller.dart';
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
    final candidateDataController = Provider.of<CandidateDataController>(context);
    final size = MediaQuery.of(context).size;

    return Scaffold(
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
            Positioned(
              top: 101,
              left: -6,
              child: Text(
                "VOTING IS NOT\nONLY OUR RIGHT\n-IT IS OUR POWER",
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
                            "Candidates",
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
                      height: size.height - 104,
                      child: ListView(
                        padding: const EdgeInsets.only(top: 0, left: 0),
                        children: [
                          Container(
                            width: size.width,
                            decoration: BoxDecoration(
                              color: veripolColors.sunYellow,
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 15,
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
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  dataController.province == ""
                                      ? "${dataController.barangay}, ${dataController.city}, ${dataController.region}"
                                      : "${dataController.barangay}, ${dataController.city}, ${dataController.province}, ${dataController.region}",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.start,
                                  style: veripolTextStyles.bodyMedium.copyWith(
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "YOU WILL SEE CANDIDATES FROM YOUR SET LOCATION",
                                  style: veripolTextStyles.labelSmall.copyWith(
                                    color: Colors.black.withOpacity(0.50),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                InkWell(
                                  onTap: () {
                                    DialogBoxes().changeLocationDialog(context, size);
                                  },
                                  child: Container(
                                    height: 40,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 1,
                                        color: Colors.black,
                                      ),
                                      borderRadius: BorderRadius.circular(
                                        5,
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Change Location",
                                        textAlign: TextAlign.center,
                                        style: veripolTextStyles.labelLarge.copyWith(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12.5,
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
                                        builder: (context) => const CandidatesSelection(
                                          type: "National",
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                Visibility(
                                  visible: !candidateDataController.highlyUrbanizedCities.contains(dataController.city),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      top: 10,
                                    ),
                                    child: VeripolPicNavigationButton(
                                      label: "Provincial",
                                      subLabel: "GOVERNORS AND PROVINCIAL BOARD",
                                      imageURL: "assets/provincial_bg.png",
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => const CandidatesSelection(
                                              type: "Provincial",
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                VeripolPicNavigationButton(
                                  label: "Municipal",
                                  subLabel: "MAYORS TO COUNCILORS",
                                  imageURL: "assets/courses_articles_bg.png",
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const CandidatesSelection(
                                          type: "Municipal",
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                VeripolPicNavigationButton(
                                  label: "Barangay",
                                  subLabel: "BRGY. CAPTAIN TO SK CHAIRMAN",
                                  imageURL: "assets/courses_articles_bg.png",
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const CandidatesSelection(
                                          type: "Barangay",
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
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
