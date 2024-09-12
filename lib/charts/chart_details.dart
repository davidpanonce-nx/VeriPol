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
    this.id,
    super.key,
  });

  final String city;
  final String lastName;
  final String pillar;
  final String pillarDescription;
  final String bgImageUrl;
  final Offset bgImageOffset;
  final Size bgImageSize;
  final List<ChartData> data;
  final String? id;
  @override
  State<ChartDetails> createState() => _ChartDetailsState();
}

class _ChartDetailsState extends State<ChartDetails> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Positioned(
              top: 86,
              child: Image.asset(
                "assets/bg_pattern.png",
              ),
            ),
            SingleChildScrollView(
              child: Container(
                width: size.width,
                height: size.height,
                padding: const EdgeInsets.only(
                  top: 48,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 375,
                      height: 56,
                      padding: const EdgeInsets.only(
                        top: 12,
                        left: 16,
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
                            iconSize: 30,
                            color: Colors.black,
                          ),
                          const SizedBox(
                            width: 32,
                          ),
                          Text(
                            "Details",
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
                      height: size.height - 104,
                      child: ListView(
                        padding: EdgeInsets.zero,
                        children: [
                          Container(
                            width: size.width,
                            decoration: BoxDecoration(color: veripolColors.nightSky),
                            child: Stack(
                              children: [
                                Positioned(
                                  top: widget.bgImageOffset.dy,
                                  left: widget.bgImageOffset.dx,
                                  width: widget.bgImageSize.width,
                                  height: widget.bgImageSize.height,
                                  child: Image.asset(
                                    widget.bgImageUrl,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 20,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        widget.city,
                                        style: veripolTextStyles.headlineMedium.copyWith(color: Colors.white),
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        widget.pillar,
                                        style: veripolTextStyles.titleSmall.copyWith(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: size.width,
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Graph",
                                  style: veripolTextStyles.labelLarge.copyWith(
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Expanded(
                                  child: Divider(
                                    height: 20,
                                    thickness: 1,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ChartCardDetials(
                            chartData: widget.data,
                            pillar: widget.pillar,
                            lastName: widget.lastName,
                            id: widget.id,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: size.width,
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Description",
                                  style: veripolTextStyles.labelLarge.copyWith(
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Expanded(
                                  child: Divider(
                                    height: 20,
                                    thickness: 1,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: 345,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                8,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.30),
                                  spreadRadius: 0,
                                  blurRadius: 2,
                                  offset: const Offset(0, 1),
                                ),
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.15),
                                  spreadRadius: 1,
                                  blurRadius: 3,
                                  offset: const Offset(
                                    0,
                                    1,
                                  ),
                                ),
                              ],
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 20,
                            ),
                            margin: const EdgeInsets.symmetric(
                              horizontal: 15,
                            ),
                            child: Text(
                              widget.pillarDescription,
                              textAlign: TextAlign.justify,
                              style: veripolTextStyles.bodyMedium.copyWith(
                                color: Colors.black,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: size.width,
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Source",
                                  style: veripolTextStyles.labelLarge.copyWith(
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Expanded(
                                  child: Divider(
                                    height: 20,
                                    thickness: 1,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: 345,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                8,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.30),
                                  spreadRadius: 0,
                                  blurRadius: 2,
                                  offset: const Offset(0, 1),
                                ),
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.15),
                                  spreadRadius: 1,
                                  blurRadius: 3,
                                  offset: const Offset(
                                    0,
                                    1,
                                  ),
                                ),
                              ],
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 20,
                            ),
                            margin: const EdgeInsets.symmetric(
                              horizontal: 15,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                  textAlign: TextAlign.justify,
                                  text: TextSpan(
                                    style: veripolTextStyles.bodyMedium.copyWith(
                                      color: Colors.black,
                                    ),
                                    children: [
                                      const TextSpan(text: "Data taken from"),
                                      TextSpan(
                                        text:
                                            " Cities and Municipalities Competitive Index - Department of Trade and Industries",
                                        style: veripolTextStyles.bodyMedium.copyWith(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'For more info visit:',
                                      style: veripolTextStyles.bodyMedium.copyWith(
                                        color: Colors.black,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () async {
                                        const url = "https://cmci.dti.gov.ph/";
                                        if (await canLaunch(url)) {
                                          await launch(url);
                                        }
                                      },
                                      child: Text(
                                        'cmci.dti.gov.ph',
                                        style: veripolTextStyles.bodyMedium.copyWith(
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
                          const SizedBox(
                            height: 30,
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
