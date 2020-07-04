import 'dart:async';

import 'package:shiftend/repositories/interfaces/user_repository_interface.dart';
import 'package:shiftend/models/models.dart';

class UserRepositoryMock extends UserRepositoryInterface {
  List<User> users = <User>[
    User(
        id: '0',
        email: 'test@example.com',
        iconUrl:
            'https://tblg.k-img.com/restaurant/images/Rvw/29971/640x640_rect_29971374.jpg',
        name: '佐藤 勇一郎',
        role: 'オーナー',
        level: '100'),
    User(
        id: '1',
        email: 'test@example.com',
        iconUrl:
            'https://tblg.k-img.com/restaurant/images/Rvw/29971/640x640_rect_29971374.jpg',
        name: '工藤 大輔',
        role: 'オーナー',
        level: '100'),
    User(
        id: '2',
        email: 'test@example.com',
        iconUrl:
            'https://tblg.k-img.com/restaurant/images/Rvw/29971/640x640_rect_29971374.jpg',
        name: '松山 航',
        role: 'バイトリーダ',
        level: '50'),
  ];
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

  @override
  Future<List<User>> getUsers() async {
    return users;
  }

  
}
