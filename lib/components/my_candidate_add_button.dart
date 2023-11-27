import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyCandidateAddButton extends StatelessWidget {
  const MyCandidateAddButton({Key? key}) : super(key: key);

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
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5),
                topRight: Radius.circular(5),
              ),
              image: DecorationImage(
                image: AssetImage("assets/add_candidate_img.png"),
                fit: BoxFit.fill,
              ),
            ),
            child: const Center(
              child: Icon(
                Icons.add,
                size: 60,
                color: Color(0xff141414),
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xff5E5E62),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(5),
                  bottomRight: Radius.circular(5),
                ),
              ),
              child: Center(
                child: Text(
                  "NO CANDIDATE YET,\nADD ONE",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.notoSans(
                    textStyle: const TextStyle(
                      fontStyle: FontStyle.normal,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      height: 1.43,
                      letterSpacing: 0.1,
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
