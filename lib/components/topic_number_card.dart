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
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: SizedBox(
        width: 350,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 350,
              height: 100,
              decoration: BoxDecoration(
                color: const Color(0xff141414),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child: SizedBox(
                  width: 320,
                  height: 100,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: 60,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                          ),
                          Container(
                            width: 55,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color(0xff141414),
                                width: 4,
                              ),
                              color: Colors.transparent,
                              shape: BoxShape.circle,
                            ),
                          ),
                          Text(
                            "${widget.topicData["overall-percentage"]}%",
                            textAlign: TextAlign.center,
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
                      const SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        width: 200,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "TOPIC ${widget.topicData["topic-number"]}",
                              style: veripolTextStyles.labelSmall.copyWith(
                                color: Colors.white.withOpacity(0.80),
                              ),
                            ),
                            Text(
                              widget.topicData["topic-title"],
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
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
                        iconSize: 30,
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
                : const SizedBox(
                    height: 5,
                  ),
          ],
        ),
      ),
    );
  }
}
