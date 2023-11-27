import 'package:flutter/material.dart';

import 'themes.dart';

class AboutCard extends StatelessWidget {
  const AboutCard({
    Key? key,
    required this.about,
  }) : super(key: key);

  final String about;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 345,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            8,
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
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "About the graph",
              textAlign: TextAlign.start,
              style: veripolTextStyles.bodySmall.copyWith(
                color: const Color(0xff575E71),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              about,
              textAlign: TextAlign.justify,
              style: veripolTextStyles.bodyMedium.copyWith(
                color: Colors.black,
              ),
            ),
          ],
        ));
  }
}
