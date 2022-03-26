import 'package:flutter/material.dart';

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
}
