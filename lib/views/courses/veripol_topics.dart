import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:veripol/components/dummy_data.dart';
import 'package:veripol/components/topic_number_card.dart';

import '../../components/themes.dart';
import '../empty_state.dart';

class VeripolTopics extends StatefulWidget {
  const VeripolTopics({Key? key}) : super(key: key);

  @override
  State<VeripolTopics> createState() => _VeripolTopicsState();
}

class _VeripolTopicsState extends State<VeripolTopics> {
  late int numberOfTopics;
  late int numberOfArticles;
  late int numberOfTests;
  late List<Map<String, dynamic>> topicList;
  late String courseLabel;
  late String courseTitle;
  List<Widget> topicWidget = [];

  @override
  void initState() {
    initData();
    buildTopicModuleWidget();
    super.initState();
  }

  void initData() {
    topicList = DummyData().nationalRoles;
    numberOfTopics = topicList.length;
    numberOfArticles = 25;
    numberOfTests = 10;
    courseLabel = "Course Label Here";
    courseTitle = "National Roles in the Government";
  }

  void buildTopicModuleWidget() {
    for (var topics in topicList) {
      topicWidget.add(TopicNumberCard(topicData: topics));
    }
  }

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
                            "Topics",
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
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(color: veripolColors.nightSky),
                            child: Stack(
                              children: [
                                Positioned(
                                  right: 3,
                                  top: 0,
                                  child: Text(
                                    "Natonal\nRoles",
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                      fontFamily: "MountainScript",
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 60.43,
                                      height: 1.6,
                                      letterSpacing: 0,
                                      color: const Color(0xff44464E).withOpacity(0.20),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: size.width,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 15,
                                    horizontal: 12,
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        courseLabel,
                                        style: veripolTextStyles.bodySmall.copyWith(
                                          color: Colors.white.withOpacity(0.50),
                                        ),
                                      ),
                                      Text(
                                        courseTitle,
                                        maxLines: 2,
                                        style: veripolTextStyles.headlineSmall.copyWith(
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        "$numberOfTopics Topics",
                                        style: veripolTextStyles.bodySmall.copyWith(
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        "$numberOfArticles Articles - $numberOfTests Tests",
                                        style: veripolTextStyles.bodySmall.copyWith(
                                          color: Colors.white,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 16,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context, MaterialPageRoute(builder: (context) => const EmptyState()));
                                        },
                                        child: Container(
                                          height: 40,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              width: 1,
                                              color: Colors.white,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              5,
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              "Get Started",
                                              textAlign: TextAlign.center,
                                              style: veripolTextStyles.labelLarge.copyWith(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12.5,
                            ),
                            child: Column(
                              children: topicWidget,
                            ),
                          ),
                          const SizedBox(height: 20),
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
