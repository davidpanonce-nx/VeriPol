import 'package:flutter/material.dart';

import '../views/empty_state.dart';
import 'themes.dart';

class FeaturedArticlesCard extends StatelessWidget {
  const FeaturedArticlesCard({
    Key? key,
    required this.size,
    required this.textScale,
  }) : super(key: key);

  final Size size;
  final double textScale;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300 / mockUpWidth * size.width,
      decoration: BoxDecoration(
        color: const Color(0xff141414),
        borderRadius: BorderRadius.circular(10 / mockUpWidth * size.width),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 15 / mockUpWidth * size.width,
        vertical: 14 / mockUpHeight * size.height,
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
                    "NATIONAL POSITIONS IN THE PHILIPPINES",
                    overflow: TextOverflow.ellipsis,
                    textScaleFactor: textScale,
                    style: veripolTextStyles.labelSmall.copyWith(
                      color: Colors.white.withOpacity(0.50),
                    ),
                  ),
                ),
                Text(
                  '10 MINS',
                  textScaleFactor: textScale,
                  style: veripolTextStyles.labelSmall.copyWith(
                    color: Colors.white.withOpacity(0.50),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 257 / mockUpWidth * size.width,
            child: Text(
              "From the Founder: Hello! How is your exHAHAHAHAtension",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textScaleFactor: textScale,
              style: veripolTextStyles.titleLarge.copyWith(
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: 5 / mockUpHeight * size.height,
          ),
          SizedBox(
            width: 257 / mockUpWidth * size.width,
            child: Text(
              "Vulputate rhoncus accumsan vitae vulputate vitae pretium. Ut vitae mollis etiam aliquam ac ullamcorper  accumsan vitae vulputate vitae  accumsan vitae vulputate vitae ",
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              textScaleFactor: textScale,
              style: veripolTextStyles.labelSmall.copyWith(
                color: Colors.white.withOpacity(0.80),
              ),
            ),
          ),
          const Expanded(
            child: SizedBox(),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const EmptyState()));
            },
            style: ElevatedButton.styleFrom(
              primary: veripolColors.sunYellow,
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(3 / mockUpWidth * size.width),
              ),
            ),
            child: SizedBox(
              height: 36 / mockUpHeight * size.height,
              child: Center(
                child: Text(
                  "READ",
                  style: Theme.of(context).textTheme.overline!.copyWith(
                        color: Colors.black,
                      ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
