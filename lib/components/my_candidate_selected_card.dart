import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:veripol/models/models.dart';

import 'themes.dart';

class MyCandidateSelectedCandidate extends StatelessWidget {
  const MyCandidateSelectedCandidate({
    Key? key,
    required this.data,
  }) : super(key: key);

  final CandidateData data;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textScale = size.width / mockUpWidth;
    return Container(
      height: 251 / mockUpHeight * size.height,
      width: 160 / mockUpWidth * size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          5 / mockUpWidth * size.width,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.30),
            spreadRadius: 0,
            blurRadius: 2 / mockUpWidth * size.width,
            offset: Offset(0, 1 / mockUpHeight * size.height),
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            spreadRadius: 1 / mockUpWidth * size.width,
            blurRadius: 3 / mockUpWidth * size.width,
            offset: Offset(
              0,
              1 / mockUpHeight * size.height,
            ),
          ),
        ],
      ),
      // clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          Container(
            height: 160 / mockUpWidth * size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5 / mockUpWidth * size.width),
                topRight: Radius.circular(5 / mockUpWidth * size.width),
              ),
              image: DecorationImage(
                image: AssetImage(
                  data.imgURL != ""
                      ? data.imgURL
                      : "assets/my_candidates_selected.png",
                ),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 10 / mockUpWidth * size.width,
                vertical: 7 / mockUpHeight * size.height,
              ),
              width: 160 / mockUpWidth * size.width,
              decoration: BoxDecoration(
                color: const Color(0xff141414),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(5 / mockUpWidth * size.width),
                  bottomRight: Radius.circular(5 / mockUpWidth * size.width),
                ),
              ),
              child: data.filedCandidacies["May 9, 2022"]["position"] ==
                      "PARTY LIST"
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "#" +
                              data.filedCandidacies["May 9, 2022"]
                                      ["ballot_number"]
                                  .toString(),
                          textScaleFactor: textScale,
                          style: veripolTextStyles.labelSmall.copyWith(
                            color: Colors.white.withOpacity(0.50),
                          ),
                        ),
                        Text(
                          data.filedCandidacies["May 9, 2022"]
                              ["political_party"],
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          textScaleFactor: textScale,
                          style: veripolTextStyles.titleSmall
                              .copyWith(color: Colors.white),
                        ),
                      ],
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "#" +
                              data.filedCandidacies["May 9, 2022"]
                                      ["ballot_number"]
                                  .toString(),
                          textScaleFactor: textScale,
                          style: veripolTextStyles.labelSmall.copyWith(
                            color: Colors.white.withOpacity(0.50),
                          ),
                        ),
                        Text(
                          data.name.split(",").first + ",",
                          textScaleFactor: textScale,
                          style: GoogleFonts.notoSans(
                            textStyle: const TextStyle(
                              fontStyle: FontStyle.normal,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              height: 1.43,
                              letterSpacing: 0.1,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Text(
                          data.name.split(",").last.trimLeft(),
                          textScaleFactor: textScale,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.notoSans(
                            textStyle: const TextStyle(
                              fontStyle: FontStyle.normal,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              height: 1.43,
                              letterSpacing: 0.1,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5 / mockUpHeight * size.height,
                        ),
                        Text(
                          "(" +
                              data.filedCandidacies["May 9, 2022"]
                                  ["political_party"] +
                              ")",
                          overflow: TextOverflow.ellipsis,
                          textScaleFactor: textScale,
                          style: veripolTextStyles.labelSmall.copyWith(
                            color: Colors.white.withOpacity(0.50),
                          ),
                        ),
                      ],
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
