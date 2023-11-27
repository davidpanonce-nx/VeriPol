import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../components/testmodule_details_card.dart';
import '../../components/testmodule_lastattempt_card.dart';
import '../../components/themes.dart';

class TestModuleOverview extends StatelessWidget {
  const TestModuleOverview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CollectionReference testModule = FirebaseFirestore.instance.collection('TestModules');
    final size = MediaQuery.of(context).size;
    return FutureBuilder<DocumentSnapshot>(
        future: testModule.doc("8070c248-69c0-4518-b4a3-fda5e946ded2").get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: SizedBox(
                width: 50,
                height: 50,
                child: CircularProgressIndicator(),
              ),
            );
          } else {
            if (snapshot.hasData) {
              Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;

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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
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
                                          "Test",
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
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 12),
                                        width: size.width,
                                        height: 200,
                                        color: veripolColors.nightSky,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'REVIEW',
                                              style: veripolTextStyles.bodySmall.copyWith(
                                                color: Colors.white,
                                              ),
                                            ),
                                            Text(
                                              data['title'],
                                              style: veripolTextStyles.headlineSmall.copyWith(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        )),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
                                    child: TestModuleDetails(
                                        itemCount: data['items'].length, passingGrade: data['passingGrade']),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Score',
                                          style: veripolTextStyles.labelLarge,
                                        ),
                                        const Expanded(
                                          child: Padding(
                                            padding: EdgeInsets.only(left: 5, bottom: 5),
                                            child: Divider(
                                              color: Colors.black,
                                              thickness: 1,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                                    child: TestModuleLastAttempt(
                                        latestScore: data['latestScore'], itemCount: data['items'].length),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                                    child: Container(
                                      height: 45,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5), color: veripolColors.nightSky),
                                      child: Center(
                                        child: Text(
                                          'Take Test',
                                          style: veripolTextStyles.labelLarge.copyWith(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(15, 0, 15, 40),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(),
                                    Container(
                                      width: 100,
                                      height: 45,
                                      padding: const EdgeInsets.symmetric(horizontal: 15),
                                      decoration: BoxDecoration(
                                        color: veripolColors.nightSky,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Next',
                                            style:
                                                veripolTextStyles.labelLarge.copyWith(height: 1.3, color: Colors.white),
                                          ),
                                          const Icon(Icons.arrow_forward, color: Colors.white),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return const Text('No Data Found');
            }
          }
        });
  }
}
