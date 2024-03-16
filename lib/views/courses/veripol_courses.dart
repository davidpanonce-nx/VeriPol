import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:veripol/components/course_card.dart';
import 'package:veripol/components/dummy_data.dart';

class VeripolCourses extends StatefulWidget {
  const VeripolCourses({Key? key}) : super(key: key);

  @override
  State<VeripolCourses> createState() => _VeripolCoursesState();
}

class _VeripolCoursesState extends State<VeripolCourses> {
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
                            "Courses",
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
                    Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 13,
                        ),
                        itemCount: DummyData().topicCardData.length,
                        itemBuilder: (BuildContext context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: CourseCard(
                              size: size,
                              data: DummyData().topicCardData[index],
                            ),
                          );
                        },
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
