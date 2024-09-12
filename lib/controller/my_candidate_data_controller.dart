import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:veripol/controller/candidate_data_controller.dart';
import 'package:veripol/controller/data_controller.dart';

import '../components/dialog_boxes.dart';
import '../components/my_candidate_add_button.dart';
import '../components/my_candidate_selected_card.dart';
import '../components/themes.dart';
import '../models/models.dart';
import '../views/candidates/add_candidate.dart';
import '../views/splash/splash.dart';
import 'pagination_controllers.dart';

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

  //my candidate data count

  //national
  int _myPresident = 0;
  int _myVicePresident = 0;
  int _mySenators = 0;
  int _myHouseOfRep = 0;
  int _myPartyList = 0;

  //provincial
  int _myGovernor = 0;
  int _myViceGovernor = 0;
  int _myProvincialBoards = 0;

  //municipal
  int _myMayor = 0;
  int _myViceMayor = 0;
  int _myCouncilors = 0;

  int _myNationalCandidates = 0;
  int _myProvincialCandidates = 0;
  int _myMunicipalCandidates = 0;
  int _myTotalCandidates = 0;

  //getting my candidate counts
  int get myNationalCandidates => _myNationalCandidates;
  int get myProvincialCandidates => _myProvincialCandidates;
  int get myMunicipalCandidates => _myMunicipalCandidates;
  int get myTotalCandidates => _myTotalCandidates;

  _setMyTotalCandidates() {
    _myTotalCandidates = _myNationalCandidates + _myProvincialCandidates + _myMunicipalCandidates;
  }

  _setMyNationalCandidates() {
    _myNationalCandidates = _myPresident + _myVicePresident + _mySenators + _myHouseOfRep + _myPartyList;
  }

  _setMyProvincialCandidates() {
    _myProvincialCandidates = _myGovernor + _myViceGovernor + _myProvincialBoards;
  }

  _setMyMunicipalCandidates() {
    _myMunicipalCandidates = _myMayor + _myViceMayor + _myCouncilors;
  }

  setMyPresident(int num) {
    _myPresident = num;
    _setMyNationalCandidates();
    _setMyTotalCandidates();
    notifyListeners();
  }

  initMyPresident(int num) {
    _myPresident = num;
    _setMyNationalCandidates();
    _setMyTotalCandidates();
  }

  setMyVicePresident(int num) {
    _myVicePresident = num;
    _setMyNationalCandidates();
    _setMyTotalCandidates();
    notifyListeners();
  }

  initMyVicePresident(int num) {
    _myVicePresident = num;
    _setMyNationalCandidates();
    _setMyTotalCandidates();
  }

  setMySenators(int num) {
    _mySenators = num;
    _setMyNationalCandidates();
    _setMyTotalCandidates();
    notifyListeners();
  }

  initMySenators(int num) {
    _mySenators = num;
    _setMyNationalCandidates();
    _setMyTotalCandidates();
  }

  setMyHouseReps(int num) {
    _myHouseOfRep = num;
    _setMyNationalCandidates();
    _setMyTotalCandidates();
    notifyListeners();
  }

  initMyHouseReps(int num) {
    _myHouseOfRep = num;
    _setMyNationalCandidates();
    _setMyTotalCandidates();
  }

  setMyPartyList(int num) {
    _myPartyList = num;
    _setMyNationalCandidates();
    _setMyTotalCandidates();
    notifyListeners();
  }

  initMyPartyList(int num) {
    _myPartyList = num;
    _setMyNationalCandidates();
    _setMyTotalCandidates();
  }

  setMyGovernor(int num) {
    _myGovernor = num;
    _setMyProvincialCandidates();
    _setMyTotalCandidates();
    notifyListeners();
  }

  initMyGovernor(int num) {
    _myGovernor = num;
    _setMyProvincialCandidates();
    _setMyTotalCandidates();
  }

  setMyViceGovernor(int num) {
    _myViceGovernor = num;
    _setMyProvincialCandidates();
    _setMyTotalCandidates();
    notifyListeners();
  }

  initMyViceGovernor(int num) {
    _myViceGovernor = num;
    _setMyProvincialCandidates();
    _setMyTotalCandidates();
  }

  setMyProvincialBoards(int num) {
    _myProvincialBoards = num;
    _setMyProvincialCandidates();
    _setMyTotalCandidates();
    notifyListeners();
  }

  initMyProvincialBoards(int num) {
    _myProvincialBoards = num;
    _setMyProvincialCandidates();
    _setMyTotalCandidates();
  }

  setMyMayor(int num) {
    _myMayor = num;
    _setMyMunicipalCandidates();
    _setMyTotalCandidates();
    notifyListeners();
  }

  initMyMayor(int num) {
    _myMayor = num;
    _setMyMunicipalCandidates();
    _setMyTotalCandidates();
  }

  setMyViceMayor(int num) {
    _myViceMayor = num;
    _setMyMunicipalCandidates();
    _setMyTotalCandidates();
    notifyListeners();
  }

  initMyViceMayor(int num) {
    _myViceMayor = num;
    _setMyMunicipalCandidates();
    _setMyTotalCandidates();
  }

  setMyCouncilors(int num) {
    _myCouncilors = num;
    _setMyMunicipalCandidates();
    _setMyTotalCandidates();
    notifyListeners();
  }

  initMyCouncilors(int num) {
    _myCouncilors = num;
    _setMyMunicipalCandidates();
    _setMyTotalCandidates();
  }

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
    if (CandidateDataController().highlyUrbanizedCities.contains(DataController().city)) {
      _totalCandidates = _nationalCandidates + _municipalCandidates;
    } else {
      _totalCandidates = _nationalCandidates + _provincialCandidates + _municipalCandidates;
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
      if (candidate.filedCandidacies["May 9, 2022"]["location"]["municipality"] != null) {
        if (!temporaryDistricts.contains(
            "(${candidate.filedCandidacies["May 9, 2022"]["location"]["municipality"]})${candidate.filedCandidacies["May 9, 2022"]["location"]["district"]}")) {
          temporaryDistricts.add(
              "(${candidate.filedCandidacies["May 9, 2022"]["location"]["municipality"]})${candidate.filedCandidacies["May 9, 2022"]["location"]["district"]}");
        }
      } else {
        if (!temporaryDistricts.contains(candidate.filedCandidacies["May 9, 2022"]["location"]["district"])) {
          temporaryDistricts.add(candidate.filedCandidacies["May 9, 2022"]["location"]["district"]);
        }
      }
    }

    _houseOfRepDistricts = temporaryDistricts;
    notifyListeners();
  }

  _setHouseRepCount(List<CandidateData> data) {
    _houseOfRep = 1;
    _nationalCandidates = _president + _vicePresident + _senators + _houseOfRep + _partyList;

    notifyListeners();
  }

  int getHouseRepCount() {
    _houseOfRep = _nationalCandidates - (_president + _vicePresident + _senators + _partyList);
    return _houseOfRep;
  }

  //SETTING PROVINCIAL CANDIDATES COUNT
  Future<void> setProvincialCount() async {
    if (CandidateDataController().highlyUrbanizedCities.contains(DataController().city)) {
      _provincialCandidates = 0;
      _provincialBoardDistricts = [];
    } else {
      CandidateDataController().clearRunTimeData();
      await CandidateDataController().readProvincialBoard(DataController().province).whenComplete(
        () {
          _setProvincialBoard(CandidateDataController().candidates);
          _setProvincialBoardDistricts(CandidateDataController().candidates);
        },
      );
    }
  }

  _setProvincialBoard(List<CandidateData> data) {
    _provincialBoard = 2;
    _provincialCandidates = _governor + _viceGovernor + _provincialBoard;
    notifyListeners();
  }

  _setProvincialBoardDistricts(List<CandidateData> data) {
    String temp = "";
    List<String> temporaryDistricts = [];
    for (var candidate in data) {
      if (candidate.filedCandidacies["May 9, 2022"]["location"]["district"] != temp) {
        temp = candidate.filedCandidacies["May 9, 2022"]["location"]["district"];
        temporaryDistricts.add(temp);
      }
    }

    _provincialBoardDistricts = temporaryDistricts;

    notifyListeners();
  }

  //SETTING MUNICIPAL CANDIDATES COUNT
  Future<void> setMunicipalCount() async {
    CandidateDataController().clearRunTimeData();
    await CandidateDataController().readCouncilors(DataController().province, DataController().city).whenComplete(() {
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
    _councilors = perDistrictCount;

    _municipalCandidates = _mayor + _viceMayor + _councilors;
    notifyListeners();
  }

  _setCouncilorDistricts(List<CandidateData> data) {
    String temp = "";
    List<String> temporaryDistricts = [];
    for (var candidate in data) {
      if (candidate.filedCandidacies["May 9, 2022"]["location"]["district"] != temp) {
        temp = candidate.filedCandidacies["May 9, 2022"]["location"]["district"];
        temporaryDistricts.add(temp);
      }
    }

    _councilorDistricts = temporaryDistricts;
    notifyListeners();
  }

  Future<void> storeCandidateCountToDB() async {
    await FirebaseFirestore.instance.collection("User").doc(FirebaseAuth.instance.currentUser!.uid).update(({
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

  final CollectionReference user = FirebaseFirestore.instance.collection("User");

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
        "vicePresident": DataController().userData["my_candidates"]["vicePresident"],
        'senatorIndices': DataController().userData["my_candidates"]["senatorIndices"],
        'senators': DataController().userData["my_candidates"]["senators"],
        'houseRep': DataController().userData["my_candidates"]["houseRep"],
        'partyList': DataController().userData["my_candidates"]["partyList"],
        'governor': DataController().userData["my_candidates"]["governor"],
        'viceGovernor': DataController().userData["my_candidates"]["viceGovernor"],
        'provincialBoard': DataController().userData["my_candidates"]["provincialBoard"],
        'provincialBoardIndices': DataController().userData["my_candidates"]["provincialBoardIndices"],
        'mayor': DataController().userData["my_candidates"]["mayor"],
        'viceMayor': DataController().userData["my_candidates"]["viceMayor"],
        'cityCouncilors': DataController().userData["my_candidates"]["cityCouncilors"],
        'cityCouncilorIndices': DataController().userData["my_candidates"]["cityCouncilorIndices"],
        'barangayCaptain': DataController().userData["my_candidates"]["barangayCaptain"],
        'barangayCouncilors': DataController().userData["my_candidates"]["barangayCouncilors"],
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
        'senatorIndices': DataController().userData["my_candidates"]["senatorIndices"],
        'senators': DataController().userData["my_candidates"]["senators"],
        'houseRep': DataController().userData["my_candidates"]["houseRep"],
        'partyList': DataController().userData["my_candidates"]["partyList"],
        'governor': DataController().userData["my_candidates"]["governor"],
        'viceGovernor': DataController().userData["my_candidates"]["viceGovernor"],
        'provincialBoard': DataController().userData["my_candidates"]["provincialBoard"],
        'provincialBoardIndices': DataController().userData["my_candidates"]["provincialBoardIndices"],
        'mayor': DataController().userData["my_candidates"]["mayor"],
        'viceMayor': DataController().userData["my_candidates"]["viceMayor"],
        'cityCouncilors': DataController().userData["my_candidates"]["cityCouncilors"],
        'cityCouncilorIndices': DataController().userData["my_candidates"]["cityCouncilorIndices"],
        'barangayCaptain': DataController().userData["my_candidates"]["barangayCaptain"],
        'barangayCouncilors': DataController().userData["my_candidates"]["barangayCouncilors"],
        'skChairman': DataController().userData["my_candidates"]["skChairman"],
      }
    });
  }

  Future<void> cacheMyVicePresident(String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString("vicePresident", id);
  }

  //ASSIGN THE CACHED DATA TO THE MY SENATOR LIST FIRST
  //BEFORE UPDATING THE DATA TO THE DB

  List<String> _mySenatorsList = [];
  List<int> _mySenatorIndices = [];

  List<String> get mySenatorsList => _mySenatorsList;
  List<int> get mySenatorIndices => _mySenatorIndices;

  initMySenatorList(List<String> senators) {
    _mySenatorsList = senators;
  }

  initMySenatorIndices(List<String> senatorIndices) {
    List<int> temp = [];
    for (var index in senatorIndices) {
      temp.add(int.parse(index));
    }

    _mySenatorIndices = temp;
  }

  setMySenatorsList(id) {
    if (mySenatorsList.length != 12) {
      mySenatorsList.add(id);
    } else {
      mySenatorsList.removeAt(0);
      mySenatorsList.add(id);
    }
    notifyListeners();
  }

  removeSenator(id) {
    _mySenatorsList.remove(id);

    notifyListeners();
  }

  setMySenatorIndices(int num) {
    _mySenatorIndices.add(num);
    notifyListeners();
  }

  removeMySenatorIndex(int index) {
    _mySenatorIndices.remove(index);
  }

  //SENATORS
  setMySenatorsRunTime(List<String> id, List<int> senatorIndices) {
    List<String> temp = [];
    for (var index in senatorIndices) {
      temp.add(index.toString());
    }
    DataController().userData["my_candidates"]["senators"] = id;
    DataController().userData["my_candidates"]["senatorIndices"] = temp;
    setMySenators(id.length);
    notifyListeners();
  }

  Future<void> storeMySenatorsToDb() async {
    List<String> temp = [];
    for (var index in _mySenatorIndices) {
      temp.add(index.toString());
    }
    await user.doc(FirebaseAuth.instance.currentUser!.uid).update({
      "my_candidates": {
        "president": DataController().userData["my_candidates"]["president"],
        "vicePresident": DataController().userData["my_candidates"]["vicePresident"],
        'senators': _mySenatorsList,
        'senatorIndices': temp,
        'houseRep': DataController().userData["my_candidates"]["houseRep"],
        'partyList': DataController().userData["my_candidates"]["partyList"],
        'governor': DataController().userData["my_candidates"]["governor"],
        'viceGovernor': DataController().userData["my_candidates"]["viceGovernor"],
        'provincialBoard': DataController().userData["my_candidates"]["provincialBoard"],
        'provincialBoardIndices': DataController().userData["my_candidates"]["provincialBoardIndices"],
        'mayor': DataController().userData["my_candidates"]["mayor"],
        'viceMayor': DataController().userData["my_candidates"]["viceMayor"],
        'cityCouncilors': DataController().userData["my_candidates"]["cityCouncilors"],
        'cityCouncilorIndices': DataController().userData["my_candidates"]["cityCouncilorIndices"],
        'barangayCaptain': DataController().userData["my_candidates"]["barangayCaptain"],
        'barangayCouncilors': DataController().userData["my_candidates"]["barangayCouncilors"],
        'skChairman': DataController().userData["my_candidates"]["skChairman"],
      }
    });
  }

  Future<void> cacheMySenatorsList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> temp = [];
    for (var index in _mySenatorIndices) {
      temp.add(index.toString());
    }

    await prefs.setStringList("senators", _mySenatorsList);
    await prefs.setStringList("senatorIndices", temp);
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
        "vicePresident": DataController().userData["my_candidates"]["vicePresident"],
        'senatorIndices': DataController().userData["my_candidates"]["senatorIndices"],
        'senators': DataController().userData["my_candidates"]["senators"],
        'houseRep': id,
        'partyList': DataController().userData["my_candidates"]["partyList"],
        'governor': DataController().userData["my_candidates"]["governor"],
        'viceGovernor': DataController().userData["my_candidates"]["viceGovernor"],
        'provincialBoard': DataController().userData["my_candidates"]["provincialBoard"],
        'provincialBoardIndices': DataController().userData["my_candidates"]["provincialBoardIndices"],
        'mayor': DataController().userData["my_candidates"]["mayor"],
        'viceMayor': DataController().userData["my_candidates"]["viceMayor"],
        'cityCouncilors': DataController().userData["my_candidates"]["cityCouncilors"],
        'cityCouncilorIndices': DataController().userData["my_candidates"]["cityCouncilorIndices"],
        'barangayCaptain': DataController().userData["my_candidates"]["barangayCaptain"],
        'barangayCouncilors': DataController().userData["my_candidates"]["barangayCouncilors"],
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
        "vicePresident": DataController().userData["my_candidates"]["vicePresident"],
        'senatorIndices': DataController().userData["my_candidates"]["senatorIndices"],
        'senators': DataController().userData["my_candidates"]["senators"],
        'houseRep': DataController().userData["my_candidates"]["houseRep"],
        'partyList': id,
        'governor': DataController().userData["my_candidates"]["governor"],
        'viceGovernor': DataController().userData["my_candidates"]["viceGovernor"],
        'provincialBoard': DataController().userData["my_candidates"]["provincialBoard"],
        'provincialBoardIndices': DataController().userData["my_candidates"]["provincialBoardIndices"],
        'mayor': DataController().userData["my_candidates"]["mayor"],
        'viceMayor': DataController().userData["my_candidates"]["viceMayor"],
        'cityCouncilors': DataController().userData["my_candidates"]["cityCouncilors"],
        'cityCouncilorIndices': DataController().userData["my_candidates"]["cityCouncilorIndices"],
        'barangayCaptain': DataController().userData["my_candidates"]["barangayCaptain"],
        'barangayCouncilors': DataController().userData["my_candidates"]["barangayCouncilors"],
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
        "vicePresident": DataController().userData["my_candidates"]["vicePresident"],
        'senators': DataController().userData["my_candidates"]["senators"],
        'houseRep': DataController().userData["my_candidates"]["houseRep"],
        'partyList': DataController().userData["my_candidates"]["partyList"],
        'governor': id,
        'senatorIndices': DataController().userData["my_candidates"]["senatorIndices"],
        'viceGovernor': DataController().userData["my_candidates"]["viceGovernor"],
        'provincialBoard': DataController().userData["my_candidates"]["provincialBoard"],
        'provincialBoardIndices': DataController().userData["my_candidates"]["provincialBoardIndices"],
        'mayor': DataController().userData["my_candidates"]["mayor"],
        'viceMayor': DataController().userData["my_candidates"]["viceMayor"],
        'cityCouncilors': DataController().userData["my_candidates"]["cityCouncilors"],
        'cityCouncilorIndices': DataController().userData["my_candidates"]["cityCouncilorIndices"],
        'barangayCaptain': DataController().userData["my_candidates"]["barangayCaptain"],
        'barangayCouncilors': DataController().userData["my_candidates"]["barangayCouncilors"],
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
        "vicePresident": DataController().userData["my_candidates"]["vicePresident"],
        'senatorIndices': DataController().userData["my_candidates"]["senatorIndices"],
        'senators': DataController().userData["my_candidates"]["senators"],
        'houseRep': DataController().userData["my_candidates"]["houseRep"],
        'partyList': DataController().userData["my_candidates"]["partyList"],
        'governor': DataController().userData["my_candidates"]["governor"],
        'viceGovernor': id,
        'provincialBoard': DataController().userData["my_candidates"]["provincialBoard"],
        'provincialBoardIndices': DataController().userData["my_candidates"]["provincialBoardIndices"],
        'mayor': DataController().userData["my_candidates"]["mayor"],
        'viceMayor': DataController().userData["my_candidates"]["viceMayor"],
        'cityCouncilors': DataController().userData["my_candidates"]["cityCouncilors"],
        'cityCouncilorIndices': DataController().userData["my_candidates"]["cityCouncilorIndices"],
        'barangayCaptain': DataController().userData["my_candidates"]["barangayCaptain"],
        'barangayCouncilors': DataController().userData["my_candidates"]["barangayCouncilors"],
        'skChairman': DataController().userData["my_candidates"]["skChairman"],
      }
    });
  }

  Future<void> cacheMyViceGovernor(String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString("viceGovernor", id);
  }

  //METHODS FOR PROVINCIAL BOARD DYNAMIC DATA DISPLAY
  List<String> _myProvincialBoardList = [];
  List<int> _myProvincialBoardIndices = [];

  List<String> get myProvincialBoardList => _myProvincialBoardList;
  List<int> get myProvincialBoardIndices => _myProvincialBoardIndices;

  initMyProvincialBoardList(List<String> provincialBoard) {
    _myProvincialBoardList = provincialBoard;
  }

  initMyProvincialBoardIndices(List<String> provincialBoardIndices) {
    List<int> temp = [];
    for (var index in provincialBoardIndices) {
      temp.add(int.parse(index));
    }

    _myProvincialBoardIndices = temp;
  }

  setMyProvincialBoardList(id) {
    if (_myProvincialBoardList.length != 2) {
      _myProvincialBoardList.add(id);
    } else {
      _myProvincialBoardList.removeAt(0);
      _myProvincialBoardList.add(id);
    }

    notifyListeners();
  }

  removeProvincialBoard(id) {
    _myProvincialBoardList.remove(id);
    notifyListeners();
  }

  setMyProvincialBoardIndices(int num) {
    _myProvincialBoardIndices.add(num);
    notifyListeners();
  }

  removeMyProvincialBoardIndex(int index) {
    _myProvincialBoardIndices.remove(index);
  }

  setMyProvincialBoardRunTime(List<String> id, List<int> provincialBoardIndices) {
    List<String> temp = [];
    for (var index in provincialBoardIndices) {
      temp.add(index.toString());
    }
    setMyProvincialBoards(id.length);
    DataController().userData["my_candidates"]["provincialBoard"] = id;
    DataController().userData["my_candidates"]["provincialBoardIndices"] = temp;
    notifyListeners();
  }

  Future<void> storeMyProvincialBoardToDb() async {
    List<String> temp = [];
    for (var index in _myProvincialBoardIndices) {
      temp.add(index.toString());
    }
    await user.doc(FirebaseAuth.instance.currentUser!.uid).update({
      "my_candidates": {
        "president": DataController().userData["my_candidates"]["president"],
        "vicePresident": DataController().userData["my_candidates"]["vicePresident"],
        'senators': DataController().userData["my_candidates"]["senators"],
        'senatorIndices': DataController().userData["my_candidates"]["senatorIndices"],
        'houseRep': DataController().userData["my_candidates"]["houseRep"],
        'partyList': DataController().userData["my_candidates"]["partyList"],
        'governor': DataController().userData["my_candidates"]["governor"],
        'viceGovernor': DataController().userData["my_candidates"]["viceGovernor"],
        'provincialBoard': _myProvincialBoardList,
        'provincialBoardIndices': temp,
        'mayor': DataController().userData["my_candidates"]["mayor"],
        'viceMayor': DataController().userData["my_candidates"]["viceMayor"],
        'cityCouncilors': DataController().userData["my_candidates"]["cityCouncilors"],
        'cityCouncilorIndices': DataController().userData["my_candidates"]["cityCouncilorIndices"],
        'barangayCaptain': DataController().userData["my_candidates"]["barangayCaptain"],
        'barangayCouncilors': DataController().userData["my_candidates"]["barangayCouncilors"],
        'skChairman': DataController().userData["my_candidates"]["skChairman"],
      }
    });
  }

  Future<void> cacheMyProvincivalBoardList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> temp = [];
    for (var index in _myProvincialBoardIndices) {
      temp.add(index.toString());
    }

    await prefs.setStringList("provincialBoard", _myProvincialBoardList);
    await prefs.setStringList("provincialBoardIndices", temp);
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
        "vicePresident": DataController().userData["my_candidates"]["vicePresident"],
        'senatorIndices': DataController().userData["my_candidates"]["senatorIndices"],
        'senators': DataController().userData["my_candidates"]["senators"],
        'houseRep': DataController().userData["my_candidates"]["houseRep"],
        'partyList': DataController().userData["my_candidates"]["partyList"],
        'governor': DataController().userData["my_candidates"]["governor"],
        'viceGovernor': DataController().userData["my_candidates"]["viceGovernor"],
        'provincialBoard': DataController().userData["my_candidates"]["provincialBoard"],
        'provincialBoardIndices': DataController().userData["my_candidates"]["provincialBoardIndices"],
        'mayor': id,
        'viceMayor': DataController().userData["my_candidates"]["viceMayor"],
        'cityCouncilors': DataController().userData["my_candidates"]["cityCouncilors"],
        'cityCouncilorIndices': DataController().userData["my_candidates"]["cityCouncilorIndices"],
        'barangayCaptain': DataController().userData["my_candidates"]["barangayCaptain"],
        'barangayCouncilors': DataController().userData["my_candidates"]["barangayCouncilors"],
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
        "vicePresident": DataController().userData["my_candidates"]["vicePresident"],
        'senatorIndices': DataController().userData["my_candidates"]["senatorIndices"],
        'senators': DataController().userData["my_candidates"]["senators"],
        'houseRep': DataController().userData["my_candidates"]["houseRep"],
        'partyList': DataController().userData["my_candidates"]["partyList"],
        'governor': DataController().userData["my_candidates"]["governor"],
        'viceGovernor': DataController().userData["my_candidates"]["viceGovernor"],
        'provincialBoard': DataController().userData["my_candidates"]["provincialBoard"],
        'provincialBoardIndices': DataController().userData["my_candidates"]["provincialBoardIndices"],
        'mayor': DataController().userData["my_candidates"]["mayor"],
        'viceMayor': id,
        'cityCouncilors': DataController().userData["my_candidates"]["cityCouncilors"],
        'cityCouncilorIndices': DataController().userData["my_candidates"]["cityCouncilorIndices"],
        'barangayCaptain': DataController().userData["my_candidates"]["barangayCaptain"],
        'barangayCouncilors': DataController().userData["my_candidates"]["barangayCouncilors"],
        'skChairman': DataController().userData["my_candidates"]["skChairman"],
      }
    });
  }

  Future<void> cacheMyViceMayor(String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString("viceMayor", id);
  }

  //METHODS FOR COUNCILORS DYNAMIC DATA DISPLAY
  List<String> _myCouncilorList = [];
  final List<int> _myCouncilorIndices = [];

  List<String> get myCouncilorList => _myCouncilorList;
  List<int> get myCouncilorIndices => _myCouncilorIndices;

  initMyCouncilorsList(List<String> councilors) {
    _myCouncilorList = councilors;
  }

  initMyCouncilorsIndices(List<String> councilorIndices) {
    List<int> temp = [];
    for (var index in councilorIndices) {
      temp.add(int.parse(index));
    }

    _myCouncilorIndices.clear();
    _myCouncilorIndices.addAll(temp);
  }

  setMyCouncilorsList(id) {
    if (_myCouncilorList.length != _councilors) {
      _myCouncilorList.add(id);
    } else {
      _myCouncilorList.removeAt(0);
      _myCouncilorList.add(id);
    }

    notifyListeners();
  }

  removeCouncilor(id) {
    _myCouncilorList.remove(id);
    notifyListeners();
  }

  setMyCouncilorIndices(int num) {
    _myCouncilorIndices.add(num);
    notifyListeners();
  }

  removeMyCouncilorIndex(int index) {
    _myCouncilorIndices.remove(index);
  }

  setMyCouncilorRunTime(List<String> id, List<int> councilorIndices) {
    List<String> temp = [];
    for (var index in councilorIndices) {
      temp.add(index.toString());
    }
    DataController().userData["my_candidates"]["cityCouncilors"] = id;
    DataController().userData["my_candidates"]["cityCouncilorIndices"] = temp;
    setMyCouncilors(id.length);
    notifyListeners();
  }

  Future<void> storeMyCouncilorsToDb() async {
    List<String> temp = [];
    for (var index in _myCouncilorIndices) {
      temp.add(index.toString());
    }
    await user.doc(FirebaseAuth.instance.currentUser!.uid).update({
      "my_candidates": {
        "president": DataController().userData["my_candidates"]["president"],
        "vicePresident": DataController().userData["my_candidates"]["vicePresident"],
        'senators': DataController().userData["my_candidates"]["senators"],
        'senatorIndices': DataController().userData["my_candidates"]["senatorIndices"],
        'houseRep': DataController().userData["my_candidates"]["houseRep"],
        'partyList': DataController().userData["my_candidates"]["partyList"],
        'governor': DataController().userData["my_candidates"]["governor"],
        'viceGovernor': DataController().userData["my_candidates"]["viceGovernor"],
        'provincialBoard': DataController().userData["my_candidates"]["provincialBoard"],
        'provincialBoardIndices': DataController().userData["my_candidates"]["provincialBoardIndices"],
        'mayor': DataController().userData["my_candidates"]["mayor"],
        'viceMayor': DataController().userData["my_candidates"]["viceMayor"],
        'cityCouncilors': _myCouncilorList,
        'cityCouncilorIndices': temp,
        'barangayCaptain': DataController().userData["my_candidates"]["barangayCaptain"],
        'barangayCouncilors': DataController().userData["my_candidates"]["barangayCouncilors"],
        'skChairman': DataController().userData["my_candidates"]["skChairman"],
      }
    });
  }

  Future<void> cacheMyCouncilorsList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> temp = [];
    for (var index in _myCouncilorIndices) {
      temp.add(index.toString());
    }

    await prefs.setStringList("cityCouncilors", _myCouncilorList);
    await prefs.setStringList("cityCouncilorIndices", temp);
  }

  Map<String, dynamic> _mappedData = {};

  final Map<String, dynamic> _myNationalData = {};

  Map<String, dynamic> get myNationalData => _myNationalData;

  //GETTING MY PRESIDENT DATA
  Future<void> readPresident(String id) async {
    final String response = await rootBundle.loadString('assets/data/candidates/PRESIDENT.json');
    final data = await json.decode(response);

    _mappedData = data;
    notifyListeners();
  }

  void getMyPresident(String id) {
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

  setMyPresidentDataToNull() {
    _myNationalData.update("president", (value) => null);
    notifyListeners();
  }

  //INIT MY PRESIDENT DATA
  //GETTING MY PRESIDENT DATA
  Future<void> initReadPresident(String id) async {
    final String response = await rootBundle.loadString('assets/data/candidates/PRESIDENT.json');
    final data = await json.decode(response);

    _mappedData = data;
    _initGetMyPresident(id);
  }

  void _initGetMyPresident(String id) {
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
  }

  //GETTING MY VICE PRESIDENT DATA
  Future<void> readVicePresident(String id) async {
    final String response = await rootBundle.loadString('assets/data/candidates/VICE-PRESIDENT.json');
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

  setMyVicePresidentDataToNull() {
    _myNationalData.update("vicePresident", (value) => null);
    notifyListeners();
  }

  //GETTING MY VICE PRESIDENT INIT DATA
  Future<void> initReadVicePresident(String id) async {
    final String response = await rootBundle.loadString('assets/data/candidates/VICE-PRESIDENT.json');
    final data = await json.decode(response);

    _mappedData = data;

    _initGetMyVicePresident(id);
  }

  void _initGetMyVicePresident(String id) {
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
  }

  //GETTING MY SENATOR DATA
  Future<void> readSenators(List<String> id, List<String> indexes) async {
    final String response = await rootBundle.loadString('assets/data/candidates/SENATOR.json');
    final data = await json.decode(response);

    _mappedData = data;
    _getMySenators(id, indexes);
  }

  void _getMySenators(List<String> id, List<String> indexes) {
    Map<String, dynamic> temp = {};

    for (int i = 0; i < id.length; i++) {
      temp.addAll({
        indexes[i]: CandidateData(
          id: id[i],
          name: _mappedData[id[i]]["name"],
          sex: _mappedData[id[i]]["sex"],
          imgURL: _mappedData[id[i]]["imgURL"] ?? "",
          filedCandidacies: _mappedData[id[i]]["filed_candidacies"],
          houseBills: _mappedData[id[i]]["house_bills"],
          senateBills: _mappedData[id[i]]["senate_bills"],
          profileURL: _mappedData[id[i]]["profile_url"] ?? '',
        ),
      });
    }

    _myNationalData.addAll({
      "senators": temp,
    });
    notifyListeners();
  }

  //GETTING MY SENATOR INIT DATA
  Future<void> initReadSenators(List<String> id, List<String> indexes) async {
    final String response = await rootBundle.loadString('assets/data/candidates/SENATOR.json');
    final data = await json.decode(response);

    _mappedData = data;
    _initGetMySenators(id, indexes);
  }

  void _initGetMySenators(List<String> id, List<String> indexes) {
    Map<String, dynamic> temp = {};

    for (int i = 0; i < id.length; i++) {
      temp.addAll({
        indexes[i]: CandidateData(
          id: id[i],
          name: _mappedData[id[i]]["name"],
          sex: _mappedData[id[i]]["sex"],
          imgURL: _mappedData[id[i]]["imgURL"] ?? "",
          filedCandidacies: _mappedData[id[i]]["filed_candidacies"],
          houseBills: _mappedData[id[i]]["house_bills"],
          senateBills: _mappedData[id[i]]["senate_bills"],
          profileURL: _mappedData[id[i]]["profile_url"] ?? '',
        ),
      });
    }

    _myNationalData.addAll({
      "senators": temp,
    });
  }

  //GETTING MY HOUSE OF REPRESENTATIVES
  Future<void> readHouseOfReps(String id) async {
    final String response = await rootBundle.loadString('assets/data/candidates/MEMBER, HOUSE OF REPRESENTATIVES.json');
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

  setMyHouserepsDataToNull() {
    _myNationalData.update("houseRep", (value) => null);
    notifyListeners();
  }

  //GETTING MY HOUSE OF REPRESENTATIVES INIT DATA
  Future<void> initReadHouseOfReps(String id) async {
    final String response = await rootBundle.loadString('assets/data/candidates/MEMBER, HOUSE OF REPRESENTATIVES.json');
    final data = await json.decode(response);

    _mappedData = data;
    _initGetHouseOfRep(id);
  }

  void _initGetHouseOfRep(String id) {
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
  }

  //GETTING MY PARTY LIST
  Future<void> readPartyList(String id) async {
    final String response = await rootBundle.loadString('assets/data/candidates/PARTY LIST.json');
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

  setMyPartyListDataToNull() {
    _myNationalData.update("partyList", (value) => null);
    notifyListeners();
  }

  //GETTING MY PARTY LIST INIT DATA
  Future<void> initReadPartyList(String id) async {
    final String response = await rootBundle.loadString('assets/data/candidates/PARTY LIST.json');
    final data = await json.decode(response);

    _mappedData = data;

    _initGetPartyList(id);
  }

  void _initGetPartyList(String id) {
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
  }

  //GETTING MY GOVERNOR DATA
  Future<void> readGovernor(String id) async {
    final String response = await rootBundle.loadString('assets/data/candidates/PROVINCIAL GOVERNOR.json');
    final data = await json.decode(response);

    _mappedData = data;
    _getGovernor(id);
  }

  void _getGovernor(String id) {
    Map<String, dynamic> temp = {};
    temp.addAll({
      "governor": CandidateData(
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

  setMyGovernorDataToNull() {
    _myNationalData.update("governor", (value) => null);
    notifyListeners();
  }

  //GETTING MY GOVERNOR INIT DATA
  Future<void> initReadGovernor(String id) async {
    final String response = await rootBundle.loadString('assets/data/candidates/PROVINCIAL GOVERNOR.json');
    final data = await json.decode(response);

    _mappedData = data;
    _initGetGovernor(id);
  }

  void _initGetGovernor(String id) {
    Map<String, dynamic> temp = {};
    temp.addAll({
      "governor": CandidateData(
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
  }

  // GETTING MY VICE-GOVERNOR DATA
  Future<void> readViceGovernor(String id) async {
    final String response = await rootBundle.loadString('assets/data/candidates/PROVINCIAL VICE-GOVERNOR.json');
    final data = await json.decode(response);

    _mappedData = data;

    _getViceGovernor(id);
  }

  void _getViceGovernor(String id) {
    Map<String, dynamic> temp = {};
    temp.addAll({
      "viceGovernor": CandidateData(
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

  setMyViceGovernorDataToNull() {
    _myNationalData.update("viceGovernor", (value) => null);
    notifyListeners();
  }

  // GETTING MY VICE-GOVERNOR INIT DATA
  Future<void> initReadViceGovernor(String id) async {
    final String response = await rootBundle.loadString('assets/data/candidates/PROVINCIAL VICE-GOVERNOR.json');
    final data = await json.decode(response);

    _mappedData = data;

    _initGetViceGovernor(id);
  }

  void _initGetViceGovernor(String id) {
    Map<String, dynamic> temp = {};
    temp.addAll({
      "viceGovernor": CandidateData(
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
  }

  //GETTING MY PROVINCIAL BOARD DATA
  Future<void> readProvincialBoard(List<String> id, List<String> indexes) async {
    final String response = await rootBundle.loadString('assets/data/candidates/MEMBER, SANGGUNIANG PANLALAWIGAN.json');
    final data = await json.decode(response);

    _mappedData = data;
    _getMyProvincialBoard(id, indexes);
  }

  void _getMyProvincialBoard(List<String> id, List<String> indexes) {
    Map<String, dynamic> temp = {};

    for (int i = 0; i < id.length; i++) {
      temp.addAll({
        indexes[i]: CandidateData(
          id: id[i],
          name: _mappedData[id[i]]["name"],
          sex: _mappedData[id[i]]["sex"],
          imgURL: _mappedData[id[i]]["imgURL"] ?? "",
          filedCandidacies: _mappedData[id[i]]["filed_candidacies"],
          houseBills: _mappedData[id[i]]["house_bills"],
          senateBills: _mappedData[id[i]]["senate_bills"],
          profileURL: _mappedData[id[i]]["profile_url"] ?? '',
        ),
      });
    }

    _myNationalData.addAll({
      "provincialBoard": temp,
    });

    notifyListeners();
  }

  //GETTING MY PROVINCIAL BOARD INIT DATA
  Future<void> initReadProvincialBoard(List<String> id, List<String> indexes) async {
    final String response = await rootBundle.loadString('assets/data/candidates/MEMBER, SANGGUNIANG PANLALAWIGAN.json');
    final data = await json.decode(response);

    _mappedData = data;
    _initGetMyProvincialBoard(id, indexes);
  }

  void _initGetMyProvincialBoard(List<String> id, List<String> indexes) {
    Map<String, dynamic> temp = {};

    for (int i = 0; i < id.length; i++) {
      temp.addAll({
        indexes[i]: CandidateData(
          id: id[i],
          name: _mappedData[id[i]]["name"],
          sex: _mappedData[id[i]]["sex"],
          imgURL: _mappedData[id[i]]["imgURL"] ?? "",
          filedCandidacies: _mappedData[id[i]]["filed_candidacies"],
          houseBills: _mappedData[id[i]]["house_bills"],
          senateBills: _mappedData[id[i]]["senate_bills"],
          profileURL: _mappedData[id[i]]["profile_url"] ?? '',
        ),
      });
    }

    _myNationalData.addAll({
      "provincialBoard": temp,
    });
  }

  //GETTING MY MAYOR DATA
  Future<void> readMayor(String id) async {
    final String response = await rootBundle.loadString('assets/data/candidates/MAYOR.json');
    final data = await json.decode(response);

    _mappedData = data;
    _getMayor(id);
  }

  void _getMayor(String id) {
    Map<String, dynamic> temp = {};
    temp.addAll({
      "mayor": CandidateData(
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

  setMyMayorDataToNull() {
    _myNationalData.update("mayor", (value) => null);
    notifyListeners();
  }

  //GETTING MY MAYOR INIT DATA
  Future<void> initReadMayor(String id) async {
    final String response = await rootBundle.loadString('assets/data/candidates/MAYOR.json');
    final data = await json.decode(response);

    _mappedData = data;
    _initGetMayor(id);
  }

  void _initGetMayor(String id) {
    Map<String, dynamic> temp = {};
    temp.addAll({
      "mayor": CandidateData(
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
  }

//GETTING MY VICE MAYOR DATA
  Future<void> readViceMayor(String id) async {
    final String response = await rootBundle.loadString('assets/data/candidates/VICE-MAYOR.json');
    final data = await json.decode(response);

    _mappedData = data;
    _getViceMayor(id);
  }

  void _getViceMayor(String id) {
    Map<String, dynamic> temp = {};
    temp.addAll({
      "viceMayor": CandidateData(
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

  setMyViceMayorDataToNull() {
    _myNationalData.update("viceMayor", (value) => null);
    notifyListeners();
  }

//GETTING MY VICE MAYOR INIT DATA
  Future<void> initReadViceMayor(String id) async {
    final String response = await rootBundle.loadString('assets/data/candidates/VICE-MAYOR.json');
    final data = await json.decode(response);

    _mappedData = data;
    _initGetViceMayor(id);
  }

  void _initGetViceMayor(String id) {
    Map<String, dynamic> temp = {};
    temp.addAll({
      "viceMayor": CandidateData(
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
  }

  //GETTING MY COUNCILORS DATA
  Future<void> readMyCouncilors(List<String> id, List<String> indexes) async {
    final String response = await rootBundle.loadString('assets/data/candidates/COUNCILOR.json');
    final data = await json.decode(response);

    _mappedData = data;
    _getMyCouncilors(id, indexes);
  }

  void _getMyCouncilors(List<String> id, List<String> indexes) {
    Map<String, dynamic> temp = {};

    for (int i = 0; i < id.length; i++) {
      temp.addAll({
        indexes[i]: CandidateData(
          id: id[i],
          name: _mappedData[id[i]]["name"],
          sex: _mappedData[id[i]]["sex"],
          imgURL: _mappedData[id[i]]["imgURL"] ?? "",
          filedCandidacies: _mappedData[id[i]]["filed_candidacies"],
          houseBills: _mappedData[id[i]]["house_bills"],
          senateBills: _mappedData[id[i]]["senate_bills"],
          profileURL: _mappedData[id[i]]["profile_url"] ?? '',
        ),
      });
    }

    _myNationalData.addAll({
      "councilors": temp,
    });
    notifyListeners();
  }

  setMyCouncilorDataToNull() {
    _myNationalData.update('councilors', (value) => null);
    notifyListeners();
  }

  //GETTING MY COUNCILOR INIT DATA
  Future<void> initReadCouncilors(List<String> id, List<String> indexes) async {
    final String response = await rootBundle.loadString('assets/data/candidates/COUNCILOR.json');
    final data = await json.decode(response);

    _mappedData = data;
    _initGetMyCouncilors(id, indexes);
  }

  void _initGetMyCouncilors(List<String> id, List<String> indexes) {
    Map<String, dynamic> temp = {};

    for (int i = 0; i < id.length; i++) {
      temp.addAll({
        indexes[i]: CandidateData(
          id: id[i],
          name: _mappedData[id[i]]["name"],
          sex: _mappedData[id[i]]["sex"],
          imgURL: _mappedData[id[i]]["imgURL"] ?? "",
          filedCandidacies: _mappedData[id[i]]["filed_candidacies"],
          houseBills: _mappedData[id[i]]["house_bills"],
          senateBills: _mappedData[id[i]]["senate_bills"],
          profileURL: _mappedData[id[i]]["profile_url"] ?? '',
        ),
      });
    }

    _myNationalData.addAll({
      "councilors": temp,
    });
  }

  final GlobalKey _scaffoldKey = GlobalKey();
  GlobalKey get scaffoldKey => _scaffoldKey;

  // WIDGET BUILDER SECTION

  //SENATOR WIDGET BUILDER
  List<Widget> _senatorWidgets = [];

  List<Widget> get senatorWidgets => _senatorWidgets;

  buildSenatorWidgets(BuildContext context, Size screenSize) {
    List<Widget> tempWidgets = [];
    DataController dataController = DataController();
    CandidateDataController candidateDataController = CandidateDataController();
    PaginationController paginationController = PaginationController();
    if (List<String>.from(dataController.userData["my_candidates"]["senators"]).isEmpty) {
      for (int i = 0; i < 12; i++) {
        tempWidgets.add(
          InkWell(
            onTap: () async {
              paginationController.clearFields();
              Navigator.push(
                _scaffoldKey.currentContext!,
                MaterialPageRoute(
                  builder: (context) => const VeripolSplash(),
                ),
              );
              await candidateDataController.readSenatorJson().whenComplete(() {
                Future.delayed(const Duration(seconds: 1), () {}).whenComplete(
                  () => Navigator.pushReplacement(
                    _scaffoldKey.currentContext!,
                    MaterialPageRoute(
                      builder: (context) => AddCandidate(
                        index: i,
                        screenSize: screenSize,
                        position: "Senators",
                        posCardColor: veripolColors.sunYellow,
                        posBgImageURL: "assets/senators_text_bg.png",
                        bgImageOffset: const Offset(170, 0),
                        posBgImageSize: const Size(189, 71),
                        candidates: candidateDataController.candidates,
                      ),
                    ),
                  ),
                );
              });
            },
            child: const MyCandidateAddButton(),
          ),
        );
      }
    } else {
      int count = 0;
      for (int i = 0; i < 12; i++) {
        for (var index in _mySenatorIndices) {
          if (index == i) {
            count++;
          }
        }
        if (count != 0) {
          String temp = "";
          temp = myNationalData["senators"][i.toString()].id;
          tempWidgets.insert(
            i,
            InkWell(
              onTap: () async {
                DialogBoxes().removeOrViewDialog(
                  _scaffoldKey.currentContext!,
                  screenSize,
                  "SENATORS",
                  temp,
                  i,
                );
              },
              child: MyCandidateSelectedCandidate(
                data: myNationalData["senators"][i.toString()],
              ),
            ),
          );

          count = 0;
        } else {
          tempWidgets.insert(
            i,
            InkWell(
              onTap: () async {
                paginationController.clearFields();
                Navigator.push(
                  _scaffoldKey.currentContext!,
                  MaterialPageRoute(
                    builder: (context) => const VeripolSplash(),
                  ),
                );
                await candidateDataController.readSenatorJson().whenComplete(() {
                  Future.delayed(const Duration(seconds: 1), () {}).whenComplete(
                    () => Navigator.pushReplacement(
                      _scaffoldKey.currentContext!,
                      MaterialPageRoute(
                        builder: (context) => AddCandidate(
                          index: i,
                          screenSize: screenSize,
                          position: "Senators",
                          posCardColor: veripolColors.sunYellow,
                          posBgImageURL: "assets/senators_text_bg.png",
                          bgImageOffset: const Offset(170, 0),
                          posBgImageSize: const Size(189, 71),
                          candidates: candidateDataController.candidates,
                        ),
                      ),
                    ),
                  );
                });
              },
              child: const MyCandidateAddButton(),
            ),
          );
        }
      }
    }

    _senatorWidgets = tempWidgets;

    notifyListeners();
  }

  initBuildSenatorWidgets(BuildContext context, Size screenSize) {
    List<Widget> tempWidgets = [];
    DataController dataController = DataController();
    CandidateDataController candidateDataController = CandidateDataController();
    PaginationController paginationController = PaginationController();
    if (List<String>.from(dataController.userData["my_candidates"]["senators"]).isEmpty) {
      for (int i = 0; i < 12; i++) {
        tempWidgets.add(
          InkWell(
            onTap: () async {
              paginationController.clearFields();
              Navigator.push(
                _scaffoldKey.currentContext!,
                MaterialPageRoute(
                  builder: (context) => const VeripolSplash(),
                ),
              );
              await candidateDataController.readSenatorJson().whenComplete(() {
                Future.delayed(const Duration(seconds: 1), () {}).whenComplete(
                  () => Navigator.pushReplacement(
                    _scaffoldKey.currentContext!,
                    MaterialPageRoute(
                      builder: (context) => AddCandidate(
                        index: i,
                        screenSize: screenSize,
                        position: "Senators",
                        posCardColor: veripolColors.sunYellow,
                        posBgImageURL: "assets/senators_text_bg.png",
                        bgImageOffset: const Offset(170, 0),
                        posBgImageSize: const Size(189, 71),
                        candidates: candidateDataController.candidates,
                      ),
                    ),
                  ),
                );
              });
            },
            child: const MyCandidateAddButton(),
          ),
        );
      }
    } else {
      for (int i = 0; i < 12; i++) {
        int count = 0;
        for (var index in _mySenatorIndices) {
          if (index == i) {
            count++;
          }
        }
        if (count != 0) {
          tempWidgets.insert(
            i,
            GestureDetector(
              onTap: () async {
                DialogBoxes().removeOrViewDialog(
                  _scaffoldKey.currentContext!,
                  screenSize,
                  "SENATORS",
                  myNationalData["senators"][i.toString()].id,
                  i,
                );
              },
              child: MyCandidateSelectedCandidate(
                data: myNationalData["senators"][i.toString()],
              ),
            ),
          );

          count = 0;
        } else {
          tempWidgets.insert(
            i,
            InkWell(
              onTap: () async {
                paginationController.clearFields();
                Navigator.push(
                  _scaffoldKey.currentContext!,
                  MaterialPageRoute(
                    builder: (context) => const VeripolSplash(),
                  ),
                );
                await candidateDataController.readSenatorJson().whenComplete(() {
                  Future.delayed(const Duration(seconds: 1), () {}).whenComplete(
                    () => Navigator.pushReplacement(
                      _scaffoldKey.currentContext!,
                      MaterialPageRoute(
                        builder: (context) => AddCandidate(
                          index: i,
                          screenSize: screenSize,
                          position: "Senators",
                          posCardColor: veripolColors.sunYellow,
                          posBgImageURL: "assets/senators_text_bg.png",
                          bgImageOffset: const Offset(170, 0),
                          posBgImageSize: const Size(189, 71),
                          candidates: candidateDataController.candidates,
                        ),
                      ),
                    ),
                  );
                });
              },
              child: const MyCandidateAddButton(),
            ),
          );
        }
      }
    }

    _senatorWidgets = tempWidgets;
  }

  //PROVINCIAL BOARD WIDGET BUILDER
  List<Widget> _provincialBoardWidgets = [];

  List<Widget> get provincialBoardWidgets => _provincialBoardWidgets;

  buildProvincialBoardWidgets(BuildContext context, Size screenSize) {
    List<Widget> tempWidgets = [];
    DataController dataController = DataController();
    CandidateDataController candidateDataController = CandidateDataController();
    PaginationController paginationController = PaginationController();

    if (List<String>.from(dataController.userData["my_candidates"]["provincialBoard"]).isEmpty) {
      for (int i = 0; i < 2; i++) {
        tempWidgets.add(
          InkWell(
            onTap: () async {
              paginationController.clearFields();
              Navigator.push(
                _scaffoldKey.currentContext!,
                MaterialPageRoute(
                  builder: (context) => const VeripolSplash(),
                ),
              );
              await candidateDataController
                  .readProvincialBoard(
                DataController().province,
              )
                  .whenComplete(() {
                Future.delayed(const Duration(seconds: 1), () {}).whenComplete(
                  () => Navigator.pushReplacement(
                    _scaffoldKey.currentContext!,
                    MaterialPageRoute(
                      builder: (context) => AddCandidate(
                        index: i,
                        screenSize: screenSize,
                        position: "Provincial Board",
                        posCardColor: veripolColors.sunYellow,
                        posBgImageURL: "assets/provincial_board_text_bg_1.png",
                        bgImageOffset: const Offset(170, -10),
                        posBgImageSize: const Size(201, 115),
                        candidates: candidateDataController.candidates,
                      ),
                    ),
                  ),
                );
              });
            },
            child: const MyCandidateAddButton(),
          ),
        );
      }
    } else {
      int count = 0;
      for (int i = 0; i < 2; i++) {
        for (var index in _myProvincialBoardIndices) {
          if (index == i) {
            count++;
          }
        }
        if (count != 0) {
          String temp = "";
          temp = myNationalData["provincialBoard"][i.toString()].id;
          tempWidgets.insert(
            i,
            InkWell(
              onTap: () async {
                DialogBoxes().removeOrViewDialog(
                  _scaffoldKey.currentContext!,
                  screenSize,
                  "PROVINCIAL BOARD",
                  temp,
                  i,
                );
              },
              child: MyCandidateSelectedCandidate(
                data: myNationalData["provincialBoard"][i.toString()],
              ),
            ),
          );

          count = 0;
        } else {
          tempWidgets.insert(
            i,
            InkWell(
              onTap: () async {
                paginationController.clearFields();
                Navigator.push(
                  _scaffoldKey.currentContext!,
                  MaterialPageRoute(
                    builder: (context) => const VeripolSplash(),
                  ),
                );
                await candidateDataController.readProvincialBoard(DataController().province).whenComplete(() {
                  Future.delayed(const Duration(seconds: 1), () {}).whenComplete(
                    () => Navigator.pushReplacement(
                      _scaffoldKey.currentContext!,
                      MaterialPageRoute(
                        builder: (context) => AddCandidate(
                          index: i,
                          screenSize: screenSize,
                          position: "Provincial Board",
                          posCardColor: veripolColors.sunYellow,
                          posBgImageURL: "assets/provincial_board_text_bg_1.png",
                          bgImageOffset: const Offset(
                            170,
                            -10,
                          ),
                          posBgImageSize: const Size(201, 115),
                          candidates: candidateDataController.candidates,
                        ),
                      ),
                    ),
                  );
                });
              },
              child: const MyCandidateAddButton(),
            ),
          );
        }
      }
    }

    _provincialBoardWidgets = tempWidgets;

    notifyListeners();
  }

  initBuildProvincialBoardWidgets(BuildContext context, Size screenSize) {
    List<Widget> tempWidgets = [];
    DataController dataController = DataController();
    CandidateDataController candidateDataController = CandidateDataController();
    PaginationController paginationController = PaginationController();

    if (List<String>.from(dataController.userData["my_candidates"]["provincialBoard"]).isEmpty) {
      for (int i = 0; i < 2; i++) {
        tempWidgets.add(
          InkWell(
            onTap: () async {
              paginationController.clearFields();
              Navigator.push(
                _scaffoldKey.currentContext!,
                MaterialPageRoute(
                  builder: (context) => const VeripolSplash(),
                ),
              );
              await candidateDataController
                  .readProvincialBoard(
                DataController().province,
              )
                  .whenComplete(() {
                Future.delayed(const Duration(seconds: 1), () {}).whenComplete(
                  () => Navigator.pushReplacement(
                    _scaffoldKey.currentContext!,
                    MaterialPageRoute(
                      builder: (context) => AddCandidate(
                        index: i,
                        screenSize: screenSize,
                        position: "Provincial Board",
                        posCardColor: veripolColors.sunYellow,
                        posBgImageURL: "assets/provincial_board_text_bg_1.png",
                        bgImageOffset: const Offset(
                          170,
                          -10,
                        ),
                        posBgImageSize: const Size(201, 115),
                        candidates: candidateDataController.candidates,
                      ),
                    ),
                  ),
                );
              });
            },
            child: const MyCandidateAddButton(),
          ),
        );
      }
    } else {
      int count = 0;
      for (int i = 0; i < 2; i++) {
        for (var index in _myProvincialBoardIndices) {
          if (index == i) {
            count++;
          }
        }
        if (count != 0) {
          String temp = "";
          temp = myNationalData["provincialBoard"][i.toString()].id;
          tempWidgets.insert(
            i,
            InkWell(
              onTap: () async {
                DialogBoxes().removeOrViewDialog(
                  _scaffoldKey.currentContext!,
                  screenSize,
                  "PROVINCIAL BOARD",
                  temp,
                  i,
                );
              },
              child: MyCandidateSelectedCandidate(
                data: myNationalData["provincialBoard"][i.toString()],
              ),
            ),
          );

          count = 0;
        } else {
          tempWidgets.insert(
            i,
            InkWell(
              onTap: () async {
                paginationController.clearFields();
                Navigator.push(
                  _scaffoldKey.currentContext!,
                  MaterialPageRoute(
                    builder: (context) => const VeripolSplash(),
                  ),
                );
                await candidateDataController.readProvincialBoard(DataController().province).whenComplete(() {
                  Future.delayed(const Duration(seconds: 1), () {}).whenComplete(
                    () => Navigator.pushReplacement(
                      _scaffoldKey.currentContext!,
                      MaterialPageRoute(
                        builder: (context) => AddCandidate(
                          index: i,
                          screenSize: screenSize,
                          position: "Provincial Board",
                          posCardColor: veripolColors.sunYellow,
                          posBgImageURL: "assets/provincial_board_text_bg_1.png",
                          bgImageOffset: const Offset(
                            170,
                            -10,
                          ),
                          posBgImageSize: const Size(201, 115),
                          candidates: candidateDataController.candidates,
                        ),
                      ),
                    ),
                  );
                });
              },
              child: const MyCandidateAddButton(),
            ),
          );
        }
      }
    }

    _provincialBoardWidgets = tempWidgets;
  }

  //COUNCILORS WIDGET BUILDER
  List<Widget> _councilorWidgets = [];

  List<Widget> get councilorWidgets => _councilorWidgets;

  buildCouncilorWidgets(BuildContext context, Size screenSize) {
    List<Widget> tempWidgets = [];
    DataController dataController = DataController();
    CandidateDataController candidateDataController = CandidateDataController();
    PaginationController paginationController = PaginationController();

    if (List<String>.from(dataController.userData["my_candidates"]["cityCouncilors"]).isEmpty) {
      for (int i = 0; i < _councilors; i++) {
        tempWidgets.add(
          InkWell(
            onTap: () async {
              paginationController.clearFields();
              Navigator.push(
                _scaffoldKey.currentContext!,
                MaterialPageRoute(
                  builder: (context) => const VeripolSplash(),
                ),
              );
              await candidateDataController
                  .readCouncilors(
                DataController().province,
                DataController().city,
              )
                  .whenComplete(() {
                Future.delayed(const Duration(seconds: 1), () {}).whenComplete(
                  () => Navigator.pushReplacement(
                    _scaffoldKey.currentContext!,
                    MaterialPageRoute(
                      builder: (context) => AddCandidate(
                        index: i,
                        screenSize: screenSize,
                        position: "Councilors",
                        posCardColor: veripolColors.sunYellow,
                        posBgImageURL: "assets/councilor_text_bg.png",
                        bgImageOffset: const Offset(150, 0),
                        posBgImageSize: const Size(239, 70),
                        candidates: candidateDataController.candidates,
                      ),
                    ),
                  ),
                );
              });
            },
            child: const MyCandidateAddButton(),
          ),
        );
      }
    } else {
      int count = 0;
      for (int i = 0; i < _councilors; i++) {
        for (var index in _myCouncilorIndices) {
          if (index == i) {
            count++;
          }
        }
        if (count != 0) {
          String temp = "";
          temp = myNationalData["councilors"][i.toString()].id;
          tempWidgets.insert(
            i,
            InkWell(
              onTap: () async {
                DialogBoxes().removeOrViewDialog(
                  _scaffoldKey.currentContext!,
                  screenSize,
                  "COUNCILOR",
                  temp,
                  i,
                );
              },
              child: MyCandidateSelectedCandidate(
                data: myNationalData["councilors"][i.toString()],
              ),
            ),
          );

          count = 0;
        } else {
          tempWidgets.insert(
            i,
            InkWell(
              onTap: () async {
                paginationController.clearFields();
                Navigator.push(
                  _scaffoldKey.currentContext!,
                  MaterialPageRoute(
                    builder: (context) => const VeripolSplash(),
                  ),
                );
                await candidateDataController
                    .readCouncilors(DataController().province, DataController().city)
                    .whenComplete(() {
                  Future.delayed(const Duration(seconds: 1), () {}).whenComplete(
                    () => Navigator.pushReplacement(
                      _scaffoldKey.currentContext!,
                      MaterialPageRoute(
                        builder: (context) => AddCandidate(
                          index: i,
                          screenSize: screenSize,
                          position: "Councilors",
                          posCardColor: veripolColors.sunYellow,
                          posBgImageURL: "assets/councilor_text_bg.png",
                          bgImageOffset: const Offset(150, 0),
                          posBgImageSize: const Size(239, 70),
                          candidates: candidateDataController.candidates,
                        ),
                      ),
                    ),
                  );
                });
              },
              child: const MyCandidateAddButton(),
            ),
          );
        }
      }
    }

    _councilorWidgets = tempWidgets;

    notifyListeners();
  }

  initBuildCouncilorWidgets(BuildContext context, Size screenSize) {
    List<Widget> tempWidgets = [];
    DataController dataController = DataController();
    CandidateDataController candidateDataController = CandidateDataController();
    PaginationController paginationController = PaginationController();

    if (List<String>.from(dataController.userData["my_candidates"]["cityCouncilors"]).isEmpty) {
      for (int i = 0; i < _councilors; i++) {
        tempWidgets.add(
          InkWell(
            onTap: () async {
              paginationController.clearFields();
              Navigator.push(
                _scaffoldKey.currentContext!,
                MaterialPageRoute(
                  builder: (context) => const VeripolSplash(),
                ),
              );
              await candidateDataController
                  .readCouncilors(
                DataController().province,
                DataController().city,
              )
                  .whenComplete(() {
                Future.delayed(const Duration(seconds: 1), () {}).whenComplete(
                  () => Navigator.pushReplacement(
                    _scaffoldKey.currentContext!,
                    MaterialPageRoute(
                      builder: (context) => AddCandidate(
                        index: i,
                        screenSize: screenSize,
                        position: "Councilors",
                        posCardColor: veripolColors.sunYellow,
                        posBgImageURL: "assets/councilor_text_bg.png",
                        bgImageOffset: const Offset(150, 0),
                        posBgImageSize: const Size(239, 70),
                        candidates: candidateDataController.candidates,
                      ),
                    ),
                  ),
                );
              });
            },
            child: const MyCandidateAddButton(),
          ),
        );
      }
    } else {
      int count = 0;
      for (int i = 0; i < _councilors; i++) {
        for (var index in _myCouncilorIndices) {
          if (index == i) {
            count++;
          }
        }
        if (count != 0) {
          String temp = "";
          temp = myNationalData["councilors"][i.toString()].id;
          tempWidgets.insert(
            i,
            InkWell(
              onTap: () async {
                DialogBoxes().removeOrViewDialog(
                  _scaffoldKey.currentContext!,
                  screenSize,
                  "COUNCILOR",
                  temp,
                  i,
                );
              },
              child: MyCandidateSelectedCandidate(
                data: myNationalData["councilors"][i.toString()],
              ),
            ),
          );

          count = 0;
        } else {
          tempWidgets.insert(
            i,
            InkWell(
              onTap: () async {
                paginationController.clearFields();
                Navigator.push(
                  _scaffoldKey.currentContext!,
                  MaterialPageRoute(
                    builder: (context) => const VeripolSplash(),
                  ),
                );
                await candidateDataController
                    .readCouncilors(DataController().province, DataController().city)
                    .whenComplete(() {
                  Future.delayed(const Duration(seconds: 1), () {}).whenComplete(
                    () => Navigator.pushReplacement(
                      _scaffoldKey.currentContext!,
                      MaterialPageRoute(
                        builder: (context) => AddCandidate(
                          index: i,
                          screenSize: screenSize,
                          position: "Councilors",
                          posCardColor: veripolColors.sunYellow,
                          posBgImageURL: "assets/councilor_text_bg.png",
                          bgImageOffset: const Offset(150, 0),
                          posBgImageSize: const Size(239, 70),
                          candidates: candidateDataController.candidates,
                        ),
                      ),
                    ),
                  );
                });
              },
              child: const MyCandidateAddButton(),
            ),
          );
        }
      }
    }

    _councilorWidgets = tempWidgets;
  }

  newLocationClearRunTimeData() {
    DataController().userData["my_candidates"]["houseRep"] = "";
    DataController().userData["my_candidates"]["governor"] = "";
    DataController().userData["my_candidates"]["viceGovernor"] = "";
    DataController().userData["my_candidates"]["provincialBoard"] = [];
    DataController().userData["my_candidates"]["provincialBoardIndices"] = [];
    DataController().userData["my_candidates"]["mayor"] = "";
    DataController().userData["my_candidates"]["viceMayor"] = "";
    DataController().userData["my_candidates"]["cityCouncilors"] = [];
    DataController().userData["my_candidates"]["cityCouncilorIndices"] = [];
    _myCouncilorList.clear();
    _myCouncilorIndices.clear();
    _myProvincialBoardList.clear();
    _myProvincialBoardIndices.clear();
    notifyListeners();
  }

  Future<void> storeNewLocationClearedDataToDB() async {
    await user.doc(FirebaseAuth.instance.currentUser!.uid).update({
      "my_candidates": {
        "president": DataController().userData["my_candidates"]["president"],
        "vicePresident": DataController().userData["my_candidates"]["vicePresident"],
        'senators': DataController().userData["my_candidates"]["senators"],
        'senatorIndices': DataController().userData["my_candidates"]["senatorIndices"],
        'houseRep': DataController().userData["my_candidates"]["houseRep"],
        'partyList': DataController().userData["my_candidates"]["partyList"],
        'governor': DataController().userData["my_candidates"]["governor"],
        'viceGovernor': DataController().userData["my_candidates"]["viceGovernor"],
        'provincialBoard': DataController().userData["my_candidates"]["provincialBoard"],
        'provincialBoardIndices': DataController().userData["my_candidates"]["provincialBoardIndices"],
        'mayor': DataController().userData["my_candidates"]["mayor"],
        'viceMayor': DataController().userData["my_candidates"]["viceMayor"],
        'cityCouncilors': DataController().userData["my_candidates"]["cityCouncilors"],
        'cityCouncilorIndices': DataController().userData["my_candidates"]["cityCouncilorIndices"],
        'barangayCaptain': DataController().userData["my_candidates"]["barangayCaptain"],
        'barangayCouncilors': DataController().userData["my_candidates"]["barangayCouncilors"],
        'skChairman': DataController().userData["my_candidates"]["skChairman"],
      }
    });
  }

  cacheNewLocationClearedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString('houseRep', "");
    await prefs.setString('governor', "");
    await prefs.setString('viceGovernor', "");
    await prefs.setStringList('provincialBoard', []);
    await prefs.setStringList('provincialBoardIndices', []);
    await prefs.setString('mayor', "");
    await prefs.setString('viceMayor', "");
    await prefs.setStringList('cityCouncilors', []);
    await prefs.setStringList('cityCouncilorIndices', []);
  }
}
