import 'package:flutter/material.dart';

import 'themes.dart';

class TestModuleLastAttempt extends StatelessWidget {
  const TestModuleLastAttempt({super.key, required this.latestScore, required this.itemCount});
  final int? latestScore;
  final int? itemCount;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 103,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 1),
            blurRadius: 2,
            color: Colors.black.withOpacity(0.3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Last Attempt',
            style: veripolTextStyles.titleSmall,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Score',
                      style: veripolTextStyles.bodySmall.copyWith(
                        color: const Color(0xFF575E71),
                      ),
                    ),
                    Text(
                      latestScore == null ? '-' : latestScore.toString(),
                      style: veripolTextStyles.bodyMedium,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Grade Percent',
                      style: veripolTextStyles.bodySmall.copyWith(
                        color: const Color(0xFF575E71),
                      ),
                    ),
                    Text(
                      itemCount == null || latestScore == null ? '-' : "${(latestScore! / itemCount! * 100.0)} %",
                      style: veripolTextStyles.bodyMedium,
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
