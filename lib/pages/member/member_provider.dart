import 'package:flutter/material.dart';
//import 'package:shiftend/models/user/user.dart';

class MemberProvider extends ChangeNotifier {
//  User user;
//  MemberProvider(this.user);

//  String level = user.level;
  String level = '0';

  void changeLevel(String userLevel) {
    level = userLevel;
    notifyListeners();
  }
}
