import 'package:flutter/material.dart';

class MemberProvider extends ChangeNotifier {
  String level = 'レベル未設定';
  bool levelInputFlag = false;

  void changeLevel(String userLevel) {
    if (validateLevel(userLevel)) {
      level = 'Lv.$userLevel';
      levelInputFlag = true;
    }
    notifyListeners();
  }

  bool validateLevel(String userLevel) {
    // 未入力の場合
    if (userLevel == '') {
      return false;
    }
    return true;
  }
}
