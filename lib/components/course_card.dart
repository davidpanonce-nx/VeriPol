import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:veripol/components/themes.dart';
import 'package:veripol/views/courses/veripol_topics.dart';

class CourseCard extends StatelessWidget {
  const CourseCard({
    Key? key,
    required this.size,
    required this.textScale,
    required this.couresLabel,
    required this.percentageCompleted,
    required this.courseTitle,
    required this.courseDescription,
  }) : super(key: key);

  final Size size;
  final double textScale;
  final String couresLabel;
  final double percentageCompleted;
  final String courseTitle;
  final String courseDescription;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350 / mockUpWidth * size.width,
      height: 210 / mockUpHeight * size.height,
      decoration: BoxDecoration(
        color: const Color(0xff141414),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 15 / mockUpWidth * size.width,
        vertical: 15 / mockUpHeight * size.height,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 150 / mockUpWidth * size.width,
                  child: Text(
                    couresLabel,
                    overflow: TextOverflow.ellipsis,
                    textScaleFactor: textScale,
                    style: GoogleFonts.inter(
                      textStyle: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontSize: 9,
                        fontWeight: FontWeight.w500,
                        height: 1.78,
                        letterSpacing: 0.5,
                        color: Colors.white.withOpacity(0.50),
                      ),
                    ),
                  ),
                ),
                Text(
                  percentageCompleted.toString() + '% COMPLETED',
                  textScaleFactor: textScale,
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontSize: 9,
                      fontWeight: FontWeight.w500,
                      height: 1.78,
                      letterSpacing: 0.5,
                      color: Colors.white.withOpacity(0.50),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 319 / mockUpWidth * size.width,
            child: Text(
              courseTitle,
              overflow: TextOverflow.ellipsis,
              textScaleFactor: textScale,
              style: GoogleFonts.notoSans(
                textStyle: const TextStyle(
                  fontStyle: FontStyle.normal,
                  fontSize: 22,
                  fontWeight: FontWeight.w400,
                  height: 1.27,
                  letterSpacing: 0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 5 / mockUpHeight * size.height,
          ),
          SizedBox(
            width: 319 / mockUpWidth * size.width,
            child: Text(
              courseDescription,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
              textScaleFactor: textScale,
              style: GoogleFonts.inter(
                textStyle: TextStyle(
                  fontStyle: FontStyle.normal,
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  height: 1.45,
                  letterSpacing: 0.5,
                  color: Colors.white.withOpacity(0.80),
                ),
              ),
            ),
          ),
          const Expanded(
            child: SizedBox(),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const VeripolTopics(),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              primary: const Color(0xff1571F2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(3),
              ),
            ),
            child: SizedBox(
              height: 36 / mockUpHeight * size.height,
              child: Center(
                child: Text(
                  "START COURSE",
                  style: GoogleFonts.notoSans(
                    textStyle: const TextStyle(
                      fontStyle: FontStyle.normal,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      height: 1.33,
                      letterSpacing: 0.5,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
