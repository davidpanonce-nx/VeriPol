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
                            "Content is on the way!",
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
                      height: 46.5 / mockUpHeight * size.height,
                    ),
                    Image.asset(
                      "assets/empty_state.png",
                      width: 238,
                      height: 193,
                      scale: scale,
                    ),
                    SizedBox(
                      height: 20 / mockUpHeight * size.height,
                    ),
                    Text(
                      "Love your excitement!\nThis content is still in development.",
                      textAlign: TextAlign.center,
                      textScaleFactor: textScale,
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
                    SizedBox(
                      height: 10 / mockUpHeight * size.height,
                    ),
                    Text(
                      "We’re working hard with our subject matter\nexperts to deliver this content to you before\nthe elections. Please come back around\nsecond half of April!",
                      textAlign: TextAlign.center,
                      textScaleFactor: textScale,
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
                    SizedBox(
                      height: 10 / mockUpHeight * size.height,
                    ),
                    RichText(
                      textScaleFactor: textScale,
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
                    SizedBox(
                      height: 85 / mockUpHeight * size.height,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10 / mockUpWidth * size.width),
                      child: ElevatedButton(
                        onPressed: () async {
                          await dataController.getLocationData()
                              ? Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const CandidateTypeSelection(),
                                  ),
                                )
                              : Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const RegisteredVoterSelection(),
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
                          height: 60 / mockUpHeight * size.height,
                          child: Center(
                            child: Text(
                              "Go to my candidates",
                              style: veripolTextStyles.labelLarge
                                  .copyWith(color: Colors.white),
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
