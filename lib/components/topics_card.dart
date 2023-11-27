import 'package:flutter/material.dart';

import '../views/empty_state.dart';
import 'themes.dart';

class TopicsCard extends StatelessWidget {
  const TopicsCard({
    Key? key,
    required this.size,
    required this.data,
  }) : super(key: key);
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
                    "COURSE ${data["course-number"]}",
                    overflow: TextOverflow.ellipsis,
                    style: veripolTextStyles.labelSmall.copyWith(
                      color: Colors.white.withOpacity(0.50),
                    ),
                  ),
                ),
                Text(
                  "${data["percentage-completed"]}% COMPLETED",
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
              data["topic-title"],
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
              data["description"],
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
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const EmptyState()));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xff1571F2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(3),
              ),
            ),
            child: SizedBox(
              height: 36,
              child: Center(
                child: Text(
                  "START",
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        color: Colors.white,
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
