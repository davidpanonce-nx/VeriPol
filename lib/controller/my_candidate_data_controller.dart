import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:veripol/controller/candidate_data_controller.dart';
import 'package:veripol/controller/data_controller.dart';

import '../models/models.dart';

class MyCandidatesDataController extends ChangeNotifier {
  MyCandidatesDataController._privateConstructor();

  static final MyCandidatesDataController _myCandidatesDataController =
      MyCandidatesDataController._privateConstructor();

  factory MyCandidatesDataController() {
    return _myCandidatesDataController;
  }
  //total counts for UI
  int _totalCandidates = 0;
  int _nationalCandidates = 0;
  int _provincialCandidates = 0;
  int _municipalCandidates = 0;

//national count variables
  final int _president = 1;
  final int _vicePresident = 1;
  final int _senators = 12;
  int _houseOfRep = 0;
  final int _partyList = 1;

  //provincial candidates
  final int _governor = 1;
  final int _viceGovernor = 1;
  int _provincialBoard = 0;

  //municipal candidates
  final int _mayor = 1;
  final int _viceMayor = 1;
  int _councilors = 0;
  int _numberOfDistricts = 0;

  //DATA FOR DYNAMIC DISPLAY
  List<String> _houseOfRepDistricts = [];
  List<String> _provincialBoardDistricts = [];
  List<String> _councilorDistricts = [];

  List<String> get houseOfRepDistricts => _houseOfRepDistricts;
  List<String> get provincialBoardDistricts => _provincialBoardDistricts;
  List<String> get councilorDistricts => _councilorDistricts;

  int get totalCandidates => _totalCandidates;
  int get nationalCandidates => _nationalCandidates;
  int get provincialCandidates => _provincialCandidates;
  int get municipalCandidates => _municipalCandidates;
  int get houseOfRep => _houseOfRep;
  int get provincialBoard => _provincialBoard;
  int get numberOfDistricts => _numberOfDistricts;
  int get councilors => _councilors;

  //SET RUNTIME COUNT DATA FROM DB
  setRuntimeCountDatafromDB(
      int total,
      int national,
      int provincial,
      int municipal,
      List<String> houseOfRepDistricts,
      List<String> provincialBoardDistricts,
      List<String> councilorDistricts) {
    _totalCandidates = total;
    _nationalCandidates = national;
    _provincialCandidates = provincial;
    _municipalCandidates = municipal;
    _houseOfRepDistricts = houseOfRepDistricts;
    _provincialBoardDistricts = provincialBoardDistricts;
    _councilorDistricts = councilorDistricts;
    notifyListeners();
  }

  //SETTING TOTAL CANDIDDATE COUNT
  setTotalCandidateCount() {
    if (DataController().region == "National Capital Region (NCR)") {
      _totalCandidates = _nationalCandidates + _municipalCandidates;
    } else {
      _totalCandidates =
          _nationalCandidates + _provincialCandidates + _municipalCandidates;
    }

    notifyListeners();
  }

  //SETTING NATIONAL CANDIDATES COUNT
  Future<void> setNationalCandidates() async {
    CandidateDataController().clearRunTimeData();
    await CandidateDataController()
        .readHouseOfReps(DataController().region, DataController().province)
        .whenComplete(() {
      _setHouseRepCount(CandidateDataController().candidates);
      _setHouseRepDistricts(CandidateDataController().candidates);
    });
  }

  _setHouseRepDistricts(List<CandidateData> data) {
    String temp = "";
    List<String> temporaryDistricts = [];
    for (var candidate in data) {
      if (candidate.filedCandidacies["May 9, 2022"]["location"]["district"] !=
          temp) {
        temp =
            candidate.filedCandidacies["May 9, 2022"]["location"]["district"];
        temporaryDistricts.add(temp);
      }
    }

    _houseOfRepDistricts = temporaryDistricts;
    notifyListeners();
  }

  _setHouseRepCount(List<CandidateData> data) {
    int count = 0;
    for (var candidate in data) {
      if (candidate.filedCandidacies["May 9, 2022"]["ballot_number"] == 1) {
        count++;
      }
    }
    _houseOfRep = count;
    _nationalCandidates =
        _president + _vicePresident + _senators + _houseOfRep + _partyList;

    notifyListeners();
  }

  int getHouseRepCount() {
    _houseOfRep = _nationalCandidates -
        (_president + _vicePresident + _senators + _partyList);
    return _houseOfRep;
  }

  //SETTING PROVINCIAL CANDIDATES COUNT
  Future<void> setProvincialCount() async {
    if (DataController().region == "National Capital Region (NCR)") {
      _provincialCandidates = 0;
    } else {
      CandidateDataController().clearRunTimeData();
      await CandidateDataController()
          .readProvincialBoard(DataController().province)
          .whenComplete(
        () {
          _setProvincialBoard(CandidateDataController().candidates);
          _setProvincialBoardDistricts(CandidateDataController().candidates);
        },
      );
    }
  }

