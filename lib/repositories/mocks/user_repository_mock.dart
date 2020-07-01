import 'dart:async';

import 'package:shiftend/repositories/interfaces/user_repository_interface.dart';
import 'package:shiftend/models/models.dart';

class UserRepositoryMock extends UserRepositoryInterface {
  List<User> users = <User>[];
  User currentUser = User(
      id: 'test_user',
      email: 'test@example.com',
      name: 'test太郎',
      role: 'オーナー',
      level: '100',
      iconUrl: 'https://avatars0.githubusercontent.com/u/57802072');

  @override
  Future<void> create(User user) async {
    users.add(user);
    return Future.value();
  }

  @override
  Future<User> getCurrentUser() async {
    return Future.value(currentUser);
  }

  @override
  Future<void> update(User user) async {
    users.asMap().forEach((key, value) {
      if (value.id == user.id) {
        users[key] = user;
        return;
      }
    });
    return Future.value();
  }
}
