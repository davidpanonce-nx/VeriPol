import 'package:uuid/uuid.dart';

class Location {
  String? region;
  String? province;
  String? municipality;
  String? district;
  String? barangay;

  toMap() {
    return {
      "region": region,
      "province": province,
      "municipality": municipality,
      "district": district,
      "barangay": barangay
    };
  }
}

class MyCandidates {
  String? president;
  String? vicePresident;
  List<String>? senators;
  String? partyList;
  String? houseRep;
  String? mayor;
  String? viceMayor;
  List<String>? cityCouncilors;
  String? barangayCaptain;
  List<String>? barangayCouncilors;

  toMap() {
    return {
      "president": president,
      "vicePresident": vicePresident,
      "senators": senators,
      "partyList": partyList,
      "houseRep": houseRep,
      "mayor": mayor,
      "viceMayor": viceMayor,
      "cityCouncilors": cityCouncilors,
      "barangayCaptain": barangayCaptain,
      "barangayCouncilors": barangayCouncilors
    };
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

  VeripolUser(this.id, this.firstName, this.lastName, this.email);

  toMap() {
    return {
      "id": id,
      "created": created.toString(),
      "first_name": firstName,
      "last_name": lastName,
      "email": email,
      "location": location.toMap(),
      "my_candidates": myCandidates.toMap()
    };
  }
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
  String uid = Uuid().v4();
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
