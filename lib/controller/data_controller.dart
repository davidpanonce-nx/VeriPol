import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:veripol/models/models.dart';

class DataController extends ChangeNotifier {
  DataController._privateConstructor();

  static final DataController _dataController =
      DataController._privateConstructor();

  factory DataController() {
    return _dataController;
  }
  Map<String, dynamic> _mappedData = {};
  Map<String, dynamic> _mappedProvinceData = {};
  Map<String, dynamic> _mappedCityData = {};
  List<String> _regions = [];
  List<String> _provinces = [];
  List<String> _cities = [];
  List<String> _barangays = [];
  String _region = "";
  String _province = "";
  String _city = "";
  String _barangay = "";
  String _selectedCity = "";

  List<String> get regions => _regions;
  List<String> get provinces => _provinces;
  List<String> get cities => _cities;
  List<String> get barangays => _barangays;
  Map<String, dynamic> get mappedData => _mappedData;

  String get region => _region;
  String get province => _province;
  String get city => _city;
  String get barangay => _barangay;
  String get selectedCity => _selectedCity;

  // BaseUserModel? _userFromFirebase(User? user) {
  //   return user != null ? BaseUserModel(id: user.uid) : null;
  // }

  // Stream<BaseUserModel?> get user {
  //   return FirebaseAuth.instance
  //       .authStateChanges()
  //       .map((User? user) => _userFromFirebase(user));
  // }

  Future<bool> getLocationData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _region = prefs.getString('region') ?? "";
    _province = prefs.getString('province') ?? "";
    _city = prefs.getString('city') ?? "";
    _barangay = prefs.getString('barangay') ?? "";

