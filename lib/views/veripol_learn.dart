import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:veripol/components/veripol_pic_nav.dart';
import 'package:veripol/views/empty_state.dart';

import '../components/themes.dart';
import 'articles/veripol_articles.dart';
import 'courses/veripol_courses.dart';

class VeripolLearn extends StatefulWidget {
  const VeripolLearn({
    Key? key,
    required this.size,
    required this.scale,
    required this.textScale,
  }) : super(key: key);

  final Size size;
  final double scale;
  final double textScale;
  @override
  State<VeripolLearn> createState() => _VeripolLearnState();
}

class _VeripolLearnState extends State<VeripolLearn> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size.width,
      height: widget.size.height,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            child: Image.asset(
              "assets/bg_pattern.png",
              scale: widget.scale,
            ),
          ),
          Positioned(
            left: -6 / mockUpWidth * widget.size.width,
            top: 110 / mockUpHeight * widget.size.height,
            child: SizedBox(
              width: 420 / mockUpWidth * widget.size.width,
              child: Text(
                "VOTING IS NOT ONLY OUR RIGHT -IT IS OUR POWER",
                maxLines: 3,
                textAlign: TextAlign.start,
                textScaleFactor: widget.textScale,
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontSize: 43.66,
                    fontWeight: FontWeight.w700,
                    height: 0.80,
                    letterSpacing: 0,
                    color: const Color(0xffF6C15C).withOpacity(0.50),
                  ),
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                top: 45 / mockUpHeight * widget.size.height,
                bottom: 60 / mockUpHeight * widget.size.height,
              ),
              child: SizedBox(
                width: widget.size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 375 / mockUpWidth * widget.size.width,
                      height: 64 / mockUpHeight * widget.size.height,
                      child: Center(
                        child: Text(
                          "Learn",
                          textScaleFactor: widget.textScale,
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
                      ),
                    ),
                    SizedBox(
                      height: 14 / mockUpHeight * widget.size.height,
                    ),
                    VeripolPicNavigationButton(
                      label: "Courses",
                      subLabel: "MAYORS AND COUNCILORS",
                      imageURL: "assets/courses_bg.png",
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const VeripolCourses(),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20 / mockUpHeight * widget.size.height,
                    ),
                    VeripolPicNavigationButton(
                      label: "State of the Nation",
                      subLabel: "PRESIDENTS TO SENATORS",
                      imageURL: "assets/station_bg.png",
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const EmptyState()));
                      },
                    ),
                    SizedBox(
                      height: 20 / mockUpHeight * widget.size.height,
                    ),
                    VeripolPicNavigationButton(
                      label: "Articles",
                      subLabel: "MAYORS AND COUNCILORS",
                      imageURL: "assets/articles_bg.png",
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const VeripolArticles(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
