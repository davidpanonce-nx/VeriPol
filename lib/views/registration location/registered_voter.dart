import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../components/themes.dart';
import '../../controller/data_controller.dart';
import 'voter.dart';

class RegisteredVoterSelection extends StatelessWidget {
  const RegisteredVoterSelection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final dataController = Provider.of<DataController>(context);
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
                padding: const EdgeInsets.only(
                  top: 156,
                  left: 10,
                  right: 10,
                ),
                child: Column(
                  children: [
                    Image.asset(
                      "assets/veripol_logo.png",
                      width: 106,
                      height: 99,
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Text(
                      "Are you a registered voter?",
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
                    const SizedBox(
                      height: 223,
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
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: SizedBox(
                        height: 60,
                        child: Center(
                          child: Text(
                            "Yes",
                            style: veripolTextStyles.labelLarge.copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 18,
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
                        height: 60,
                        child: Center(
                          child: Text(
                            "No",
                            style: veripolTextStyles.labelLarge.copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 56,
              left: 19,
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.arrow_back),
                iconSize: 30,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
