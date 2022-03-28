import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:veripol/components/themes.dart';

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
    final size = MediaQuery.of(context).size;
    final scale = mockUpWidth / size.width;
    final textScale = size.width / mockUpWidth;
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 350 / mockUpWidth * size.width,
        height: 161.2 / mockUpHeight * size.height,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(9.21 / mockUpWidth * size.width),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.30),
              offset: Offset(0, 1 / mockUpHeight * size.height),
              blurRadius: 2.0 / mockUpWidth * size.width,
              spreadRadius: 0,
            ),
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              offset: Offset(0, 1 / mockUpHeight * size.height),
              blurRadius: 3.0 / mockUpWidth * size.width,
              spreadRadius: 1.0 / mockUpWidth * size.width,
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
                scale: scale,
              ),
            ),
            Text(
              type,
              textScaleFactor: textScale,
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
