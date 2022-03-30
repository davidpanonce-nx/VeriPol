import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../views/empty_state.dart';
import 'themes.dart';

class MyCandidateAddButton extends StatelessWidget {
  const MyCandidateAddButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final textScale = size.width / mockUpWidth;
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const EmptyState()));
      },
      child: Container(
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
                image: const DecorationImage(
                  image: AssetImage("assets/add_candidate_img.png"),
                  fit: BoxFit.fill,
                ),
              ),
              child: Center(
                child: Icon(
                  Icons.add,
                  size: 60 / mockUpWidth * size.width,
                  color: const Color(0xff141414),
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xff5E5E62),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5 / mockUpWidth * size.width),
                    bottomRight: Radius.circular(5 / mockUpWidth * size.width),
                  ),
                ),
                child: Center(
                  child: Text(
                    "NO CANDIDATE YET,\nADD ONE",
                    textScaleFactor: textScale,
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
      ),
    );
  }
}
