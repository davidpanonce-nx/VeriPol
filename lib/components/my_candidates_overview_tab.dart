import 'package:flutter/material.dart';

import 'themes.dart';

class MyCandidatesOverviewTab extends StatelessWidget {
  const MyCandidatesOverviewTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final textScale = size.width / mockUpWidth;
    return ListView(
      padding: EdgeInsets.symmetric(
        vertical: 20 / mockUpHeight * size.height,
      ),
      children: [
        Container(
          width: size.width,
          margin:
              EdgeInsets.symmetric(horizontal: 10 / mockUpWidth * size.width),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Overview",
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
        Container(
          width: 345 / mockUpWidth * size.width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(
              8 / mockUpWidth * size.width,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.30),
                spreadRadius: 0,
                blurRadius: 2 / mockUpWidth * size.width,
                offset: Offset(0, 1 / mockUpHeight * size.height),
              ),
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
                spreadRadius: 1 / mockUpWidth * size.width,
                blurRadius: 3 / mockUpWidth * size.width,
                offset: Offset(
                  0,
                  1 / mockUpHeight * size.height,
                ),
              ),
            ],
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 15 / mockUpWidth * size.width,
            vertical: 15 / mockUpHeight * size.height,
          ),
          margin: EdgeInsets.symmetric(
            horizontal: 15 / mockUpWidth * size.width,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Your Total Number of Candidates",
                style: veripolTextStyles.titleSmall.copyWith(
                  color: Colors.black,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 15 / mockUpHeight * size.height,
                  left: 10 / mockUpWidth * size.width,
                  right: 10 / mockUpWidth * size.width,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "For May 2022 Elections",
                      style: veripolTextStyles.bodySmall.copyWith(
                        color: const Color(0xff575E71),
                      ),
                    ),
                    SizedBox(
                      height: 5 / mockUpHeight * size.height,
                    ),
                    Row(
                      children: [
                        Text(
                          "20",
                          style: veripolTextStyles.titleLarge.copyWith(
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          width: 5 / mockUpWidth * size.width,
                        ),
                        Text(
                          "out of 30 total candidates",
                          style: veripolTextStyles.labelLarge.copyWith(
                            color: const Color(0xff575E71),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20 / mockUpHeight * size.height,
                    ),
                    Divider(
                      height: 20 / mockUpHeight * size.height,
                      thickness: 1 / mockUpHeight * size.height,
                      color: Colors.black.withOpacity(0.20),
                    ),
                    SizedBox(
                      height: 20 / mockUpHeight * size.height,
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "National",
                              style: veripolTextStyles.bodySmall.copyWith(
                                color: const Color(0xff575E71),
                              ),
                            ),
                            SizedBox(
                              height: 5 / mockUpHeight * size.height,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "10",
                                  style: veripolTextStyles.titleLarge
                                      .copyWith(color: Colors.black),
                                ),
                                SizedBox(
                                  width: 5 / mockUpWidth * size.width,
                                ),
                                Text(
                                  "/ 16",
                                  style: veripolTextStyles.labelLarge.copyWith(
                                    color: const Color(0xff575E71),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 45.67 / mockUpWidth * size.width,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Provincial",
                              style: veripolTextStyles.bodySmall.copyWith(
                                color: const Color(0xff575E71),
                              ),
                            ),
                            SizedBox(
                              height: 5 / mockUpHeight * size.height,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "4",
                                  style: veripolTextStyles.titleLarge
                                      .copyWith(color: Colors.black),
                                ),
                                SizedBox(
                                  width: 5 / mockUpWidth * size.width,
                                ),
                                Text(
                                  "/ 4",
                                  style: veripolTextStyles.labelLarge.copyWith(
                                    color: const Color(0xff575E71),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 43.67 / mockUpWidth * size.width,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Municipal",
                              style: veripolTextStyles.bodySmall.copyWith(
                                color: const Color(0xff575E71),
                              ),
                            ),
                            SizedBox(
                              height: 5 / mockUpHeight * size.height,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "4",
                                  style: veripolTextStyles.titleLarge
                                      .copyWith(color: Colors.black),
                                ),
                                SizedBox(
                                  width: 5 / mockUpWidth * size.width,
                                ),
                                Text(
                                  "/ 12",
                                  style: veripolTextStyles.labelLarge.copyWith(
                                    color: const Color(0xff575E71),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
