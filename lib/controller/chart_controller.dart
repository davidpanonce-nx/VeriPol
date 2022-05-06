import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/models.dart';

class ChartController extends ChangeNotifier {
  ChartController._privateConstructor();

  static final ChartController _chartController =
      ChartController._privateConstructor();

  factory ChartController() {
    return _chartController;
  }

  List<ChartData> _overAllScore = [];
  List<ChartData> _economicDynamism = [];
  List<ChartData> _governmentEfficiency = [];
  List<ChartData> _infrastructure = [];
  List<ChartData> _resilliency = [];

  List<ChartData> get overAllScore => _overAllScore;
  List<ChartData> get economicDynamism => _economicDynamism;
  List<ChartData> get governmentEfficiency => _governmentEfficiency;
  List<ChartData> get infrastructure => _infrastructure;
  List<ChartData> get resilliency => _resilliency;

  Map<String, dynamic> _mappedData = {};

  Future<void> readCMCIData(String id, String locationID) async {
    final String response =
        await rootBundle.loadString('assets/data/candidates/mayor_cmci.json');
    final data = await json.decode(response);

    _mappedData = data;
    if (_mappedData.containsKey(id)) {
      _getMayorCMCIData(id, locationID);
    }
  }

  _getMayorCMCIData(String id, String locationID) {
    List<String> keys = [];
    List<ChartData> overAllScoreTEMP = [];
    List<ChartData> economicDynamismTEMP = [];
    List<ChartData> governmentEfficiencyTEMP = [];
    List<ChartData> infrastructureTEMP = [];
    List<ChartData> resilliencyTEMP = [];
    keys.addAll(Map<String, dynamic>.from(_mappedData[id][locationID]).keys);

    for (var key in keys) {
      overAllScoreTEMP.add(
        ChartData(
            year: int.parse(key),
            value: _mappedData[id][locationID][key]["overall_score"] ?? 0),
      );
      economicDynamismTEMP.add(
        ChartData(
            year: int.parse(key),
            value: _mappedData[id][locationID][key]["economic_dynamism"] ?? 0),
      );
      governmentEfficiencyTEMP.add(
        ChartData(
            year: int.parse(key),
            value:
                _mappedData[id][locationID][key]["government_efficiency"] ?? 0),
      );
      infrastructureTEMP.add(
        ChartData(
            year: int.parse(key),
            value: _mappedData[id][locationID][key]["infrastructure"] ?? 0),
      );
      resilliencyTEMP.add(
        ChartData(
            year: int.parse(key),
            value: _mappedData[id][locationID][key]["resiliency"] ?? 0),
      );
    }

    _overAllScore = overAllScoreTEMP;
    _economicDynamism = economicDynamismTEMP;
    _governmentEfficiency = governmentEfficiencyTEMP;
    _infrastructure = infrastructureTEMP;
    _resilliency = resilliencyTEMP;

    notifyListeners();
  }

  final Map<String, String> _pillarDescription = {
    "Overall Score":
        "Taken from CMCI, Cities and Municipalities Competitiveness Index. CMCI Tracks 4 Pillars, Economic Dynamism, Government Efficiency, Infrastucture, and Resiliency.",
    "Economic Dynamism":
        "According to CMCI DTI, Economic Dynamism is usually associated with activities that create stable expansion of business and industries and higher employment. This is the concrete representation of productivity as it matches the output of the local economy with local resources. Conceptually, it is the combination of the entrepreneurial spirit and the financial institutions that will channel dynamism (Edmund Phelps). It is recognized that localities are the centers of economic activities. Therefore, business expansion and job creation are easily observable in local settings.",
    "Government Efficiency":
        "According to CMCI DTI, Government Efficiency refers to the quality and reliability of government services and government support for effective and sustainable productive expansion. Conceptually, this factor looks at government as an institution that is generally not corrupt; able to protect and enforce contracts; apply moderate and reasonable taxation and is able to regulate proactively (La Porta et al, 1999). This represents the people and culture factor that Porter alluded to in understanding the process of competitiveness and making locations productive.",
    "Infrastructure":
        "According to CMCI DTI, Infrastructure refers to the physical building blocks that connect, expand, and sustain a locality and its surroundings to enable the provision of goods and services. It involves basic inputs of production such as energy, water; interconnection of production such as transportation, roads, and communications; sustenance of production such as waste, disaster preparedness, environmental sustainability and human capital formation infrastructure.",
    "Resilliency":
        "According to CMCI DTI, Resiliency is the capacity of a locality to facilitate businesses and industries to create jobs, raise productivity, and increase the incomes of citizens over time despite of the shocks and stresses it encounters. This implies that the role of local governments is critical in ensuring a competitive environment to make businesses sustain their profits, create jobs, and increase the productivity of its people.",
  };

  Map<String, String> get pillarDescription => _pillarDescription;

  clearChartRunTime() {
    _overAllScore.clear();
    _economicDynamism.clear();
    _governmentEfficiency.clear();
    _infrastructure.clear();
    _resilliency.clear();

    notifyListeners();
  }

  Map<String, dynamic> radazaData = {
    "overall_score": {
      "2016": 32.4878,
      "2017": 40.618,
      "2018": 41.4731,
    },
    "economic_dynamism": {
      "2016": 9.0847,
      "2017": 3.2109,
      "2018": 4.9977,
    },
    "government_efficiency": {
      "2016": 13.6407,
      "2017": 11.7819,
      "2018": 12.3694,
    },
    "infrastructure": {
      "2016": 9.7624,
      "2017": 8.2853,
      "2018": 7.5453,
    },
    "resilliency": {
      "2016": 0.0,
      "2017": 17.3399,
      "2018": 16.5607,
    }
  };

  setForRadazaData() {
    List<String> keys = ["2016", "2017", "2018"];
    List<ChartData> overAllScoreTEMP = [];
    List<ChartData> economicDynamismTEMP = [];
    List<ChartData> governmentEfficiencyTEMP = [];
    List<ChartData> infrastructureTEMP = [];
    List<ChartData> resilliencyTEMP = [];

    for (var key in keys) {
      overAllScoreTEMP.add(
        ChartData(
            year: int.parse(key), value: radazaData["overall_score"][key] ?? 0),
      );
      economicDynamismTEMP.add(
        ChartData(
            year: int.parse(key),
            value: radazaData["economic_dynamism"][key] ?? 0),
      );
      governmentEfficiencyTEMP.add(
        ChartData(
            year: int.parse(key),
            value: radazaData["government_efficiency"][key] ?? 0),
      );
      infrastructureTEMP.add(
        ChartData(
            year: int.parse(key),
            value: radazaData["infrastructure"][key] ?? 0),
      );
      resilliencyTEMP.add(
        ChartData(
          year: int.parse(key),
          value: radazaData["resilliency"][key] ?? 0,
        ),
      );
    }
    _overAllScore = overAllScoreTEMP;
    _economicDynamism = economicDynamismTEMP;
    _governmentEfficiency = governmentEfficiencyTEMP;
    _infrastructure = infrastructureTEMP;
    _resilliency = resilliencyTEMP;

    notifyListeners();
  }
}
