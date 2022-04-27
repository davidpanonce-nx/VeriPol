import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    List<String> councilorDistricts,
  ) {
    _totalCandidates = total;
    _nationalCandidates = national;
    _provincialCandidates = provincial;
    _municipalCandidates = municipal;
    _houseOfRepDistricts = houseOfRepDistricts;
    _provincialBoardDistricts = provincialBoardDistricts;
    _councilorDistricts = councilorDistricts;
    _councilors = municipal - 2;
    notifyListeners();
  }

  //SETTING TOTAL CANDIDDATE COUNT
  setTotalCandidateCount() {
    if (CandidateDataController()
        .highlyUrbanizedCities
        .contains(DataController().city)) {
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
    List<String> temporaryDistricts = [];
    for (var candidate in data) {
      if (candidate.filedCandidacies["May 9, 2022"]["location"]
              ["municipality"] !=
          null) {
        if (!temporaryDistricts.contains("(" +
            candidate.filedCandidacies["May 9, 2022"]["location"]
                ["municipality"] +
            ")" +
            candidate.filedCandidacies["May 9, 2022"]["location"]
                ["district"])) {
          temporaryDistricts.add("(" +
              candidate.filedCandidacies["May 9, 2022"]["location"]
                  ["municipality"] +
              ")" +
              candidate.filedCandidacies["May 9, 2022"]["location"]
                  ["district"]);
        }
      } else {
        if (!temporaryDistricts.contains(candidate
            .filedCandidacies["May 9, 2022"]["location"]["district"])) {
          temporaryDistricts.add(candidate.filedCandidacies["May 9, 2022"]
              ["location"]["district"]);
        }
      }
    }

    _houseOfRepDistricts = temporaryDistricts;
    notifyListeners();
  }

  _setHouseRepCount(List<CandidateData> data) {
    // int count = 0;
    // for (var candidate in data) {
    //   if (candidate.filedCandidacies["May 9, 2022"]["ballot_number"] == 1) {
    //     count++;
    //   }
    // }
    _houseOfRep = 1;
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
    if (CandidateDataController()
        .highlyUrbanizedCities
        .contains(DataController().city)) {
      _provincialCandidates = 0;
      _provincialBoardDistricts = [];
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
    // int count = 0;
    // for (var candidate in data) {
    //   if (candidate.filedCandidacies["May 9, 2022"]["ballot_number"] == 1) {
    //     count++;
    //   }
    // }
    _provincialBoard = 2;
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

    _provincialBoardDistricts = temporaryDistricts;

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

  final CollectionReference user =
      FirebaseFirestore.instance.collection("User");

  // MY CANDIDATES

  //PRESIDENT

  setMyPresidentRunTime(String id) {
    DataController().userData["my_candidates"]["president"] = id;
    notifyListeners();
  }

  Future<void> storeMyPresidentToDb(String id) async {
    await user.doc(FirebaseAuth.instance.currentUser!.uid).update({
      "my_candidates": {
        "president": id,
        "vicePresident": DataController().userData["my_candidates"]
            ["vicePresident"],
        'senators': DataController().userData["my_candidates"]["senators"],
        'houseRep': DataController().userData["my_candidates"]["houseRep"],
        'partyList': DataController().userData["my_candidates"]["partyList"],
        'governor': DataController().userData["my_candidates"]["governor"],
        'viceGovernor': DataController().userData["my_candidates"]
            ["viceGovernor"],
        'provincialBoard': DataController().userData["my_candidates"]
            ["provincialBoard"],
        'mayor': DataController().userData["my_candidates"]["mayor"],
        'viceMayor': DataController().userData["my_candidates"]["viceMayor"],
        'cityCouncilors': DataController().userData["my_candidates"]
            ["cityCouncilors"],
        'barangayCaptain': DataController().userData["my_candidates"]
            ["barangayCaptain"],
        'barangayCouncilors': DataController().userData["my_candidates"]
            ["barangayCouncilors"],
        'skChairman': DataController().userData["my_candidates"]["skChairman"],
      }
    });
  }

  Future<void> cacheMyPresident(String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString("president", id);
  }

  //VICE PRESIDENT
  setMyVicePresidentRunTime(String id) {
    DataController().userData["my_candidates"]["vicePresident"] = id;
    notifyListeners();
  }

  Future<void> storeMyVicePresidentToDb(String id) async {
    await user.doc(FirebaseAuth.instance.currentUser!.uid).update({
      "my_candidates": {
        "president": DataController().userData["my_candidates"]["president"],
        "vicePresident": id,
        'senators': DataController().userData["my_candidates"]["senators"],
        'houseRep': DataController().userData["my_candidates"]["houseRep"],
        'partyList': DataController().userData["my_candidates"]["partyList"],
        'governor': DataController().userData["my_candidates"]["governor"],
        'viceGovernor': DataController().userData["my_candidates"]
            ["viceGovernor"],
        'provincialBoard': DataController().userData["my_candidates"]
            ["provincialBoard"],
        'mayor': DataController().userData["my_candidates"]["mayor"],
        'viceMayor': DataController().userData["my_candidates"]["viceMayor"],
        'cityCouncilors': DataController().userData["my_candidates"]
            ["cityCouncilors"],
        'barangayCaptain': DataController().userData["my_candidates"]
            ["barangayCaptain"],
        'barangayCouncilors': DataController().userData["my_candidates"]
            ["barangayCouncilors"],
        'skChairman': DataController().userData["my_candidates"]["skChairman"],
      }
    });
  }

  Future<void> cacheMyVicePresident(String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString("vicePresident", id);
  }

  //HOUSE OF REPRESENTATIVES
  setMyHORRunTime(String id) {
    DataController().userData["my_candidates"]["houseRep"] = id;
    notifyListeners();
  }

  Future<void> storeMyHORToDb(String id) async {
    await user.doc(FirebaseAuth.instance.currentUser!.uid).update({
      "my_candidates": {
        "president": DataController().userData["my_candidates"]["president"],
        "vicePresident": DataController().userData["my_candidates"]
            ["vicePresident"],
        'senators': DataController().userData["my_candidates"]["senators"],
        'houseRep': id,
        'partyList': DataController().userData["my_candidates"]["partyList"],
        'governor': DataController().userData["my_candidates"]["governor"],
        'viceGovernor': DataController().userData["my_candidates"]
            ["viceGovernor"],
        'provincialBoard': DataController().userData["my_candidates"]
            ["provincialBoard"],
        'mayor': DataController().userData["my_candidates"]["mayor"],
        'viceMayor': DataController().userData["my_candidates"]["viceMayor"],
        'cityCouncilors': DataController().userData["my_candidates"]
            ["cityCouncilors"],
        'barangayCaptain': DataController().userData["my_candidates"]
            ["barangayCaptain"],
        'barangayCouncilors': DataController().userData["my_candidates"]
            ["barangayCouncilors"],
        'skChairman': DataController().userData["my_candidates"]["skChairman"],
      }
    });
  }

  Future<void> cacheMyHOR(String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString("houseRep", id);
  }

  //PARTY LIST
  setMyPartyListRunTime(String id) {
    DataController().userData["my_candidates"]["partyList"] = id;
    notifyListeners();
  }

  Future<void> storeMyPartyListToDb(String id) async {
    await user.doc(FirebaseAuth.instance.currentUser!.uid).update({
      "my_candidates": {
        "president": DataController().userData["my_candidates"]["president"],
        "vicePresident": DataController().userData["my_candidates"]
            ["vicePresident"],
        'senators': DataController().userData["my_candidates"]["senators"],
        'houseRep': DataController().userData["my_candidates"]["houseRep"],
        'partyList': id,
        'governor': DataController().userData["my_candidates"]["governor"],
        'viceGovernor': DataController().userData["my_candidates"]
            ["viceGovernor"],
        'provincialBoard': DataController().userData["my_candidates"]
            ["provincialBoard"],
        'mayor': DataController().userData["my_candidates"]["mayor"],
        'viceMayor': DataController().userData["my_candidates"]["viceMayor"],
        'cityCouncilors': DataController().userData["my_candidates"]
            ["cityCouncilors"],
        'barangayCaptain': DataController().userData["my_candidates"]
            ["barangayCaptain"],
        'barangayCouncilors': DataController().userData["my_candidates"]
            ["barangayCouncilors"],
        'skChairman': DataController().userData["my_candidates"]["skChairman"],
      }
    });
  }

  Future<void> cacheMyPartyList(String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString("partyList", id);
  }

  //GOVERNOR
  setMyGovernorRunTime(String id) {
    DataController().userData["my_candidates"]["governor"] = id;
    notifyListeners();
  }

  Future<void> storeMyGovernorToDb(String id) async {
    await user.doc(FirebaseAuth.instance.currentUser!.uid).update({
      "my_candidates": {
        "president": DataController().userData["my_candidates"]["president"],
        "vicePresident": DataController().userData["my_candidates"]
            ["vicePresident"],
        'senators': DataController().userData["my_candidates"]["senators"],
        'houseRep': DataController().userData["my_candidates"]["houseRep"],
        'partyList': DataController().userData["my_candidates"]["partyList"],
        'governor': id,
        'viceGovernor': DataController().userData["my_candidates"]
            ["viceGovernor"],
        'provincialBoard': DataController().userData["my_candidates"]
            ["provincialBoard"],
        'mayor': DataController().userData["my_candidates"]["mayor"],
        'viceMayor': DataController().userData["my_candidates"]["viceMayor"],
        'cityCouncilors': DataController().userData["my_candidates"]
            ["cityCouncilors"],
        'barangayCaptain': DataController().userData["my_candidates"]
            ["barangayCaptain"],
        'barangayCouncilors': DataController().userData["my_candidates"]
            ["barangayCouncilors"],
        'skChairman': DataController().userData["my_candidates"]["skChairman"],
      }
    });
  }

  Future<void> cacheMyGovernor(String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString("governor", id);
  }

  //VICE GOVERNOR
  setMyViceGovernorRunTime(String id) {
    DataController().userData["my_candidates"]["viceGovernor"] = id;
    notifyListeners();
  }

  Future<void> storeMyViceGovernorToDb(String id) async {
    await user.doc(FirebaseAuth.instance.currentUser!.uid).update({
      "my_candidates": {
        "president": DataController().userData["my_candidates"]["president"],
        "vicePresident": DataController().userData["my_candidates"]
            ["vicePresident"],
        'senators': DataController().userData["my_candidates"]["senators"],
        'houseRep': DataController().userData["my_candidates"]["houseRep"],
        'partyList': DataController().userData["my_candidates"]["partyList"],
        'governor': DataController().userData["my_candidates"]["governor"],
        'viceGovernor': id,
        'provincialBoard': DataController().userData["my_candidates"]
            ["provincialBoard"],
        'mayor': DataController().userData["my_candidates"]["mayor"],
        'viceMayor': DataController().userData["my_candidates"]["viceMayor"],
        'cityCouncilors': DataController().userData["my_candidates"]
            ["cityCouncilors"],
        'barangayCaptain': DataController().userData["my_candidates"]
            ["barangayCaptain"],
        'barangayCouncilors': DataController().userData["my_candidates"]
            ["barangayCouncilors"],
        'skChairman': DataController().userData["my_candidates"]["skChairman"],
      }
    });
  }

  Future<void> cacheMyViceGovernor(String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString("viceGovernor", id);
  }

  //MAYOR
  setMyMayorRunTime(String id) {
    DataController().userData["my_candidates"]["mayor"] = id;
    notifyListeners();
  }

  Future<void> storeMyMayorToDb(String id) async {
    await user.doc(FirebaseAuth.instance.currentUser!.uid).update({
      "my_candidates": {
        "president": DataController().userData["my_candidates"]["president"],
        "vicePresident": DataController().userData["my_candidates"]
            ["vicePresident"],
        'senators': DataController().userData["my_candidates"]["senators"],
        'houseRep': DataController().userData["my_candidates"]["houseRep"],
        'partyList': DataController().userData["my_candidates"]["partyList"],
        'governor': DataController().userData["my_candidates"]["governor"],
        'viceGovernor': DataController().userData["my_candidates"]
            ["viceGovernor"],
        'provincialBoard': DataController().userData["my_candidates"]
            ["provincialBoard"],
        'mayor': id,
        'viceMayor': DataController().userData["my_candidates"]["viceMayor"],
        'cityCouncilors': DataController().userData["my_candidates"]
            ["cityCouncilors"],
        'barangayCaptain': DataController().userData["my_candidates"]
            ["barangayCaptain"],
        'barangayCouncilors': DataController().userData["my_candidates"]
            ["barangayCouncilors"],
        'skChairman': DataController().userData["my_candidates"]["skChairman"],
      }
    });
  }

  Future<void> cacheMyMayor(String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString("mayor", id);
  }

  //VICE MAYOR
  setMyViceMayorRunTime(String id) {
    DataController().userData["my_candidates"]["viceMayor"] = id;
    notifyListeners();
  }

  Future<void> storeMyViceMayorToDb(String id) async {
    await user.doc(FirebaseAuth.instance.currentUser!.uid).update({
      "my_candidates": {
        "president": DataController().userData["my_candidates"]["president"],
        "vicePresident": DataController().userData["my_candidates"]
            ["vicePresident"],
        'senators': DataController().userData["my_candidates"]["senators"],
        'houseRep': DataController().userData["my_candidates"]["houseRep"],
        'partyList': DataController().userData["my_candidates"]["partyList"],
        'governor': DataController().userData["my_candidates"]["governor"],
        'viceGovernor': DataController().userData["my_candidates"]
            ["viceGovernor"],
        'provincialBoard': DataController().userData["my_candidates"]
            ["provincialBoard"],
        'mayor': DataController().userData["my_candidates"]["mayor"],
        'viceMayor': id,
        'cityCouncilors': DataController().userData["my_candidates"]
            ["cityCouncilors"],
        'barangayCaptain': DataController().userData["my_candidates"]
            ["barangayCaptain"],
        'barangayCouncilors': DataController().userData["my_candidates"]
            ["barangayCouncilors"],
        'skChairman': DataController().userData["my_candidates"]["skChairman"],
      }
    });
  }

  Future<void> cacheMyViceMayor(String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString("viceMayor", id);
  }

  Map<String, dynamic> _mappedData = {};

  final Map<String, dynamic> _myNationalData = {};

  Map<String, dynamic> get myNationalData => _myNationalData;

  //GETTING MY PRESIDENT DATA
  Future<void> readPresident(String id) async {
    final String response =
        await rootBundle.loadString('assets/data/candidates/PRESIDENT.json');
    final data = await json.decode(response);

    _mappedData = data;
    _getMyPresident(id);
  }

  void _getMyPresident(String id) {
    Map<String, dynamic> temp = {};
    temp.addAll({
      "president": CandidateData(
        id: id,
        name: _mappedData[id]["name"],
        sex: _mappedData[id]["sex"],
        imgURL: _mappedData[id]["imgURL"] ?? "",
        filedCandidacies: _mappedData[id]["filed_candidacies"],
        houseBills: _mappedData[id]["house_bills"],
        senateBills: _mappedData[id]["senate_bills"],
        profileURL: _mappedData[id]["profile_url"] ?? '',
      ),
    });

    _myNationalData.addAll(temp);
    notifyListeners();
  }

  //GETTING MY VICE PRESIDENT DATA
  Future<void> readVicePresident(String id) async {
    final String response = await rootBundle
        .loadString('assets/data/candidates/VICE-PRESIDENT.json');
    final data = await json.decode(response);

    _mappedData = data;

    _getMyVicePresident(id);
  }

  void _getMyVicePresident(String id) {
    Map<String, dynamic> temp = {};
    temp.addAll({
      "vicePresident": CandidateData(
        id: id,
        name: _mappedData[id]["name"],
        sex: _mappedData[id]["sex"],
        imgURL: _mappedData[id]["imgURL"] ?? "",
        filedCandidacies: _mappedData[id]["filed_candidacies"],
        houseBills: _mappedData[id]["house_bills"],
        senateBills: _mappedData[id]["senate_bills"],
        profileURL: _mappedData[id]["profile_url"] ?? '',
      ),
    });

    _myNationalData.addAll(temp);
    notifyListeners();
  }

  //GETTING MY HOUSE OF REPRESENTATIVES
  Future<void> readHouseOfReps(String id) async {
    final String response = await rootBundle.loadString(
        'assets/data/candidates/MEMBER, HOUSE OF REPRESENTATIVES.json');
    final data = await json.decode(response);

    _mappedData = data;
    _getHouseOfRep(id);
  }

  void _getHouseOfRep(String id) {
    Map<String, dynamic> temp = {};
    temp.addAll({
      "houseRep": CandidateData(
        id: id,
        name: _mappedData[id]["name"],
        sex: _mappedData[id]["sex"],
        imgURL: _mappedData[id]["imgURL"] ?? "",
        filedCandidacies: _mappedData[id]["filed_candidacies"],
        houseBills: _mappedData[id]["house_bills"],
        senateBills: _mappedData[id]["senate_bills"],
        profileURL: _mappedData[id]["profile_url"] ?? '',
      ),
    });

    _myNationalData.addAll(temp);
    notifyListeners();
  }

  //GETTING MY PARTY LIST
  Future<void> readPartyList(String id) async {
    final String response =
        await rootBundle.loadString('assets/data/candidates/PARTY LIST.json');
    final data = await json.decode(response);

    _mappedData = data;

    _getPartyList(id);
  }

  void _getPartyList(String id) {
    Map<String, dynamic> temp = {};
    temp.addAll({
      "partyList": CandidateData(
        id: id,
        name: _mappedData[id]["name"],
        sex: _mappedData[id]["sex"] ?? "",
        imgURL: _mappedData[id]["imgURL"] ?? "",
        filedCandidacies: _mappedData[id]["filed_candidacies"],
        houseBills: _mappedData[id]["house_bills"],
        senateBills: _mappedData[id]["senate_bills"],
        profileURL: _mappedData[id]["profile_url"] ?? '',
      ),
    });

    _myNationalData.addAll(temp);
    notifyListeners();
  }
}
