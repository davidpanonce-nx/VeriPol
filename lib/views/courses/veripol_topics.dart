import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:veripol/components/dummy_data.dart';
import 'package:veripol/components/topic_number_card.dart';

import '../../components/themes.dart';

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
                            "Topics",
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
                            clipBehavior: Clip.antiAlias,
                            decoration:
                                BoxDecoration(color: veripolColors.nightSky),
                            child: Stack(
                              children: [
                                Positioned(
                                  right: 3 / mockUpWidth * size.width,
                                  top: 0,
                                  child: Text(
                                    "Natonal\nRoles",
                                    textScaleFactor: textScale,
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                      fontFamily: "MountainScript",
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 60.43,
                                      height: 1.6,
                                      letterSpacing: 0,
                                      color: const Color(0xff44464E)
                                          .withOpacity(0.20),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: size.width,
                                  padding: EdgeInsets.symmetric(
                                    vertical: 15 / mockUpHeight * size.height,
                                    horizontal: 12 / mockUpWidth * size.width,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        courseLabel,
                                        style: veripolTextStyles.bodySmall
                                            .copyWith(
                                          color: Colors.white.withOpacity(0.50),
                                        ),
                                      ),
                                      Text(
                                        courseTitle,
                                        maxLines: 2,
                                        style: veripolTextStyles.headlineSmall
                                            .copyWith(
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        numberOfTopics.toString() + " Topics",
                                        style: veripolTextStyles.bodySmall
                                            .copyWith(
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        numberOfArticles.toString() +
                                            " Articles - " +
                                            numberOfTests.toString() +
                                            " Tests",
                                        style: veripolTextStyles.bodySmall
                                            .copyWith(
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 16 / mockUpHeight * size.height,
                                      ),
                                      InkWell(
                                        onTap: () {},
                                        child: Container(
                                          height:
                                              40 / mockUpHeight * size.height,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              width: 1,
                                              color: Colors.white,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              5 / mockUpWidth * size.width,
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              "Get Started",
                                              textAlign: TextAlign.center,
                                              textScaleFactor: textScale,
                                              style: veripolTextStyles
                                                  .labelLarge
                                                  .copyWith(
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
                          SizedBox(
                            height: 5 / mockUpHeight * size.height,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 12.5 / mockUpWidth * size.width,
                            ),
                            child: Column(
                              children: topicWidget,
                            ),
                          ),
                          SizedBox(height: 20 / mockUpHeight * size.height),
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
