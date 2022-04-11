import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:veripol/controller/data_controller.dart';
import 'package:veripol/services/firestore_db.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  final FirebaseFirestoreService _firestore = FirebaseFirestoreService();

  Future<void> signInWithGoogle() async {
    final GoogleSignInAccount? googleSignInAccount =
        await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount!.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );
    User? user = (await _auth.signInWithCredential(credential)).user;
    if (!(await _firestore.checkGoogleAccountData(user!.uid))) {
      String firstName;
      String lastName;
      if (googleSignInAccount.displayName != null) {
        firstName = googleSignInAccount.displayName!.split(" ").first;
        lastName = googleSignInAccount.displayName!.split(" ").last;
      } else {
        firstName = "Ka-VeriPol";
        lastName = "";
      }
      await _firestore.createGoogleAccountData(
          user.uid, firstName, lastName, googleSignInAccount.email);
      Map<String, dynamic> userData = {};
      userData = await DataController().userStarterData();

      if (userData.isNotEmpty) {
        DataController().cacheUserData(userData);
      }
    } else {
      Map<String, dynamic> userData = {};
      userData = await DataController().userStarterData();

      if (userData.isNotEmpty) {
        DataController().cacheUserData(userData);
      }
    }
  }

  Future<void> signOutFromGoogle() async {
    await _googleSignIn.disconnect();
    await _auth.signOut();
  }
}
