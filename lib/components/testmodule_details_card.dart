import 'package:flutter/material.dart';

import 'themes.dart';

class TestModuleDetails extends StatelessWidget {
  const TestModuleDetails({super.key, required this.itemCount, required this.passingGrade});
  final int itemCount;
  final double passingGrade;
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
            'Details',
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
                      'Questions',
                      style: veripolTextStyles.bodySmall.copyWith(
                        color: const Color(0xFF575E71),
                      ),
                    ),
                    Text(
                      itemCount.toString(),
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
                      'Passing Grade',
                      style: veripolTextStyles.bodySmall.copyWith(
                        color: const Color(0xFF575E71),
                      ),
                    ),
                    Text(
                      "$passingGrade %",
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