    if (_region != "") {
      return true;
    }
    return false;
  }

  void clearProvinceData() {
    _provinces.clear();
    notifyListeners();
  }

  void clearCityData() {
    _cities.clear();
    notifyListeners();
  }

  void clearBarangayData() {
    _barangays.clear();
    notifyListeners();
  }

  void setSelectedCity(val) {
    _selectedCity = val;
    notifyListeners();
  }

  void readJson() async {
    final String response =
        await rootBundle.loadString('assets/data/locations.json');
    final data = await json.decode(response);

    _mappedData = data;

    List<String> temp = [];
    for (var keys in _mappedData.keys) {
      temp.add(keys);
    }
    _regions = temp;
    _regions.sort((a, b) =>
        a.toString().toLowerCase().compareTo(b.toString().toLowerCase()));
    notifyListeners();
  }

  void getNCRcities(String region) {
    Map<String, dynamic> temp;
    List<String> tempCities = [];
    temp = _mappedData[region]["cities"];
    for (var keys in temp.keys) {
      tempCities.add(keys);
    }
    _cities = tempCities;
    _cities.sort((a, b) =>
        a.toString().toLowerCase().compareTo(b.toString().toLowerCase()));
    notifyListeners();
  }

  void getNCRbarangays(String region, String city) {
    List<String> tempBarangays = [];
    for (var bar in _mappedData[region]["cities"][city]) {
      tempBarangays.add(bar);
    }

    if (_selectedCity == "City of Caloocan" || _selectedCity == "Pasay City") {
      List<int> nums = [];
      List<String> sorted = [];
      for (var barangay in tempBarangays) {
        nums.add(int.parse(barangay.split(" ").last));
      }
      nums.sort();
      if (nums.length == tempBarangays.length) {
        for (var num in nums) {
          sorted.add("Barangay $num");
        }
      }

      _barangays = sorted;
    } else if (_selectedCity == "City of Manila") {
      List<int> nums = [];
      List<String> sorted = [];
      List<int> withExtensions = [];
      int? numChecker;
      for (var barangay in tempBarangays) {
        numChecker = int.tryParse(barangay.split(" ").last);
        if (numChecker == null) {
          String temp;
          String temp_1;
          int num;
          temp = barangay.split(" ").last;
          temp_1 = temp.split("-").first;
          num = int.parse(temp_1);

          withExtensions.add(num);
          nums.add(num);
        } else {
          nums.add(numChecker);
        }
      }
      nums.sort();

      int count = 0;
      if (nums.length == tempBarangays.length) {
        for (var num in nums) {
          for (var ext in withExtensions) {
            if (ext == num) {
              count++;
            }
          }
          if (count > 1) {
            count = 0;
            sorted.add("Barangay $num-A");
          } else {
            sorted.add("Barangay $num");
          }
        }
      }

      _barangays = sorted;
    } else {
      _barangays = tempBarangays;
      _barangays.sort((a, b) =>
          a.toString().toLowerCase().compareTo(b.toString().toLowerCase()));
    }
    notifyListeners();
  }

  void getProvinces(String region) {
    _mappedProvinceData = _mappedData[region];
    List<String> temp = [];
    for (var keys in _mappedProvinceData.keys) {
      temp.add(keys);
    }
    _provinces = temp;
    _provinces.sort((a, b) =>
        a.toString().toLowerCase().compareTo(b.toString().toLowerCase()));
    notifyListeners();
  }

  void getCities(String province) {
    _mappedCityData = _mappedProvinceData[province];
    List<String> temp = [];
    for (var keys in _mappedCityData.keys) {
      temp.add(keys);
    }
    _cities = temp;
    _cities.sort((a, b) =>
        a.toString().toLowerCase().compareTo(b.toString().toLowerCase()));
    notifyListeners();
  }

  void getBarangays(String city) {
    List<String> temp = [];
    for (var bar in _mappedCityData[city]) {
      temp.add(bar);
    }
    _barangays = temp;
    _barangays.sort((a, b) =>
        a.toString().toLowerCase().compareTo(b.toString().toLowerCase()));
    notifyListeners();
  }

  Future<void> cacheLocationData(String region, String province, String city,
      String barangay, String district) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('region', region);
    await prefs.setString('province', province);
    await prefs.setString('city', city);
    await prefs.setString('barangay', barangay);
    await prefs.setString('district', district);

    _region = region;
    _province = province;
    _city = city;
    _barangay = barangay;

    notifyListeners();
  }

  Future<void> storeLocationDataToDB(String? region, String? province,
      String? city, String? barangay, String? district) async {
    await FirebaseFirestore.instance
        .collection("User")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({
      "location": {
        "barangay": barangay,
        "district": district,
        "municipality": city,
        "province": province,
        "region": region,
      }
    });
  }

  //get started user data
  Future<Map<String, dynamic>> userStarterData() async {
    Map<String, dynamic> temp = {};
    await FirebaseFirestore.instance
        .collection("User")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((value) {
      if (value.exists) {
        temp.addAll(
          {
            "first_name": value.get(FieldPath(const ['first_name'])),
            "location": value.get(FieldPath(const ["location"])),
            "candidates": value.get(FieldPath(const ["candidates"])),
            "my_candidates": value.get(FieldPath(const ['my_candidates'])),
          },
        );
      }
    });

    return temp;
  }

  //USER DATA
  final Map<String, dynamic> _userData = {};

  Map<String, dynamic> get userData => _userData;

  void setUserData(Map<String, dynamic> data) {
    _userData.addAll(data);
    notifyListeners();
  }

  Future<void> cacheUserData(VeriPolUserData userData) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString('first_name', userData.firstName!);
    await prefs.setString('region', userData.location!.region ?? '');
    await prefs.setString('province', userData.location!.province ?? '');
    await prefs.setString('city', userData.location!.municipality ?? '');
    await prefs.setString('barangay', userData.location!.barangay ?? '');
    await prefs.setString('district', userData.location!.district ?? '');
    await prefs.setString('president', userData.myCandidates!.president);
    await prefs.setString(
        'vicePresident', userData.myCandidates!.vicePresident);
    await prefs.setStringList('senators', userData.myCandidates!.senators);
    await prefs.setStringList(
        'senatorIndices', userData.myCandidates!.senatorIndices);
    await prefs.setString('houseRep', userData.myCandidates!.houseRep);
    await prefs.setString('partyList', userData.myCandidates!.partyList);
    await prefs.setString('governor', userData.myCandidates!.governor);
    await prefs.setString('viceGovernor', userData.myCandidates!.viceGovernor);
    await prefs.setStringList(
        'provincialBoard', userData.myCandidates!.provincialBoard);
    await prefs.setStringList('provincialBoardIndices',
        userData.myCandidates!.provincialBoardIndices);
    await prefs.setString('mayor', userData.myCandidates!.mayor);
    await prefs.setString('viceMayor', userData.myCandidates!.viceMayor);
    await prefs.setStringList(
        'cityCouncilors', userData.myCandidates!.cityCouncilors);
    await prefs.setStringList(
        'cityCouncilorIndices', userData.myCandidates!.cityCouncilorIndices);
    await prefs.setString(
        'barangayCaptain', userData.myCandidates!.barangayCaptain);
    await prefs.setStringList(
        'barangayCouncilors', userData.myCandidates!.barangayCouncilors);
    await prefs.setString('skChairman', userData.myCandidates!.skChairman);
    await prefs.setInt("total", userData.candidates!.total ?? 0);
    await prefs.setInt("national", userData.candidates!.national ?? 0);
    await prefs.setInt("provincial", userData.candidates!.provincial ?? 0);
    await prefs.setInt("municipal", userData.candidates!.municipal ?? 0);
    await prefs.setStringList(
        'houseOfRepDistricts', userData.candidates!.houseOfRepDistricts ?? []);
    await prefs.setStringList('provincialBoardDistricts',
        userData.candidates!.provincialBoardDistricts ?? []);
    await prefs.setStringList(
        'councilorDistricts', userData.candidates!.councilorDistricts ?? []);
  }

  Future<void> getUserDataFromCache() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    Map<String, dynamic> data = {
      'first_name': prefs.getString('first_name'),
      'location': {
        'region': prefs.getString('region'),
        'province': prefs.getString('province'),
        'municipality': prefs.getString('municipality'),
        'district': prefs.getString('district'),
        'barangay': prefs.getString('barangay'),
      },
      'my_candidates': {
        'president': prefs.getString('president'),
        'vicePresident': prefs.getString('vicePresident'),
        'senators': prefs.getStringList('senators'),
        'senatorIndices': prefs.getStringList('senatorIndices'),
        'houseRep': prefs.getString('houseRep'),
        'partyList': prefs.getString('partyList'),
        'governor': prefs.getString('governor'),
        'viceGovernor': prefs.getString('viceGovernor'),
        'provincialBoard': prefs.getStringList('provincialBoard'),
        'provincialBoardIndices': prefs.getStringList('provincialBoardIndices'),
        'mayor': prefs.getString('mayor'),
        'viceMayor': prefs.getString('viceMayor'),
        'cityCouncilors': prefs.getStringList('cityCouncilors'),
        'cityCouncilorIndices': prefs.getStringList('cityCouncilorIndices'),
        'barangayCaptain': prefs.getString('barangayCaptain'),
        'barangayCouncilors': prefs.getStringList('barangayCouncilors'),
        'skChairman': prefs.getString('skChairman'),
      },
      'candidates': {
        'total': prefs.getInt('total'),
        'national': prefs.getInt('national'),
        'provincial': prefs.getInt('provincial'),
        'municipal': prefs.getInt('municipal'),
        'houseOfRepDistricts': prefs.getStringList('houseOfRepDistricts'),
        'provincialBoardDistricts':
            prefs.getStringList('provincialBoardDistricts'),
        'councilorDistricts': prefs.getStringList('councilorDistricts'),
      }
    };

    if (data.isNotEmpty) {
      _userData.clear();
      setUserData(data);
    }

    notifyListeners();
  }

  updateLocationData(
      String region, String province, String municipality, String district) {
    _userData["location"].update("region", (value) => region);
    _userData["location"].update("province", (value) => province);
    _userData["location"].update("municipality", (value) => municipality);
    _userData["location"].update("district", (value) => district);

    notifyListeners();
  }

  //DESCRIPTION DATA
  final Map<String, dynamic> _positionDescription = {
    "president":
        "The President of the Philippines is elected by direct vote by the people for a term of six years. He may only serve for one term, and is ineligible for reelection. The term of the President of the Philippines starts at noon of the 30th day of June after the election.\n\nThe qualifications for an individual aspiring to become the President of the Philippines are outlined in Article VII, Section 2 of the 1987 Constitution. According to the constitution, an individual may become President provided he meets the following criteria:\n\n1.Natural born Filipino;\n2.A registered voter;\n3.Must be able to read and write;\n4.40 years of age at the day of the election;\nand\n5.Must have resided in the Philippines ten years before the election is held.",
    "vice-president":
        "The Vice President of the Philippines is elected by direct vote by the people for a term of six years, and may run for reelection once. The term of the Vice President of the Philippines starts at noon of the 30th day of June after a regular election is held.\n\nThe qualifications for aspirants to the Office of the Vice President is outlined in Article VII, Section 3. According to the constitution, the qualifications for the President is the same for the Vice President.",
    "senator":
        "The qualifications for aspirants to the Office of the Vice President is outlined in Article VII, Section 3. According to the constitution, the qualifications for the President is the same for the Vice President.\n\nThe Senate shall be composed of twenty-four Senators who shall be elected at large by the qualified voters of the Philippines, as may be provided by law; the House of Representatives shall be composed of not more than 250 (unless otherwise fixed by law), 20 percent of whom must be Party-list representatives.\n\nCongress is responsible for making enabling laws to make sure the spirit of the constitution is upheld in the country and, at times, amend or change the constitution itself. In order to craft laws, the legislative body comes out with two main documents: bills and resolutions.",
    "house-of-representatives":
        "According to the 1987 Constitution, legislative power shall be vested in the Congress of the Philippines, which shall consist of a Senate and a House of Representatives.\n\nThe House of Representatives shall be composed of not more than 250 (unless otherwise fixed by law), 20 percent of whom must be Party-list representatives.\n\n1. A natural-born citizen of the Philippines;\n2. At least twenty-five years old;\n3. Able to read and write; and\n4. Except the party-list representatives, a registered voter and a resident for at least one year in the district where s/he shall be elected. ",
    "party-list":
        "According to the 1987 Constitution, legislative power shall be vested in the Congress of the Philippines, which shall consist of a Senate and a House of Representatives.\n\nThe House of Representatives shall be composed of not more than 250 (unless otherwise fixed by law), 20 percent of whom must be Party-list representatives.\n\n1. A natural-born citizen of the Philippines;\n2. At least twenty-five years old;\n3. Able to read and write; and\n4. Except the party-list representatives, a registered voter and a resident for at least one year in the district where s/he shall be elected.",
    "governor":
        "The provincial governor, as the chief executive of the provincial government, shall exercise and perform the following powers and duties:\n\n1. Exercise general supervision and control over all programs, projects, services, and activities of the provincial government\n2. Enforce all laws and ordinances, and implement all approved policies, programs, projects, services and activities of the province\n3. Initiate and maximize the generation of resources and revenues, to be used for the implementation of development plans, program objectives and priorities\n4. Ensure the delivery of basic services and the provision of adequate facilities as provided for under Section 17 of the Local Government Code",
    "vice-governor":
        "The Vice Governor shall be the presiding officer of the Sangguniang Panlalawigan who formulates policies and programs for the realization of the vision, mission, and goals of the Province; appoint all officials and employees of the Sangguniang Panlalawigan subject to civil law, rules and regulations; assumes the office of the Governor in the event of temporary or permanent vacancy; exercise such powers, duties and functions as maybe prescribed by law or ordinance.",
    "provincial-board":
        "Provincial board, legislative branch of the government, of a province. Presided by the Vice Governor",
    "mayor":
        "The municipal mayor and city mayor, as the chief executive of the municipal government and city government, respectively, shall exercise and perform the following powers and functions:\n\n1. Exercise general supervision and control over all programs, projects, services, and activities of the municipal or city government\n2. Enforce all laws and ordinances, and implement all approved policies, programs, projects, services and activities of the municipality or city\n3. Initiate and maximize the generation of resources and revenues, to be used for the implementation of development plans, program objectives and priorities\n4. Ensure the delivery of basic services and the provision of adequate facilities as provided for under Section 17 of the Local Government Code.",
    "vice-mayor":
        "DUTIES AND FUNCTIONS\n\n1. Be presiding officer of the sangguniang bayan and sign all warrants drawn on the municipal treasury for all expenditures appropriated for the operation of the sangguniang bayan\n2. Appoint all officials and employees of the sangguniang bayan, except those whose manner of appointment is specifically provided in the Local Government Code;\n3. Assume the office of the mayor for the unexpired term of the latter in the event of permanent vacancy;\n4. Exercise the powers and perform the duties and functions of the mayor in case of temporary vacancy;\n5. Exercise such other powers and perform such other duties and functions as maybe prescribed by law or ordinance.",
    "councilors":
        "The presiding officer of the council is the Vice Mayor, who is elected citywide. The council is responsible for creating laws and ordinances under Manila's jurisdiction. The mayor can veto proposed bills, but the council can override it with a two-thirds supermajority.",
    "brgy-captain":
        "The punong barangay, as the chief executive of the barangay government, shall exercise and perform the following powers and functions:\n\n1. Enforce all laws and ordinances which are applicable within the barangay;\n2. Negotiate, enter into, and sign contracts for and in behalf of the barangay, upon authorization of the Sangguniang Barangay;\n3.	Maintain public order in the barangay;\n4. Call and preside over the sessions of the Sangguniang Barangay and the Barangay Assembly;\n5. Appoint or replace the barangay treasurer, the barangay secretary, and other appointive barangay officials;\n6. Organize and lead an emergency group for the maintenance of peace and order or on occasions of emergency or calamity within the barangay;\n7. Prepare the annual executive and supplemental budgets of the barangay, in coordination with the Barangay Development Council;\n8. Approve vouchers relating to the disbursement of barangay funds;\n9. Enforce laws and regulations relating to pollution control and protection of the environment;\n10. Administer the operation of the Katarungang Pambarangay;\n11. Exercise general supervision over the activities of the Sangguniang Kabataan;\n12. Ensure the delivery of basic social services and access to facilities;\n13. Conduct an annual palarong barangay which shall feature traditional sports and disciplines included in national and international games; and\n14. Promote the general welfare of the barangay.",
    "brgy-officer":
        "Helps the Brgy. Captain do his or her Job.They also Legislate, and deliberate on brgy. Ordinances\n\nAs the basic political unit, the Barangay serves as the primary planning and implementing unit of government policies, plans, programs, projects, and activities in the community, and as a forum wherein the collective views of the people may be expressed, crystallized and considered, and where disputes may be amicably settled.",
    "sk-chairman":
        "SK and Katipunan ng Kabataan (KK) were created through the Local Government Code of 1991 (Republic Act 7160) that provides opportunity for young people to directly participate in local governance;Composed of all youth aged 15 to 21-year-olds",
  };

  Map<String, dynamic> get positionDescription => _positionDescription;
}
