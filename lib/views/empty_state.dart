import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:veripol/views/registration%20location/registered_voter.dart';

import '../components/themes.dart';
import '../controller/data_controller.dart';
import 'candidates/candidates_type.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dataController = Provider.of<DataController>(context);
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
                            "Content is on the way!",
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
                    const SizedBox(
                      height: 46.5,
                    ),
                    Image.asset(
                      "assets/empty_state.png",
                      width: 238,
                      height: 193,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Love your excitement!\nThis content is still in development.",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.notoSans(
                        textStyle: const TextStyle(
                          fontStyle: FontStyle.normal,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          height: 1.4,
                          letterSpacing: 0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "We’re working hard with our subject matter\nexperts to deliver this content to you before\nthe elections. Please come back around\nsecond half of April!",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.openSans(
                        textStyle: const TextStyle(
                          fontStyle: FontStyle.normal,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          height: 1.867,
                          letterSpacing: 0.25,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    RichText(
                      text: TextSpan(
                        style: GoogleFonts.openSans(
                          textStyle: const TextStyle(
                            fontStyle: FontStyle.normal,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            height: 1.867,
                            letterSpacing: 0.25,
                            color: Colors.black,
                          ),
                        ),
                        children: [
                          const TextSpan(
                            text: "Why don't you visit ",
                          ),
                          TextSpan(
                            text: "My Candidates",
                            style: GoogleFonts.openSans(
                              textStyle: const TextStyle(
                                fontStyle: FontStyle.normal,
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                height: 1.867,
                                letterSpacing: 0.25,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          const TextSpan(text: " for now?"),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 85,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: ElevatedButton(
                        onPressed: () async {
                          await dataController.getLocationData()
                              ? Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const CandidateTypeSelection(),
                                  ),
                                )
                              : Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const RegisteredVoterSelection(),
                                  ),
                                );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: veripolColors.nightSky,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: SizedBox(
                          height: 60,
                          child: Center(
                            child: Text(
                              "Go to my candidates",
                              style: veripolTextStyles.labelLarge.copyWith(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