  _setProvincialBoard(List<CandidateData> data) {
    int count = 0;
    for (var candidate in data) {
      if (candidate.filedCandidacies["May 9, 2022"]["ballot_number"] == 1) {
        count++;
      }
    }
    _provincialBoard = count;
    _provincialCandidates = _governor + _viceGovernor + _provincialBoard;
    notifyListeners();
  }

  _setProvincialBoardDistricts(List<CandidateData> data) {
    String temp = "";
    List<String> temporaryDistricts = [];
    for (var candidate in data) {
      if (candidate.filedCandidacies["May 9, 2022"]["location"]["district"] !=
          temp) {
        temp =
            candidate.filedCandidacies["May 9, 2022"]["location"]["district"];
        temporaryDistricts.add(temp);
      }
    }

    if (DataController().region == "National Capital Region (NCR)") {
      _provincialBoardDistricts = [];
    } else {
      _provincialBoardDistricts = temporaryDistricts;
    }

    notifyListeners();
  }

  //SETTING MUNICIPAL CANDIDATES COUNT
  Future<void> setMunicipalCount() async {
    CandidateDataController().clearRunTimeData();
    await CandidateDataController()
        .readCouncilors(DataController().province, DataController().city)
        .whenComplete(() {
      _setCouncilors(CandidateDataController().candidates);
      _setCouncilorDistricts(CandidateDataController().candidates);
    });
  }

  _setCouncilors(List<CandidateData> data) {
    int count = 0;
    for (var candidate in data) {
      if (candidate.filedCandidacies["May 9, 2022"]["ballot_number"] == 1) {
        count++;
      }
    }

    int perDistrictCount = 0;
    if (_councilorRuleCount[4]!.contains(DataController().city)) {
      perDistrictCount = 4;
    } else if (_councilorRuleCount[6]!.contains(DataController().city)) {
      perDistrictCount = 6;
    } else if (_councilorRuleCount[8]!.contains(DataController().city)) {
      perDistrictCount = 8;
    } else if (_councilorRuleCount[12]!.contains(DataController().city)) {
      perDistrictCount = 12;
    } else {
      perDistrictCount = 10;
    }
    _numberOfDistricts = count;
    _councilors = count * perDistrictCount;

    _municipalCandidates = _mayor + _viceMayor + _councilors;
    notifyListeners();
  }

  _setCouncilorDistricts(List<CandidateData> data) {
    String temp = "";
    List<String> temporaryDistricts = [];
    for (var candidate in data) {
      if (candidate.filedCandidacies["May 9, 2022"]["location"]["district"] !=
          temp) {
        temp =
            candidate.filedCandidacies["May 9, 2022"]["location"]["district"];
        temporaryDistricts.add(temp);
      }
    }

    _councilorDistricts = temporaryDistricts;
    notifyListeners();
  }

  Future<void> storeCandidateCountToDB() async {
    await FirebaseFirestore.instance
        .collection("User")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update(({
          "candidates": {
            "total": _totalCandidates,
            "national": _nationalCandidates,
            "provincial": _provincialCandidates,
            "municipal": _municipalCandidates,
            "houseOfRepDistricts": _houseOfRepDistricts,
            "provincialBoardDistricts": _provincialBoardDistricts,
            "councilorDistricts": _councilorDistricts,
          }
        }));
  }

  Future<void> cacheCountData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setInt("total", _totalCandidates);
    await prefs.setInt("national", _nationalCandidates);
    await prefs.setInt("provincial", _provincialCandidates);
    await prefs.setInt("municipal", _municipalCandidates);
  }

  //Number of Councilors per district
  //If not here then the Number of Councilors per district is 10
  final Map<int, List<String>> _councilorRuleCount = {
    4: ["Island Garden City of Samal", "City of Sorsogon (Capital)"],
    6: [
      "City of Manila",
      "Quezon City",
      "City of Caloocan",
      "City of Bacoor",
      "City of Calbayog",
      "City of Las Piñas",
      "City of Malabon",
      "City of Mandaluyong",
      "City of Navotas",
      "Pasay City",
      "City of Pasig",
      "City of San Jose Del Monte",
      "City of San Juan",
      "City of Valenzuela"
    ],
    8: [
      "City of Davao",
      "City of Antipolo (Capital)",
      "City of Cagayan De Oro (Capital)",
      "City of Cebu (Capital)",
      "City of Makati",
      "City of Marikina",
      "City of Muntinlupa",
      "City of Parañaque",
      "City of Taguig",
      "City of Zamboanga",
    ],
    12: [
      "City of Baguio",
      "City of Bacolod (Capital)",
      "Batangas City (Capital)",
      "City of Biñan",
      "City of Calamba",
      "City of Dasmariñas",
      "City of General Santos",
      "City of General Trias",
      "City of Iligan",
      "City of Iloilo (Capital)",
      "City of Imus",
      "City of Lapu-Lapu",
      "City of Lipa",
      "City of San Fernando (Capital)",
      "Tuguegarao City (Capital)",
    ],
  };
}
