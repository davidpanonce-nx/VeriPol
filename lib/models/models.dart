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
  
  abstract class ProfileData {
  String id;
  String fullName;
  String ballotName;
  String position;
  String politicalParty;
  int ballotNumber;
  String? about;

  ProfileData({
    required this.id,
    required this.fullName,
    required this.ballotName,
    required this.position,
    required this.politicalParty,
    required this.ballotNumber,
    this.about,
  });
}

class PresidentProfile extends ProfileData {
  List<Map<String, dynamic>>? platforms;
  int? totalAuthoredBills;
  int? totalEnactedBills;
  List<Map<String, dynamic>>? accomplishments;
  List<Map<String, dynamic>>? advocacies;
  List<Map<String, dynamic>>? relevantExperience;

  PresidentProfile({
    required String id,
    required String fullName,
    required String ballotName,
    required String position,
    required String politicalParty,
    required int ballotNumber,
    String? about,
    this.platforms,
    this.totalAuthoredBills,
    this.totalEnactedBills,
    this.accomplishments,
    this.advocacies,
    this.relevantExperience,
  }) : super(
          id: id,
          fullName: fullName,
          ballotName: ballotName,
          position: position,
          politicalParty: politicalParty,
          ballotNumber: ballotNumber,
          about: about,
        );
}

class VicePresidentProfile extends PresidentProfile {
  VicePresidentProfile({
    required String id,
    required String fullName,
    required String ballotName,
    required String position,
    required String politicalParty,
    required int ballotNumber,
    String? about,
    List<Map<String, dynamic>>? platforms,
    int? totalAuthoredBills,
    int? totalEnactedBills,
    List<Map<String, dynamic>>? accomplishments,
    List<Map<String, dynamic>>? advocacies,
    List<Map<String, dynamic>>? relevantExperience,
  }) : super(
          id: id,
          fullName: fullName,
          ballotName: ballotName,
          position: position,
          politicalParty: politicalParty,
          ballotNumber: ballotNumber,
          about: about,
          platforms: platforms,
          totalAuthoredBills: totalAuthoredBills,
          totalEnactedBills: totalEnactedBills,
          accomplishments: accomplishments,
          advocacies: advocacies,
          relevantExperience: relevantExperience,
        );
}

class Senator extends ProfileData {
  List<Map<String, dynamic>>? educationalBackground;
  List<Map<String, dynamic>>? relevantExperiences;

  Senator({
    required String id,
    required String fullName,
    required String ballotName,
    required String position,
    required String politicalParty,
    required int ballotNumber,
    String? about,
    this.educationalBackground,
    this.relevantExperiences,
  }) : super(
          id: id,
          fullName: fullName,
          ballotName: ballotName,
          position: position,
          politicalParty: politicalParty,
          ballotNumber: ballotNumber,
          about: about,
        );
}

class HouseOfRepresentatives extends ProfileData {
  int? totalAuthoredBills;
  int? totalEnactedBills;
  List<Map<String, dynamic>>? accomplishments;
  List<Map<String, dynamic>>? relevantExperiences;

  HouseOfRepresentatives({
    required String id,
    required String fullName,
    required String ballotName,
    required String position,
    required String politicalParty,
    required int ballotNumber,
    String? about,
    this.totalAuthoredBills,
    this.totalEnactedBills,
    this.accomplishments,
    this.relevantExperiences,
  }) : super(
          id: id,
          fullName: fullName,
          ballotName: ballotName,
          position: position,
          politicalParty: politicalParty,
          ballotNumber: ballotNumber,
          about: about,
        );
}

class Governor extends ProfileData {
  List<Map<String, dynamic>>? aboutTheArea;
  List<Map<String, dynamic>>? statistics;

  Governor({
    required String id,
    required String fullName,
    required String ballotName,
    required String position,
    required String politicalParty,
    required int ballotNumber,
    String? about,
    this.aboutTheArea,
    this.statistics,
  }) : super(
          id: id,
          fullName: fullName,
          ballotName: ballotName,
          position: position,
          politicalParty: politicalParty,
          ballotNumber: ballotNumber,
          about: about,
        );
}

class ViceGovernor extends Governor {
  ViceGovernor({
    required String id,
    required String fullName,
    required String ballotName,
    required String position,
    required String politicalParty,
    required int ballotNumber,
    String? about,
    List<Map<String, dynamic>>? aboutTheArea,
    List<Map<String, dynamic>>? statistics,
  }) : super(
          id: id,
          fullName: fullName,
          ballotName: ballotName,
          position: position,
          politicalParty: politicalParty,
          ballotNumber: ballotNumber,
          about: about,
          aboutTheArea: aboutTheArea,
          statistics: statistics,
        );
}

class Mayor extends ProfileData {
  List<Map<String, dynamic>>? aboutTheArea;
  List<Map<String, dynamic>>? statistics;

  Mayor({
    required String id,
    required String fullName,
    required String ballotName,
    required String position,
    required String politicalParty,
    required int ballotNumber,
    String? about,
    this.aboutTheArea,
    this.statistics,
  }) : super(
          id: id,
          fullName: fullName,
          ballotName: ballotName,
          position: position,
          politicalParty: politicalParty,
          ballotNumber: ballotNumber,
          about: about,
        );
}

class ViceMayor extends Mayor {
  ViceMayor({
    required String id,
    required String fullName,
    required String ballotName,
    required String position,
    required String politicalParty,
    required int ballotNumber,
    String? about,
    List<Map<String, dynamic>>? aboutTheArea,
    List<Map<String, dynamic>>? statistics,
  }) : super(
          id: id,
          fullName: fullName,
          ballotName: ballotName,
          position: position,
          politicalParty: politicalParty,
          ballotNumber: ballotNumber,
          about: about,
          aboutTheArea: aboutTheArea,
          statistics: statistics,
        );
}

class ProvincialBoard extends ProfileData {
  List<Map<String, dynamic>>? aboutTheArea;
  ProvincialBoard({
    required String id,
    required String fullName,
    required String ballotName,
    required String position,
    required String politicalParty,
    required int ballotNumber,
    String? about,
    this.aboutTheArea,
  }) : super(
          id: id,
          fullName: fullName,
          ballotName: ballotName,
          position: position,
          politicalParty: politicalParty,
          ballotNumber: ballotNumber,
          about: about,
        );
}

class Councilors extends ProvincialBoard {
  Councilors({
    required String id,
    required String fullName,
    required String ballotName,
    required String position,
    required String politicalParty,
    required int ballotNumber,
    String? about,
    List<Map<String, dynamic>>? aboutTheArea,
  }) : super(
          id: id,
          fullName: fullName,
          ballotName: ballotName,
          position: position,
          politicalParty: politicalParty,
          ballotNumber: ballotNumber,
          about: about,
          aboutTheArea: aboutTheArea,
        );

}
  
