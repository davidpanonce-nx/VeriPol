import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:veripol/functions.dart';

import '../models/models.dart';

class PageControllers with ChangeNotifier {
  int _bottomNavIndex = 0;

  int get bottomNavIndex => _bottomNavIndex;

  setBottomNavIndex(int index) {
    _bottomNavIndex = index;
    notifyListeners();
  }

  String dateTimeFormatter(DateTime date) {
    String year = date.year.toString();
    String day;
    String month;

    switch (date.month) {
      case 1:
        month = "January";
        break;
      case 2:
        month = "February";
        break;
      case 3:
        month = "March";
        break;
      case 4:
        month = "April";
        break;
      case 5:
        month = "May";
        break;
      case 6:
        month = "June";
        break;
      case 7:
        month = "July";
        break;
      case 8:
        month = "August";
        break;
      case 9:
        month = "September";
        break;
      case 10:
        month = "October";
        break;
      case 11:
        month = "November";
        break;
      default:
        month = "December";
        break;
    }

    if (date.day < 10) {
      day = date.day.toString().padLeft(2, "0");
    } else {
      day = date.day.toString();
    }
    return month + " " + day + ", " + year;
  }

  // Signup Pages
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  validateSignup1() {
    return firstNameController.text.isNotEmpty &&
        lastNameController.text.isNotEmpty;
  }

  validateSignup2() {
    return emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        confirmPasswordController.text == passwordController.text;
  }

  signup() async {
    final response = await signUp(
        emailController.text.trim(), passwordController.text.trim());

    if (response["response"] == 200) {
      VeripolUser veripolUser = VeripolUser(
        response["data"],
        firstNameController.text.trim(),
        lastNameController.text.trim(),
        emailController.text.trim(),
      );
      FirebaseFirestore.instance
          .collection('User')
          .doc(response["data"])
          .set(veripolUser.toMap());
    }
    return response;
  }
  // End of Signup Pages

  // Sign In Pages
  TextEditingController signInEmailController = TextEditingController();
  TextEditingController signInPasswordController = TextEditingController();

  validateSignIn() {
    return signInEmailController.text.isNotEmpty &&
        signInPasswordController.text.isNotEmpty;
  }

  signin() {
    final response = signIn(signInEmailController.text.trim(),
        signInPasswordController.text.trim());
    return response;
  }
  // End of Sign In Pages
}
