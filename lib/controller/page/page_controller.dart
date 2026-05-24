import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:veripol/controller/page/page_state.dart';
import 'package:veripol/functions.dart';
import 'package:veripol/models/models.dart';

class PageController extends StateNotifier<PageState> {
  PageController() : super(const PageState(isGoogleAccount: false, bottomNavIndex: 0));

  void setIsGoogleAccount(bool val) {
    state = state.copyWith(isGoogleAccount: val);
  }

  void setBottomNavIndex(int index) {
    state = state.copyWith(bottomNavIndex: index);
  }

  String dateTimeFormatter(DateTime date) {
    String year = date.year.toString();
    String day = date.day < 10 ? date.day.toString().padLeft(2, "0") : date.day.toString();
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

    return "$month $day, $year";
  }

  Future<Map<String, dynamic>> signup(
    String firstName,
    String lastName,
    String email,
    String password,
  ) async {
    final response = await signUp(email.trim(), password.trim());
    if (response["response"] == 200) {
      VeripolUser veripolUser = VeripolUser(
        response["data"],
        firstName.trim(),
        lastName.trim(),
        email.trim(),
      );
      FirebaseFirestore.instance.collection('User').doc(response["data"]).set(veripolUser.toMap());
    }
    return response;
  }

  Future<Map<String, dynamic>> signin(String email, String password) async {
    final response = await signIn(email.trim(), password.trim());
    return response;
  }
}

// PageController provider
final pageControllerProvider = StateNotifierProvider<PageController, PageState>((ref) => PageController());
