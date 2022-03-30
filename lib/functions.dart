import 'package:firebase_auth/firebase_auth.dart';

Future signUp(email, password) async {
  try {
    final response = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    return {'response': 200, 'data': response.user!.uid};
  } on FirebaseAuthException catch (e) {
    if (e.code == "email-already-in-use") {
      return {'response': 400, 'data': "Email already exists"};
    } else if (e.code == "invalid-email") {
      return {'response': 400, 'data': "Invalid Email Format"};
    } else if (e.code == "operation-not-allowed") {
      return {
        'response': 400,
        'data': "Something went wrong. Please contact admin"
      };
    } else if (e.code == "weak-password") {
      return {'response': 400, 'data': "Password is too weak"};
    }
  }
}

Future signIn(email, password) async {
  try {
    final response = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    return {'response': 200, 'data': response.user!.uid};
  } on FirebaseAuthException catch (e) {
    if (e.code == "invalid-email") {
      return {'response': 400, 'data': "Email address is not valid"};
    } else if (e.code == "user-disabled") {
      return {'response': 400, 'data': "User with that credential is disabled"};
    } else if (e.code == "user-not-found") {
      return {'response': 400, 'data': "User not found"};
    } else if (e.code == "wrong-password") {
      return {'response': 400, 'data': "Incorrect password"};
    }
  }
}

Future signOut() async {
  await FirebaseAuth.instance.signOut();
}
