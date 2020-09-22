import 'package:flutter/material.dart';

class MemberProvider extends ChangeNotifier {
  double level = 3; // default member level
  String tel = '000-000-0000'; //default Telephone number

  void changeLevel(double userLevel) {
    if (validateLevel(userLevel)) {
      level = userLevel;
    }
    notifyListeners();
  }

  bool validateLevel(double userLevel) {
    if (userLevel < 0 || userLevel > 5) {
      return false;
    }
    return true;
  }
}
