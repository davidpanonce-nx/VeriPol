import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:veripol/controller/data_controller.dart';
import 'package:veripol/models/models.dart';

class CandidateDataController extends ChangeNotifier {
  CandidateDataController._privateConstructor();

  static final CandidateDataController _candidateDataController =
      CandidateDataController._privateConstructor();

  factory CandidateDataController() {
    return _candidateDataController;
  }

  Map<String, dynamic> _mappedData = {};
  List<CandidateData> _candidates = [];

  List<CandidateData> get candidates => _candidates;

  // PRESIDENTS
  Future<void> readPresident() async {
    final String response =
        await rootBundle.loadString('assets/data/candidates/PRESIDENT.json');
    final data = await json.decode(response);

    _mappedData = data;

    _getPresidents();
  }

  void _getPresidents() {
    List<CandidateData> temp = [];
    List<String> keys = [];
    for (var key in _mappedData.keys) {
      keys.add(key);
    }
    for (var key in keys) {
      temp.add(
        CandidateData(
          id: key,
          name: _mappedData[key]["name"],
          sex: _mappedData[key]["sex"],
          imgURL: _mappedData[key]["imgURL"] ?? "",
          filedCandidacies: _mappedData[key]["filed_candidacies"],
          houseBills: _mappedData[key]["house_bills"],
          senateBills: _mappedData[key]["senate_bills"],
          profileURL: _mappedData[key]["profile_url"] ?? '',
        ),
      );
    }
    _candidates = temp;
    notifyListeners();
  }

  //VICE PRESIDENTS
  Future<void> readVicePresident() async {
    final String response = await rootBundle
        .loadString('assets/data/candidates/VICE-PRESIDENT.json');
    final data = await json.decode(response);

    _mappedData = data;

    _getVicePresidents();
  }

  void _getVicePresidents() {
    List<CandidateData> temp = [];
    List<String> keys = [];
    for (var key in _mappedData.keys) {
      keys.add(key);
    }
    for (var key in keys) {
      temp.add(
        CandidateData(
          id: key,
          name: _mappedData[key]["name"],
          sex: _mappedData[key]["sex"],
          imgURL: _mappedData[key]["imgURL"] ?? "",
          filedCandidacies: _mappedData[key]["filed_candidacies"],
          houseBills: _mappedData[key]["house_bills"],
          senateBills: _mappedData[key]["senate_bills"],
          profileURL: _mappedData[key]["profile_url"] ?? '',
        ),
      );
    }
    _candidates = temp;
    notifyListeners();
  }

  //SENATORS
  Future<void> readSenatorJson() async {
    final String response =
        await rootBundle.loadString('assets/data/candidates/SENATOR.json');
    final data = await json.decode(response);

    _mappedData = data;

    _getSenators();
  }

  void _getSenators() {
    List<CandidateData> temp = [];
    List<String> keys = [];
    for (var key in _mappedData.keys) {
      keys.add(key);
    }
    for (var key in keys) {
      temp.add(
        CandidateData(
          id: key,
          name: _mappedData[key]["name"],
          sex: _mappedData[key]["sex"],
          imgURL: _mappedData[key]["imgURL"] ?? "",
          filedCandidacies: _mappedData[key]["filed_candidacies"],
          houseBills: _mappedData[key]["house_bills"],
          senateBills: _mappedData[key]["senate_bills"],
          profileURL: _mappedData[key]["profile_url"] ?? '',
        ),
      );
    }
    _candidates = temp;
    notifyListeners();
  }

  //HOUSE OF REPRESENTATIVES
  Future<void> readHouseOfReps(String region, String province) async {
    final String response = await rootBundle.loadString(
        'assets/data/candidates/MEMBER, HOUSE OF REPRESENTATIVES.json');
    final data = await json.decode(response);

    _mappedData = data;

    if (region == "National Capital Region (NCR)") {
      _getHouseOfRepsNCR(DataController().city);
    } else {
      _getHouseOfReps(province);
    }
  }

  void _getHouseOfReps(String province) {
    List<CandidateData> temp = [];
    List<String> keys = [];
    for (var key in _mappedData.keys) {
      if (_mappedData[key]["filed_candidacies"]["May 9, 2022"]["location"]
              ["province"] ==
          province.toUpperCase()) {
        keys.add(key);
      }
    }
    for (var key in keys) {
      temp.add(
        CandidateData(
          id: key,
          name: _mappedData[key]["name"],
          sex: _mappedData[key]["sex"],
          imgURL: _mappedData[key]["imgURL"] ?? "",
          filedCandidacies: _mappedData[key]["filed_candidacies"],
          houseBills: _mappedData[key]["house_bills"],
          senateBills: _mappedData[key]["senate_bills"],
          profileURL: _mappedData[key]["profile_url"] ?? '',
        ),
      );
    }
    _candidates = temp;
    notifyListeners();
  }

