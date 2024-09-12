import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:veripol/components/veripol_pic_nav.dart';
import 'package:veripol/views/empty_state.dart';

import 'articles/veripol_articles.dart';
import 'courses/veripol_courses.dart';

class VeripolLearn extends StatefulWidget {
  const VeripolLearn({super.key});

  @override
  State<VeripolLearn> createState() => _VeripolLearnState();
}

class _VeripolLearnState extends State<VeripolLearn> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
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
          Positioned(
            left: -6,
            top: 110,
            child: SizedBox(
              width: 420,
              child: Text(
                "VOTING IS NOT ONLY OUR RIGHT -IT IS OUR POWER",
                maxLines: 3,
                textAlign: TextAlign.start,
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
              padding: const EdgeInsets.only(top: 45, bottom: 60),
              child: SizedBox(
                width: size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 375,
                      height: 64,
                      child: Center(
                        child: Text(
                          "Learn",
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
                    const SizedBox(height: 14),
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
                    const SizedBox(height: 20),
                    VeripolPicNavigationButton(
                      label: "State of the Nation",
                      subLabel: "PRESIDENTS TO SENATORS",
                      imageURL: "assets/station_bg.png",
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const EmptyState()));
                      },
                    ),
                    const SizedBox(height: 20),
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
