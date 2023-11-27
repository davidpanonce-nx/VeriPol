import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CandidateTypeCardNavigationButton extends StatelessWidget {
  const CandidateTypeCardNavigationButton({
    Key? key,
    required this.type,
    required this.imageURL,
    required this.bgColor,
    required this.imageSize,
    required this.imageLeftOffset,
    required this.imageTopOffset,
    required this.onTap,
  }) : super(key: key);

  final String type;
  final String imageURL;
  final Color bgColor;
  final Size imageSize;
  final double imageTopOffset;
  final double imageLeftOffset;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 350,
        height: 161.2,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(9.21),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.30),
              offset: const Offset(0, 1),
              blurRadius: 2.0,
              spreadRadius: 0,
            ),
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              offset: const Offset(0, 1),
              blurRadius: 3.0,
              spreadRadius: 1.0,
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: imageTopOffset,
              left: imageLeftOffset,
              width: imageSize.width,
              height: imageSize.height,
              child: Image.asset(
                imageURL,
              ),
            ),
            Text(
              type,
              textAlign: TextAlign.center,
              style: GoogleFonts.notoSans(
                textStyle: const TextStyle(
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w700,
                  fontSize: 20.26,
                  height: 1.27,
                  letterSpacing: 4,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
