import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import 'themes.dart';

class ArticlesCard extends StatelessWidget {
  const ArticlesCard({
    super.key,
    required this.data,
  });

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
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 15,
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
                  width: 150,
                  child: Text(
                    data["header"],
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
                  "${data["article-length-time"]} MINS",
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
              data["article-title"],
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
          const SizedBox(
            height: 5,
          ),
          SizedBox(
            width: 319,
            child: Text(
              data["article-description"],
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
            onPressed: () async {
              final url = data["link"].toString();

              if (await canLaunch(url)) {
                await launch(url);
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: veripolColors.sunYellow,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(3),
              ),
            ),
            child: SizedBox(
              height: 36,
              child: Center(
                child: Text(
                  "READ ARTICLE",
                  style: GoogleFonts.notoSans(
                    textStyle: const TextStyle(
                      fontStyle: FontStyle.normal,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      height: 1.33,
                      letterSpacing: 0.5,
                      color: Colors.black,
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
