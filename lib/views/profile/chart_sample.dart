import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:veripol/components/themes.dart';

class ChartSample extends StatelessWidget {
  const ChartSample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<EconomicDynamism> data = [
      EconomicDynamism(year: DateTime(2016), value: 9.0847),
      EconomicDynamism(year: DateTime(2017), value: 3.2109),
      EconomicDynamism(year: DateTime(2018), value: 4.9977),
      EconomicDynamism(year: DateTime(2019), value: 4.7519),
      EconomicDynamism(year: DateTime(2020), value: 5.9253),
      EconomicDynamism(year: DateTime(2021), value: 5.9141),
    ];
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: veripolColors.background,
      body: Container(
        width: size.width,
        height: size.height,
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 150,
        ),
        child: Column(
          children: [
            Container(
              width: 345 / mockUpWidth * size.width,
              height: 235 / mockUpHeight * size.height,
              decoration: const BoxDecoration(color: Colors.white),
              child: SfCartesianChart(
                primaryXAxis: DateTimeAxis(),
                series: <ChartSeries>[
                  LineSeries<EconomicDynamism, DateTime>(
                    enableTooltip: true,
                    isVisible: true,
                    markerSettings: const MarkerSettings(
                      isVisible: true,
                      shape: DataMarkerType.circle,
                    ),
                    dataSource: data,
                    xValueMapper: (EconomicDynamism eco, _) => eco.year,
                    yValueMapper: (EconomicDynamism eco, _) => eco.value,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EconomicDynamism {
  EconomicDynamism({required this.year, required this.value});
  final DateTime year;
  final double value;
}
