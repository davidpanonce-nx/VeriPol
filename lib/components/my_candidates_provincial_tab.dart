import 'package:flutter/material.dart';

import 'my_candidate_add_button.dart';
import 'themes.dart';

class MyCandidatesProvincialTab extends StatelessWidget {
  const MyCandidatesProvincialTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final textScale = size.width / mockUpWidth;
    return ListView(
      padding: EdgeInsets.symmetric(
        vertical: 20 / mockUpHeight * size.height,
        horizontal: 10 / mockUpWidth * size.width,
      ),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Governor",
                  textScaleFactor: textScale,
                  style: veripolTextStyles.labelLarge.copyWith(
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 10 / mockUpHeight * size.height,
                ),
                InkWell(
                  onTap: () {},
                  child: const MyCandidateAddButton(),
                ),
              ],
            ),
            SizedBox(
              width: 15 / mockUpWidth * size.width,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Vice Governor",
                  textScaleFactor: textScale,
                  style: veripolTextStyles.labelLarge.copyWith(
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 10 / mockUpHeight * size.height,
                ),
                InkWell(
                  onTap: () {},
                  child: const MyCandidateAddButton(),
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 20 / mockUpHeight * size.height,
        ),
        SizedBox(
          width: size.width,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Provincial Board",
                textScaleFactor: textScale,
                style: veripolTextStyles.labelLarge.copyWith(
                  color: Colors.black,
                ),
              ),
              SizedBox(
                width: 5 / mockUpWidth * size.width,
              ),
              Expanded(
                child: Divider(
                  height: 20 / mockUpHeight * size.height,
                  thickness: 1 / mockUpHeight * size.height,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10 / mockUpHeight * size.height,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {},
              child: const MyCandidateAddButton(),
            ),
            SizedBox(width: 15 / mockUpWidth * size.width),
            InkWell(
              onTap: () {},
              child: const MyCandidateAddButton(),
            ),
          ],
        ),
      ],
    );
  }
}
