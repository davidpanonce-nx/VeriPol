import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:veripol/charts/chart_card_details.dart';

import '../components/themes.dart';
import '../models/models.dart';

class ChartDetails extends StatefulWidget {
  const ChartDetails({
    required this.city,
    required this.lastName,
    required this.pillar,
    required this.pillarDescription,
    required this.bgImageUrl,
    required this.bgImageOffset,
    required this.bgImageSize,
    required this.data,
    Key? key,
  }) : super(key: key);

  final String city;
  final String lastName;
  final String pillar;
  final String pillarDescription;
  final String bgImageUrl;
  final Offset bgImageOffset;
  final Size bgImageSize;
  final List<ChartData> data;
  @override
  State<ChartDetails> createState() => _ChartDetailsState();
}

class _ChartDetailsState extends State<ChartDetails> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final scale = mockUpWidth / size.width;
    final textScale = size.width / mockUpWidth;
    return Scaffold(
      backgroundColor: veripolColors.background,
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Positioned(
              top: 86 / mockUpHeight * size.height,
              child: Image.asset(
                "assets/bg_pattern.png",
                scale: scale,
              ),
            ),
            SingleChildScrollView(
              child: Container(
                width: size.width,
                height: size.height,
                padding: EdgeInsets.only(
                  top: 48 / mockUpHeight * size.height,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 375 / mockUpWidth * size.width,
                      height: 56 / mockUpHeight * size.height,
                      padding: EdgeInsets.only(
                        top: 12 / mockUpHeight * size.height,
                        left: 16 / mockUpWidth * size.width,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: const Icon(Icons.arrow_back),
                            iconSize: 30 / mockUpWidth * size.width,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 32 / mockUpWidth * size.width,
                          ),
                          Text(
                            "Details",
                            textScaleFactor: textScale,
                            style: GoogleFonts.inter(
                              textStyle: const TextStyle(
                                fontStyle: FontStyle.normal,
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                                height: 1.27,
                                letterSpacing: 0,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          const Expanded(child: SizedBox()),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: size.width,
                      height: size.height - 104 / mockUpHeight * size.height,
                      child: ListView(
                        padding: EdgeInsets.zero,
                        children: [
                          Container(
                            width: size.width,
                            decoration:
                                BoxDecoration(color: veripolColors.nightSky),
                            child: Stack(
                              children: [
                                Positioned(
                                  top: widget.bgImageOffset.dy,
                                  left: widget.bgImageOffset.dx,
                                  width: widget.bgImageSize.width,
                                  height: widget.bgImageSize.height,
                                  child: Image.asset(
                                    widget.bgImageUrl,
                                    scale: scale,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 20 / mockUpWidth * size.width,
                                    vertical: 20 / mockUpHeight * size.height,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        widget.city,
                                        textScaleFactor: textScale,
                                        style: veripolTextStyles.headlineMedium
                                            .copyWith(color: Colors.white),
                                      ),
                                      SizedBox(
                                          height:
                                              5 / mockUpHeight * size.height),
                                      Text(
                                        widget.pillar,
                                        textScaleFactor: textScale,
                                        style: veripolTextStyles.titleSmall
                                            .copyWith(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20 / mockUpHeight * size.height,
                          ),
                          Container(
                            width: size.width,
                            margin: EdgeInsets.symmetric(
                                horizontal: 10 / mockUpWidth * size.width),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Graph",
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
                          ChartCardDetials(
                            chartData: widget.data,
                            pillar: widget.pillar,
                            lastName: widget.lastName,
                          ),
                          SizedBox(
                            height: 20 / mockUpHeight * size.height,
                          ),
                          Container(
                            width: size.width,
                            margin: EdgeInsets.symmetric(
                                horizontal: 10 / mockUpWidth * size.width),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Description",
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
                                  offset:
                                      Offset(0, 1 / mockUpHeight * size.height),
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
                              horizontal: 20 / mockUpWidth * size.width,
                              vertical: 20 / mockUpHeight * size.height,
                            ),
                            margin: EdgeInsets.symmetric(
                              horizontal: 15 / mockUpWidth * size.width,
                            ),
                            child: Text(
                              widget.pillarDescription,
                              textScaleFactor: textScale,
                              textAlign: TextAlign.justify,
                              style: veripolTextStyles.bodyMedium.copyWith(
                                color: Colors.black,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20 / mockUpHeight * size.height,
                          ),
                          Container(
                            width: size.width,
                            margin: EdgeInsets.symmetric(
                                horizontal: 10 / mockUpWidth * size.width),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Source",
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
                                  offset:
                                      Offset(0, 1 / mockUpHeight * size.height),
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
                              horizontal: 20 / mockUpWidth * size.width,
                              vertical: 20 / mockUpHeight * size.height,
                            ),
                            margin: EdgeInsets.symmetric(
                              horizontal: 15 / mockUpWidth * size.width,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                  textScaleFactor: textScale,
                                  textAlign: TextAlign.justify,
                                  text: TextSpan(
                                    style:
                                        veripolTextStyles.bodyMedium.copyWith(
                                      color: Colors.black,
                                    ),
                                    children: [
                                      const TextSpan(text: "Data taken from"),
                                      TextSpan(
                                        text:
                                            " Cities and Municipalities Competitive Index - Department of Trade and Industries",
                                        style: veripolTextStyles.bodyMedium
                                            .copyWith(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 30 / mockUpHeight * size.height,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'For more info visit:',
                                      style:
                                          veripolTextStyles.bodyMedium.copyWith(
                                        color: Colors.black,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () async {
                                        const url = 'https://cmci.dti.gov.ph/';
                                        if (await canLaunch(url)) {
                                          await launch(url);
                                        }
                                      },
                                      child: Text(
                                        'cmci.dti.gov.ph',
                                        style: veripolTextStyles.bodyMedium
                                            .copyWith(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 30 / mockUpHeight * size.height,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
