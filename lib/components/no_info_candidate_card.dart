import 'package:flutter/material.dart';

import 'themes.dart';

class NoInformationCandidateCard extends StatelessWidget {
  const NoInformationCandidateCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      decoration: BoxDecoration(
        color: const Color(0xff141414),
        borderRadius: BorderRadius.circular(5),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 10,
      ),
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage("assets/default_img.png"),
              ),
              borderRadius: BorderRadius.circular(7),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Coming Soon",
                style: veripolTextStyles.titleMedium.copyWith(
                  color: Colors.white,
                ),
              ),
              Text(
                "No information available yet",
                style: veripolTextStyles.labelMedium.copyWith(
                  color: Colors.white.withOpacity(0.50),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
