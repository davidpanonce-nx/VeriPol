import 'package:flutter/material.dart';
import 'package:veripol/components/themes.dart';

class ModuleCard extends StatelessWidget {
  const ModuleCard({
    Key? key,
    required this.moduleData,
  }) : super(key: key);

  final Map<String, dynamic> moduleData;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textScale = size.width / mockUpWidth;
    return Container(
      width: 330 / mockUpWidth * size.width,
      height: 60 / mockUpHeight * size.height,
      padding: EdgeInsets.symmetric(
        vertical: 10 / mockUpHeight * size.height,
        horizontal: 10 / mockUpWidth * size.width,
      ),
      margin: EdgeInsets.only(
        top: 5 / mockUpHeight * size.height,
        left: 20 / mockUpWidth * size.width,
      ),
      decoration: BoxDecoration(
        color: const Color(0xff141414),
        borderRadius: BorderRadius.circular(3 / mockUpWidth * size.height),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          moduleData["percentage-completed"] == 100
              ? Image.asset(
                  "assets/done.png",
                  width: 24 / mockUpWidth * size.width,
                )
              : Container(
                  width: 24 / mockUpWidth * size.width,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),
          SizedBox(
            width: 10 / mockUpWidth * size.width,
          ),
          SizedBox(
            width: 276 / mockUpWidth * size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "MODULE " + moduleData["module-number"].toString(),
                  textScaleFactor: textScale,
                  style: veripolTextStyles.labelSmall.copyWith(
                    color: Colors.white,
                  ),
                ),
                Text(
                  moduleData["module-title"],
                  overflow: TextOverflow.ellipsis,
                  textScaleFactor: textScale,
                  style: veripolTextStyles.titleMedium.copyWith(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
