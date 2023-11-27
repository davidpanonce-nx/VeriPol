import 'package:flutter/material.dart';

import '../views/empty_state.dart';
import 'themes.dart';

class ContinueWhereYouLeftOff extends StatelessWidget {
  const ContinueWhereYouLeftOff({
    Key? key,
    required this.size,
    required this.textScale,
    required this.data,
  }) : super(key: key);
  final Size size;
  final double textScale;
  final Map<String, dynamic> data;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 300,
          height: 160,
          decoration: BoxDecoration(
            color: const Color(0xff141414),
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 19,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 150,
                      child: Text(
                        data["header"].toString().toUpperCase(),
                        overflow: TextOverflow.ellipsis,
                        style: veripolTextStyles.labelSmall.copyWith(
                          color: Colors.white.withOpacity(0.50),
                        ),
                      ),
                    ),
                    Text(
                      "LESSON ${data["current-lesson-number"]} OF ${data["lesson-length"]}",
                      style: veripolTextStyles.labelSmall.copyWith(
                        color: Colors.white.withOpacity(0.50),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              SizedBox(
                width: 234,
                child: Text(
                  data["title"],
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: veripolTextStyles.titleLarge.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          right: 18,
          bottom: 25,
          child: GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const EmptyState()));
            },
            child: const Icon(
              Icons.arrow_forward,
              color: Colors.white,
              size: 40,
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          child: SizedBox(
            width: 300,
            height: 10,
            child: Stack(
              children: [
                Container(
                  width: 300,
                  height: 10,
                  decoration: const BoxDecoration(
                    color: Color(0xff24254A),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  child: Container(
                    width: 210,
                    height: 10,
                    decoration: const BoxDecoration(
                      color: Color(0xff343780),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(4),
                        bottomLeft: Radius.circular(10),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
