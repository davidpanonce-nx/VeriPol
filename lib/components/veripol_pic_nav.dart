import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VeripolPicNavigationButton extends StatelessWidget {
  const VeripolPicNavigationButton({
    super.key,
    required this.label,
    required this.subLabel,
    required this.imageURL,
    required this.onTap,
  });
  final String label;
  final String subLabel;
  final String imageURL;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 350,
        height: 161,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imageURL),
            fit: BoxFit.fill,
          ),
          borderRadius: BorderRadius.circular(
            9.21,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              spreadRadius: 5.53,
              blurRadius: 11.05,
              offset: const Offset(
                0,
                7.37,
              ),
            ),
            BoxShadow(
              color: Colors.black.withOpacity(0.30),
              spreadRadius: 0,
              blurRadius: 3.68,
              offset: const Offset(
                0,
                3.68,
              ),
            ),
          ],
        ),
        child: Center(
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: "$label\n",
                  style: GoogleFonts.notoSans(
                    textStyle: const TextStyle(
                      fontStyle: FontStyle.normal,
                      fontSize: 20.26,
                      fontWeight: FontWeight.w400,
                      height: 1.27,
                      letterSpacing: 0,
                      color: Colors.white,
                    ),
                  ),
                ),
                TextSpan(
                  text: subLabel,
                  style: GoogleFonts.notoSans(
                    textStyle: const TextStyle(
                      fontStyle: FontStyle.normal,
                      fontSize: 12.9,
                      fontWeight: FontWeight.w500,
                      height: 1.43,
                      letterSpacing: 0.09,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