  void _getHouseOfRepsNCR(String city) {
    List<CandidateData> temp = [];
    List<String> keys = [];
    for (var key in _mappedData.keys) {
      if (_mappedData[key]["filed_candidacies"]["May 9, 2022"]["location"]
              ["district"] ==
          city.toUpperCase()) {
        keys.add(key);
      }
    }
    for (var key in keys) {
      temp.add(
        CandidateData(
          id: key,
          name: _mappedData[key]["name"],
          sex: _mappedData[key]["sex"],
          imgURL: _mappedData[key]["imgURL"] ?? "",
          filedCandidacies: _mappedData[key]["filed_candidacies"],
          houseBills: _mappedData[key]["house_bills"],
          senateBills: _mappedData[key]["senate_bills"],
          profileURL: _mappedData[key]["profile_url"] ?? '',
        ),
      );
    }
    _candidates = temp;
    notifyListeners();
  }

  //PARTY LIST
  Future<void> readPartyList() async {
    final String response =
        await rootBundle.loadString('assets/data/candidates/PARTY LIST.json');
    final data = await json.decode(response);

    _mappedData = data;

    _getPartyList();
  }

  void _getPartyList() {
    List<CandidateData> temp = [];
    List<String> keys = [];
    for (var key in _mappedData.keys) {
      keys.add(key);
    }
    for (var key in keys) {
      temp.add(
        CandidateData(
          id: key,
          name: _mappedData[key]["name"],
          sex: _mappedData[key]["sex"],
          imgURL: _mappedData[key]["imgURL"] ?? "",
          filedCandidacies: _mappedData[key]["filed_candidacies"],
          houseBills: _mappedData[key]["house_bills"],
          senateBills: _mappedData[key]["senate_bills"],
          profileURL: _mappedData[key]["profile_url"] ?? '',
        ),
      );
    }
    _candidates = temp;
    notifyListeners();
  }

  //GOVERNOR
  Future<void> readGovernor(String province) async {
    final String response = await rootBundle
        .loadString('assets/data/candidates/PROVINCIAL GOVERNOR.json');
    final data = await json.decode(response);

    _mappedData = data;

    _getGovernor(province);
  }

  void _getGovernor(String province) {
    List<CandidateData> temp = [];
    List<String> keys = [];
    for (var key in _mappedData.keys) {
      if (_mappedData[key]["filed_candidacies"]["May 9, 2022"]["location"]
              ["province"] ==
          province.toUpperCase()) {
        keys.add(key);
      }
    }
    for (var key in keys) {
      temp.add(
        CandidateData(
          id: key,
          name: _mappedData[key]["name"],
          sex: _mappedData[key]["sex"],
          imgURL: _mappedData[key]["imgURL"] ?? "",
          filedCandidacies: _mappedData[key]["filed_candidacies"],
          houseBills: _mappedData[key]["house_bills"],
          senateBills: _mappedData[key]["senate_bills"],
          profileURL: _mappedData[key]["profile_url"] ?? '',
        ),
      );
    }
    _candidates = temp;
    notifyListeners();
  }

  //VICE-GOVERNOR
  Future<void> readViceGovernor(String province) async {
    final String response = await rootBundle
        .loadString('assets/data/candidates/PROVINCIAL VICE-GOVERNOR.json');
    final data = await json.decode(response);

    _mappedData = data;

    _getViceGovernor(province);
  }

  void _getViceGovernor(String province) {
    List<CandidateData> temp = [];
    List<String> keys = [];
    for (var key in _mappedData.keys) {
      if (_mappedData[key]["filed_candidacies"]["May 9, 2022"]["location"]
              ["province"] ==
          province.toUpperCase()) {
        keys.add(key);
      }
    }
    for (var key in keys) {
      temp.add(
        CandidateData(
          id: key,
          name: _mappedData[key]["name"],
          sex: _mappedData[key]["sex"],
          imgURL: _mappedData[key]["imgURL"] ?? "",
          filedCandidacies: _mappedData[key]["filed_candidacies"],
          houseBills: _mappedData[key]["house_bills"],
          senateBills: _mappedData[key]["senate_bills"],
          profileURL: _mappedData[key]["profile_url"] ?? '',
        ),
      );
    }
    _candidates = temp;
    notifyListeners();
  }

  //PROVINCIAL BOARD
  Future<void> readProvincialBoard(String province) async {
    final String response = await rootBundle.loadString(
        'assets/data/candidates/MEMBER, SANGGUNIANG PANLALAWIGAN.json');
    final data = await json.decode(response);

    _mappedData = data;

    _getProvincialBoard(province);
  }

