import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:veripol/models/models.dart';

import 'themes.dart';

class MyCandidateSelectedCandidate extends StatelessWidget {
  const MyCandidateSelectedCandidate({
    super.key,
    required this.data,
  });

  final CandidateData data;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 251,
      width: 160,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.30),
            spreadRadius: 0,
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(
              0,
              1,
            ),
          ),
        ],
      ),
      // clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          Container(
            height: 160,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(5),
                topRight: Radius.circular(5),
              ),
              image: DecorationImage(
                image: AssetImage(
                  data.imgURL != "" ? data.imgURL : "assets/my_candidates_selected.png",
                ),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 7,
              ),
              width: 160,
              decoration: const BoxDecoration(
                color: Color(0xff141414),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(5),
                  bottomRight: Radius.circular(5),
                ),
              ),
              child: data.filedCandidacies["May 9, 2022"]["position"] == "PARTY LIST"
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "#${data.filedCandidacies["May 9, 2022"]["ballot_number"]}",
                          style: veripolTextStyles.labelSmall.copyWith(
                            color: Colors.white.withOpacity(0.50),
                          ),
                        ),
                        Text(
                          data.filedCandidacies["May 9, 2022"]["political_party"],
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: veripolTextStyles.titleSmall.copyWith(color: Colors.white),
                        ),
                      ],
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "#${data.filedCandidacies["May 9, 2022"]["ballot_number"]}",
                          style: veripolTextStyles.labelSmall.copyWith(
                            color: Colors.white.withOpacity(0.50),
                          ),
                        ),
                        Text(
                          "${data.name.split(",").first},",
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
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "(${data.filedCandidacies["May 9, 2022"]["political_party"]})",
                          overflow: TextOverflow.ellipsis,
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
