import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../views/empty_state.dart';
import 'themes.dart';

class ArticlesCard extends StatelessWidget {
  const ArticlesCard({
    Key? key,
    required this.size,
    required this.textScale,
    required this.articleLabel,
    required this.percentageCompleted,
    required this.articleTitle,
    required this.articleDescription,
  }) : super(key: key);

  final Size size;
  final double textScale;
  final String articleLabel;
  final double percentageCompleted;
  final String articleTitle;
  final String articleDescription;
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
                    articleLabel,
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
              articleTitle,
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
              articleDescription,
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
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const EmptyState()));
            },
            style: ElevatedButton.styleFrom(
              primary: veripolColors.sunYellow,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(3),
              ),
            ),
            child: SizedBox(
              height: 36 / mockUpHeight * size.height,
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
