import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import 'themes.dart';

class ArticlesCard extends StatelessWidget {
  const ArticlesCard({
    Key? key,
    required this.size,
    required this.textScale,
    required this.data,
  }) : super(key: key);

  final Size size;
  final double textScale;
  final Map<String, dynamic> data;
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
                    data["header"],
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
                  "${data["article-length-time"]} MINS",
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
              data["article-title"],
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
              data["article-description"],
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
            onPressed: () async {
              String url = data["link"];

              if (await canLaunch(url)) {
                await launch(url, forceWebView: false, enableJavaScript: true);
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: veripolColors.sunYellow,
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
