import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:veripol/models/models.dart';

class FirebaseFirestoreService {
  //User data creation
  final CollectionReference _user =
      FirebaseFirestore.instance.collection('User');

  //Check if google account data is present in dB
  Future<bool> checkGoogleAccountData(String id) async {
    bool temp;
    temp = await _user.doc(id).get().then((value) => value.exists);
    return temp;
  }

  //create firestore data for google account
  Future<void> createGoogleAccountData(
      String id, String firstName, String lastName, String email) async {
    VeripolUser user = VeripolUser(id, firstName, lastName, email);
    await _user.doc(id).set(user.toMap());
  }
}
