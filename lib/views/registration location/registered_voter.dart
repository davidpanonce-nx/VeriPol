import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../components/themes.dart';
import '../../controller/data_controller.dart';
import 'voter.dart';

class RegisteredVoterSelection extends StatelessWidget {
  const RegisteredVoterSelection({Key? key}) : super(key: key);

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
            SingleChildScrollView(
              child: Container(
                width: size.width,
                padding: EdgeInsets.only(
                  top: 156 / mockUpHeight * size.height,
                  left: 10 / mockUpWidth * size.width,
                  right: 10 / mockUpWidth * size.width,
                ),
                child: Column(
                  children: [
                    Image.asset(
                      "assets/veripol_logo.png",
                      width: 106,
                      height: 99,
                      scale: scale,
                    ),
                    SizedBox(
                      height: 18 / mockUpHeight * size.height,
                    ),
                    Text(
                      "Are you a registered voter?",
                      textScaleFactor: textScale,
                      style: GoogleFonts.openSans(
                        textStyle: const TextStyle(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w700,
                          fontSize: 22,
                          height: 1.27,
                          letterSpacing: 0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 223 / mockUpHeight * size.height,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        dataController.readJson();

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Voter(
                              answer: true,
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: veripolColors.nightSky,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              5 / mockUpWidth * size.width),
                        ),
                      ),
                      child: SizedBox(
                        height: 60 / mockUpHeight * size.height,
                        child: Center(
                          child: Text(
                            "Yes",
                            textScaleFactor: textScale,
                            style: veripolTextStyles.labelLarge
                                .copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 18 / mockUpHeight * size.height,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        dataController.readJson();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Voter(
                              answer: false,
                            ),
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
                            "No",
                            textScaleFactor: textScale,
                            style: veripolTextStyles.labelLarge
                                .copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 56 / mockUpHeight * size.height,
              left: 19 / mockUpWidth * size.width,
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.arrow_back),
                iconSize: 30 / mockUpWidth * size.width,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
