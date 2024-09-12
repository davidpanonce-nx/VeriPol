import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:veripol/views/empty_state.dart';

class CourseCard extends StatelessWidget {
  const CourseCard({super.key, required this.size, required this.data});

  final Size size;
  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 210,
      decoration: BoxDecoration(
        color: const Color(0xff141414),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 150,
                  child: Text(
                    "COURSE ${data["course-number"]}",
                    overflow: TextOverflow.ellipsis,
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
                  '${data["percentage-completed"]}% COMPLETED',
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
            width: 319,
            child: Text(
              data["topic-title"],
              overflow: TextOverflow.ellipsis,
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
          const SizedBox(height: 5),
          SizedBox(
            width: 319,
            child: Text(
              data["description"],
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
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
                  builder: (context) => const EmptyState(),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xff1571F2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(3),
              ),
            ),
            child: SizedBox(
              height: 36,
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
