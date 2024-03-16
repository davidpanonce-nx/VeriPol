import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../components/themes.dart';
import '../../local_data.dart';

class TestModuleMCQItem extends StatefulWidget {
  const TestModuleMCQItem({Key? key}) : super(key: key);

  @override
  State<TestModuleMCQItem> createState() => _TestModuleMCQItemState();
}

class _TestModuleMCQItemState extends State<TestModuleMCQItem> {
  List<Map<String, dynamic>> choices = [
    {
      "text": "Judicial",
      "is_answer": false,
    },
    {
      "text": "Extra-Judicial Killings",
      "is_answer": true,
    },
    {
      "text": "Executive",
      "is_answer": false,
    },
    {
      "text": "Legislative",
      "is_answer": false,
    },
  ];
  String selectedChoice = "";
  @override
  Widget build(BuildContext context) {
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 4,
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
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Question #1',
                                    textAlign: TextAlign.center,
                                    style: veripolTextStyles.labelSmall.copyWith(
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    'Which is not a power according to our principle of separation of powers?',
                                    style: veripolTextStyles.titleMedium.copyWith(
                                      color: Colors.white,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: MediaQuery.removePadding(
                                context: context,
                                removeTop: true,
                                child: ListView.builder(
                                  itemCount: choices.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(bottom: 20.0),
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(vertical: 5),
                                        width: size.width,
                                        decoration: BoxDecoration(
                                          color: veripolColors.nightSky,
                                          borderRadius: BorderRadius.circular(8),
                                          border: Border.all(
                                            color: choices[index]["text"] == selectedChoice
                                                ? veripolColors.sunYellow
                                                : veripolColors.nightSky,
                                            width: 3,
                                          ),
                                        ),
                                        child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              selectedChoice = choices[index]["text"];
                                            });
                                          },
                                          child: Row(
                                            children: [
                                              Theme(
                                                data: ThemeData(
                                                  unselectedWidgetColor: Colors.white,
                                                ),
                                                child: Radio<String>(
                                                  value: choices[index]["text"],
                                                  groupValue: selectedChoice,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      selectedChoice = value!;
                                                    });
                                                  },
                                                  activeColor: veripolColors.sunYellow,
                                                ),
                                              ),
                                              Text(
                                                choices[index]["text"],
                                                style: veripolTextStyles.labelLarge.copyWith(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(15, 0, 15, 40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 70,
                              height: 20,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Icon(Icons.arrow_back),
                                  Text(
                                    'Back',
                                    style: veripolTextStyles.labelLarge.copyWith(height: 1.3),
                                  )
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () async {
                                await FirebaseFirestore.instance
                                    .collection('TestModules')
                                    .doc(testModule.uid)
                                    .set(testModule.toMap());
                              },
                              child: Container(
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
                                      style: veripolTextStyles.labelLarge.copyWith(height: 1.3, color: Colors.white),
                                    ),
                                    const Icon(Icons.arrow_forward, color: Colors.white),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
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
  }
}
