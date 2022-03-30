import 'package:flutter/material.dart';

import '../views/empty_state.dart';
import 'themes.dart';

class ContinueWhereYouLeftOff extends StatelessWidget {
  const ContinueWhereYouLeftOff({
    Key? key,
    required this.size,
    required this.textScale,
  }) : super(key: key);
  final Size size;
  final double textScale;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 300 / mockUpWidth * size.width,
          height: 160 / mockUpHeight * size.height,
          decoration: BoxDecoration(
            color: const Color(0xff141414),
            borderRadius: BorderRadius.circular(10 / mockUpWidth * size.width),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 18 / mockUpWidth * size.width,
            vertical: 19 / mockUpHeight * size.height,
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
                      width: 150 / mockUpWidth * size.width,
                      child: Text(
                        "ESSENTIALS",
                        overflow: TextOverflow.ellipsis,
                        textScaleFactor: textScale,
                        style: veripolTextStyles.labelSmall.copyWith(
                          color: Colors.white.withOpacity(0.50),
                        ),
                      ),
                    ),
                    Text(
                      'LESSON 2 OF 6',
                      textScaleFactor: textScale,
                      style: veripolTextStyles.labelSmall.copyWith(
                        color: Colors.white.withOpacity(0.50),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 4 / mockUpHeight * size.height,
              ),
              SizedBox(
                width: 234 / mockUpWidth * size.width,
                child: Text(
                  "Voters Education 101: Huwag Mag pa Copya",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textScaleFactor: textScale,
                  style: veripolTextStyles.titleLarge.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          right: 18 / mockUpWidth * size.width,
          bottom: 25 / mockUpHeight * size.height,
          child: GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const EmptyState()));
            },
            child: Icon(
              Icons.arrow_forward,
              color: Colors.white,
              size: 40 / mockUpWidth * size.width,
            ),
          ),
        ),
        Positioned(
          bottom: 0 / mockUpHeight * size.height,
          child: SizedBox(
            width: 300 / mockUpWidth * size.width,
            height: 10 / mockUpHeight * size.height,
            child: Stack(
              children: [
                Container(
                  width: 300 / mockUpWidth * size.width,
                  height: 10 / mockUpHeight * size.height,
                  decoration: BoxDecoration(
                    color: const Color(0xff24254A),
                    borderRadius: BorderRadius.only(
                      bottomLeft:
                          Radius.circular(10 / mockUpWidth * size.width),
                      bottomRight:
                          Radius.circular(10 / mockUpWidth * size.width),
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  child: Container(
                    width: 210 / mockUpWidth * size.width,
                    height: 10 / mockUpHeight * size.height,
                    decoration: BoxDecoration(
                      color: const Color(0xff343780),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(4 / mockUpWidth * size.width),
                        bottomLeft:
                            Radius.circular(10 / mockUpWidth * size.width),
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