  void _getProvincialBoard(String province) {
    List<CandidateData> temp = [];
    List<String> keys = [];
    for (var key in _mappedData.keys) {
      if (_mappedData[key]["filed_candidacies"]["May 9, 2022"]["location"]
              ["province"] ==
          province.toUpperCase()) {
        keys.add(key);
      }
    }
    for (var key in keys) {
      temp.add(
        CandidateData(
          id: key,
          name: _mappedData[key]["name"],
          sex: _mappedData[key]["sex"],
          imgURL: _mappedData[key]["imgURL"] ?? "",
          filedCandidacies: _mappedData[key]["filed_candidacies"],
          houseBills: _mappedData[key]["house_bills"],
          senateBills: _mappedData[key]["senate_bills"],
          profileURL: _mappedData[key]["profile_url"] ?? '',
        ),
      );
    }
    _candidates = temp;
    notifyListeners();
  }

  //MAYOR
  Future<void> readMayor(String province, String municipality) async {
    final String response =
        await rootBundle.loadString('assets/data/candidates/MAYOR.json');
    final data = await json.decode(response);

    _mappedData = data;

    if (DataController().region == "National Capital Region (NCR)") {
      _getMayor("NCR", municipality);
    } else {
      _getMayor(province, municipality);
    }
  }

  void _getMayor(String province, String municipality) {
    List<CandidateData> temp = [];
    List<String> keys = [];
    for (var key in _mappedData.keys) {
      if (_mappedData[key]["filed_candidacies"]["May 9, 2022"]["location"]
                  ["province"] ==
              province.toUpperCase() &&
          _mappedData[key]["filed_candidacies"]["May 9, 2022"]["location"]
                  ["municipality"] ==
              municipality.toUpperCase()) {
        keys.add(key);
      }
    }
    for (var key in keys) {
      temp.add(
        CandidateData(
          id: key,
          name: _mappedData[key]["name"],
          sex: _mappedData[key]["sex"],
          imgURL: _mappedData[key]["imgURL"] ?? "",
          filedCandidacies: _mappedData[key]["filed_candidacies"],
          houseBills: _mappedData[key]["house_bills"],
          senateBills: _mappedData[key]["senate_bills"],
          profileURL: _mappedData[key]["profile_url"] ?? '',
        ),
      );
    }
    _candidates = temp;
    notifyListeners();
  }

  //VICE MAYOR
  Future<void> readViceMayor(String province, String municipality) async {
    final String response =
        await rootBundle.loadString('assets/data/candidates/VICE-MAYOR.json');
    final data = await json.decode(response);

    _mappedData = data;
    if (DataController().region == "National Capital Region (NCR)") {
      _getViceMayor("NCR", municipality);
    } else {
      _getViceMayor(province, municipality);
    }
  }

  void _getViceMayor(String province, String municipality) {
    List<CandidateData> temp = [];
    List<String> keys = [];
    for (var key in _mappedData.keys) {
      if (_mappedData[key]["filed_candidacies"]["May 9, 2022"]["location"]
                  ["province"] ==
              province.toUpperCase() &&
          _mappedData[key]["filed_candidacies"]["May 9, 2022"]["location"]
                  ["municipality"] ==
              municipality.toUpperCase()) {
        keys.add(key);
      }
    }
    for (var key in keys) {
      temp.add(
        CandidateData(
          id: key,
          name: _mappedData[key]["name"],
          sex: _mappedData[key]["sex"],
          imgURL: _mappedData[key]["imgURL"] ?? "",
          filedCandidacies: _mappedData[key]["filed_candidacies"],
          houseBills: _mappedData[key]["house_bills"],
          senateBills: _mappedData[key]["senate_bills"],
          profileURL: _mappedData[key]["profile_url"] ?? '',
        ),
      );
    }
    _candidates = temp;
    notifyListeners();
  }

  //COUNCILORS
  Future<void> readCouncilors(String province, String municipality) async {
    final String response =
        await rootBundle.loadString('assets/data/candidates/COUNCILOR.json');
    final data = await json.decode(response);

    _mappedData = data;
    if (DataController().region == "National Capital Region (NCR)") {
      _getCouncilor("NCR", municipality);
    } else {
      _getCouncilor(province, municipality);
    }
  }

  void _getCouncilor(String province, String municipality) {
    List<CandidateData> temp = [];
    List<String> keys = [];
    for (var key in _mappedData.keys) {
      if (_mappedData[key]["filed_candidacies"]["May 9, 2022"]["location"]
                  ["province"] ==
              province.toUpperCase() &&
          _mappedData[key]["filed_candidacies"]["May 9, 2022"]["location"]
                  ["municipality"] ==
              municipality.toUpperCase()) {
        keys.add(key);
      }
    }
    for (var key in keys) {
      temp.add(
        CandidateData(
          id: key,
          name: _mappedData[key]["name"],
          sex: _mappedData[key]["sex"],
          imgURL: _mappedData[key]["imgURL"] ?? "",
          filedCandidacies: _mappedData[key]["filed_candidacies"],
          houseBills: _mappedData[key]["house_bills"],
          senateBills: _mappedData[key]["senate_bills"],
          profileURL: _mappedData[key]["profile_url"] ?? '',
        ),
      );
    }
    _candidates = temp;
    notifyListeners();
  }

  clearRunTimeData() {
    _mappedData.clear();
    _candidates.clear();
  }
}
