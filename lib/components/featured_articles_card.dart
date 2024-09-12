import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'themes.dart';

class FeaturedArticlesCard extends StatelessWidget {
  const FeaturedArticlesCard({
    super.key,
    required this.size,
    required this.data,
  });

  final Size size;
  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
        color: const Color(0xff141414),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 14,
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
                    data["header"],
                    overflow: TextOverflow.ellipsis,
                    style: veripolTextStyles.labelSmall.copyWith(
                      color: Colors.white.withOpacity(0.50),
                    ),
                  ),
                ),
                Text(
                  '${data["article-length-time"]} MINS',
                  style: veripolTextStyles.labelSmall.copyWith(
                    color: Colors.white.withOpacity(0.50),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 257,
            child: Text(
              data["article-title"],
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: veripolTextStyles.titleLarge.copyWith(
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          SizedBox(
            width: 257,
            child: Text(
              data["article-description"],
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: veripolTextStyles.labelSmall.copyWith(
                color: Colors.white.withOpacity(0.80),
              ),
            ),
          ),
          const Expanded(
            child: SizedBox(),
          ),
          ElevatedButton(
            onPressed: () async {
              final url = data["link"].toString();

              if (await canLaunch(url)) {
                await launch(url);
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: veripolColors.sunYellow,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(3),
              ),
            ),
            child: SizedBox(
              height: 36,
              child: Center(
                child: Text(
                  "READ",
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
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
