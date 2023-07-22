import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../components/themes.dart';
import '../models/models.dart';

class ChartCardDetials extends StatelessWidget {
  const ChartCardDetials(
      {Key? key,
      required this.chartData,
      required this.pillar,
      required this.lastName,
      this.id})
      : super(key: key);

  final List<ChartData> chartData;
  final String pillar;
  final String lastName;
  final String? id;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textScale = size.width / mockUpWidth;

    return Container(
      width: 345 / mockUpWidth * size.width,
      height: 235 / mockUpHeight * size.height,
      padding: EdgeInsets.symmetric(
        horizontal: 13 / mockUpWidth * size.width,
        vertical: 13 / mockUpHeight * size.height,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          8 / mockUpWidth * size.width,
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 1 / mockUpHeight * size.height),
            blurRadius: 2 / mockUpWidth * size.width,
            spreadRadius: 0,
            color: Colors.black.withOpacity(0.30),
          ),
          BoxShadow(
            offset: Offset(0, 1 / mockUpHeight * size.height),
            blurRadius: 3 / mockUpWidth * size.width,
            spreadRadius: 1 / mockUpWidth * size.width,
            color: Colors.black.withOpacity(0.15),
          ),
        ],
      ),
      margin: EdgeInsets.symmetric(horizontal: 15 / mockUpWidth * size.width),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "During $lastName's Term",
                textScaleFactor: textScale,
                style: GoogleFonts.inter(
                  textStyle: const TextStyle(
                    fontStyle: FontStyle.normal,
                    fontSize: 8.84,
                    fontWeight: FontWeight.w400,
                    height: 1.50,
                    letterSpacing: 0,
                    color: Color(0xff718096),
                  ),
                ),
              ),
              Text(
                pillar,
                style: GoogleFonts.inter(
                  textStyle: const TextStyle(
                    fontStyle: FontStyle.normal,
                    fontSize: 11.05,
                    fontWeight: FontWeight.w500,
                    height: 1.50,
                    letterSpacing: 0,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: SfCartesianChart(
              primaryXAxis: NumericAxis(
                minimum: id != null ? 2015 : 2018,
                maximum: id != null ? 2019 : 2022,
              ),
              series: <ChartSeries<ChartData, int>>[
                ColumnSeries<ChartData, int>(
                  dataSource: chartData,
                  xValueMapper: (ChartData data, _) => data.year,
                  yValueMapper: (ChartData data, _) => data.value,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
