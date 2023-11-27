import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../models/models.dart';

class ChartCardDetials extends StatelessWidget {
  const ChartCardDetials({Key? key, required this.chartData, required this.pillar, required this.lastName, this.id})
      : super(key: key);

  final List<ChartData> chartData;
  final String pillar;
  final String lastName;
  final String? id;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 345,
      height: 235,
      padding: const EdgeInsets.symmetric(
        horizontal: 13,
        vertical: 13,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          8,
        ),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 1),
            blurRadius: 2,
            spreadRadius: 0,
            color: Colors.black.withOpacity(0.30),
          ),
          BoxShadow(
            offset: const Offset(0, 1),
            blurRadius: 3,
            spreadRadius: 1,
            color: Colors.black.withOpacity(0.15),
          ),
        ],
      ),
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "During $lastName's Term",
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
