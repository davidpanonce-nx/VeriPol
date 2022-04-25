import 'package:uuid/uuid.dart';

class BaseUserModel {
  String id;

  BaseUserModel({required this.id});
}

class Location {
  String? region;
  String? province;
  String? municipality;
  String? district;
  String? barangay;

  Location(
      {this.region,
      this.province,
      this.municipality,
      this.barangay,
      this.district});

  toMap() {
    return {
      "region": region,
      "province": province,
      "municipality": municipality,
      "district": district,
      "barangay": barangay
    };
  }

  fromMap(Map<String, dynamic> data) {
    return Location(
      region: data["region"],
      province: data["province"],
      municipality: data["municipality"],
      barangay: data["barangay"],
      district: data["district"],
    );
  }
}

class MyCandidates {
  String? president;
  String? vicePresident;
  List<String>? senators;
  String? partyList;
  List<String>? houseRep;
  String? governor;
  String? viceGovernor;
  List<String>? provincialBoard;
  String? mayor;
  String? viceMayor;
  List<String>? cityCouncilors;
  String? barangayCaptain;
  List<String>? barangayCouncilors;
  String? skChairman;

  MyCandidates({
    this.president,
    this.vicePresident,
    this.senators,
    this.partyList,
    this.houseRep,
    this.governor,
    this.viceGovernor,
    this.provincialBoard,
    this.mayor,
    this.viceMayor,
    this.cityCouncilors,
    this.barangayCaptain,
    this.barangayCouncilors,
    this.skChairman,
  });
  toMap() {
    return {
      "president": president,
      "vicePresident": vicePresident,
      "senators": senators,
      "partyList": partyList,
      "houseRep": houseRep,
      "governor": governor,
      "viceGovernor": viceGovernor,
      "provincialBoard": provincialBoard,
      "mayor": mayor,
      "viceMayor": viceMayor,
      "cityCouncilors": cityCouncilors,
      "barangayCaptain": barangayCaptain,
      "barangayCouncilors": barangayCouncilors,
      "skChairman": skChairman,
    };
  }

  fromMap(Map<String, dynamic> data) {
    return MyCandidates(
      president: data["president"],
      vicePresident: data["vicePresident"],
      senators: List<String>.from(data["senators"] ?? []),
      partyList: data["partyList"],
      houseRep: List<String>.from(data["houseRep"] ?? []),
      governor: data["governor"],
      viceGovernor: data["viceGovernor"],
      provincialBoard: List<String>.from(data["provincialBoard"] ?? []),
      mayor: data["mayor"],
      viceMayor: data["viceMayor"],
      cityCouncilors: List<String>.from(data["cityCouncilors"] ?? []),
      barangayCaptain: data["barangayCaptain"],
      barangayCouncilors: List<String>.from(data["barangayCouncilors"] ?? []),
      skChairman: data["skChairman"],
    );
  }
}

class CandidateCount {
  int? national;
  int? provincial;
  int? municipal;
  int? total;
  List<String>? houseOfRepDistricts;
  List<String>? provincialBoardDistricts;
  List<String>? councilorDistricts;

  CandidateCount(
      {this.national,
      this.provincial,
      this.municipal,
      this.total,
      this.houseOfRepDistricts,
      this.provincialBoardDistricts,
      this.councilorDistricts});

  toMap() {
    return {
      "national": national,
      "provincial": provincial,
      "municipal": municipal,
      "total": total,
      "houseOfRepDistricts": houseOfRepDistricts,
      "provincialBoardDistricts": provincialBoardDistricts,
      "councilorDistricts": councilorDistricts,
    };
  }

  fromMap(Map<String, dynamic> data) {
    return CandidateCount(
      national: data["national"] ?? 0,
      provincial: data["provincial"] ?? 0,
      municipal: data["municipal"] ?? 0,
      total: data["total"] ?? 0,
      houseOfRepDistricts: List<String>.from(data["houseOfRepDistricts"] ?? []),
      provincialBoardDistricts:
          List<String>.from(data["provincialBoardDistricts"] ?? []),
      councilorDistricts: List<String>.from(data["councilorDistricts"] ?? []),
    );
  }
}

class VeripolUser {
  late String id;
  late String firstName;
  late String lastName;
  late String email;
  DateTime created = DateTime.now();
  Location location = Location();
  MyCandidates myCandidates = MyCandidates();
  CandidateCount candidates = CandidateCount();

  VeripolUser(this.id, this.firstName, this.lastName, this.email);

  toMap() {
    return {
      "id": id,
      "created": created.toString(),
      "first_name": firstName,
      "last_name": lastName,
      "email": email,
      "location": location.toMap(),
      "my_candidates": myCandidates.toMap(),
      "candidates": candidates.toMap()
    };
  }
}

class VeriPolUserData {
  String? firstName;

  Location? location;
  MyCandidates? myCandidates;
  CandidateCount? candidates;

  VeriPolUserData({
    this.firstName,
    this.location,
    this.myCandidates,
    this.candidates,
  });

  VeriPolUserData fromMap(Map<String, dynamic> data) {
    return VeriPolUserData(
      firstName: data['first_name'],
      location: Location().fromMap(data["location"]),
      myCandidates: MyCandidates().fromMap(data["my_candidates"]),
      candidates: CandidateCount().fromMap(data["candidates"]),
    );
  }

  toMap() {}
}

class Choice {
  String? choice;
  bool? isAnswer;

  Choice(this.choice, this.isAnswer);

  toMap() {
    return {
      "choice": choice,
      "isAnswer": isAnswer,
    };
  }
}

class MCQItem {
  String? question;
  int? questionPoints;
  List<Choice>? choices;

  MCQItem(this.question, this.questionPoints, this.choices);

  toMap() {
    List<Map<String, dynamic>> listMapChoices = [];
    for (var choice in choices!) {
      listMapChoices.add(choice.toMap());
    }
    return {
      "question": question,
      "questionPoints": questionPoints,
      "choices": listMapChoices,
    };
  }
}

class TestModule {
  String? title;
  String uid = const Uuid().v4();
  double? passingGrade;
  int? latestScore;
  int? totalScore;
  List<MCQItem>? items;

  TestModule(this.title, this.passingGrade, this.latestScore, this.items);

  toMap() {
    List<Map<String, dynamic>> listMapItems = [];
    for (var item in items!) {
      listMapItems.add(item.toMap());
    }
    return {
      "uid": uid,
      "title": title,
      "passingGrade": passingGrade,
      "latestScore": latestScore,
      "totalScore": totalScore,
      "items": listMapItems,
    };
  }
}

class CandidateData {
  String id;
  String name;
  String sex;
  String imgURL;
  String profileURL;
  Map<String, dynamic> filedCandidacies;
  List<dynamic> houseBills;
  List<dynamic> senateBills;

  CandidateData({
    required this.id,
    required this.name,
    required this.sex,
    required this.imgURL,
    required this.filedCandidacies,
    required this.houseBills,
    required this.senateBills,
    required this.profileURL,
  });
}
