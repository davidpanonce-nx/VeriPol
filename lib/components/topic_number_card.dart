import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:veripol/components/module_card.dart';
import 'package:veripol/components/themes.dart';

class TopicNumberCard extends StatefulWidget {
  const TopicNumberCard({
    Key? key,
    required this.topicData,
  }) : super(key: key);
  final Map<String, dynamic> topicData;
  @override
  State<TopicNumberCard> createState() => _TopicNumberCardState();
}

class _TopicNumberCardState extends State<TopicNumberCard> {
  bool showModules = false;
  List<Widget> modulesCards = [];
  @override
  void initState() {
    buildModules();
    super.initState();
  }

  void buildModules() {
    for (var modules in widget.topicData["modules"]) {
      modulesCards.add(ModuleCard(
        moduleData: modules,
      ));
    }
  }

  void toggleModules() {
    setState(() {
      showModules = !showModules;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textScale = size.width / mockUpWidth;
    return Padding(
      padding: EdgeInsets.only(top: 5 / mockUpHeight * size.height),
      child: SizedBox(
        width: 350 / mockUpWidth * size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 350 / mockUpWidth * size.width,
              height: 100 / mockUpHeight * size.height,
              decoration: BoxDecoration(
                color: const Color(0xff141414),
                borderRadius:
                    BorderRadius.circular(5 / mockUpWidth * size.width),
              ),
              child: Center(
                child: SizedBox(
                  width: 320 / mockUpWidth * size.width,
                  height: 100 / mockUpHeight * size.height,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: 60 / mockUpWidth * size.width,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                          ),
                          Container(
                            width: 55 / mockUpWidth * size.width,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color(0xff141414),
                                width: 4 / mockUpWidth * size.width,
                              ),
                              color: Colors.transparent,
                              shape: BoxShape.circle,
                            ),
                          ),
                          Text(
                            widget.topicData["overall-percentage"].toString() +
                                "%",
                            textAlign: TextAlign.center,
                            textScaleFactor: textScale,
                            style: GoogleFonts.notoSans(
                              textStyle: const TextStyle(
                                fontStyle: FontStyle.normal,
                                fontSize: 10.59,
                                fontWeight: FontWeight.w500,
                                height: 1.43,
                                letterSpacing: 0.08,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 10 / mockUpWidth * size.width,
                      ),
                      SizedBox(
                        width: 200 / mockUpWidth * size.width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "TOPIC " +
                                  widget.topicData["topic-number"].toString(),
                              textScaleFactor: textScale,
                              style: veripolTextStyles.labelSmall.copyWith(
                                color: Colors.white.withOpacity(0.80),
                              ),
                            ),
                            Text(
                              widget.topicData["topic-title"],
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              textScaleFactor: textScale,
                              style: veripolTextStyles.titleLarge.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () => toggleModules(),
                        icon: showModules
                            ? const Icon(Icons.keyboard_arrow_down)
                            : const Icon(Icons.keyboard_arrow_right),
                        iconSize: 30 / mockUpWidth * size.width,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            showModules
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: modulesCards,
                  )
                : SizedBox(
                    height: 5 / mockUpHeight * size.height,
                  ),
          ],
        ),
      ),
    );
  }
}
