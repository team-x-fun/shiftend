import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shiftend/models/models.dart';
import 'package:shiftend/repositories/interfaces/user_repository_interface.dart';

class UserRepositoryMock extends UserRepositoryInterface {
  final List<User> _users = <User>[
    const User(
        id: '0',
        email: 'test@example.com',
        iconUrl:
            'https://tblg.k-img.com/restaurant/images/Rvw/29971/640x640_rect_29971374.jpg',
        name: '佐藤 勇一郎',
        role: 'オーナー',
        level: '100'),
    const User(
        id: '1',
        email: 'test@example.com',
        iconUrl:
            'https://tblg.k-img.com/restaurant/images/Rvw/29971/640x640_rect_29971374.jpg',
        name: '工藤 大輔',
        role: 'オーナー',
        level: '100'),
    const User(
        id: '2',
        email: 'test@example.com',
        iconUrl:
            'https://tblg.k-img.com/restaurant/images/Rvw/29971/640x640_rect_29971374.jpg',
        name: '松山 航',
        role: 'バイトリーダ',
        level: '50'),
  ];
  List<User> get users => _users;
  User currentUser = const User(
      id: 'test_user',
      email: 'test@example.com',
      name: 'test太郎',
      role: 'オーナー',
      level: '100',
      iconUrl: 'https://avatars0.githubusercontent.com/u/57802072');

  @override
  Future<void> create(User user) async {
    users.add(user);
    return;
  }

  @override
  Future<User> getCurrentUser() async {
    return currentUser;
  }

  @override
  Future<void> update(User user) async {
    users.asMap().forEach((key, value) {
      if (value.id == user.id) {
        users[key] = user;
        return;
      }
    });
    return;
  }

  @override
  Future<List<User>> getUsers() async {
    return users;
  }

  @override
  Future<bool> isLogin() async {
    return currentUser != null;
  }

  @override
  Future<void> register(String email, String password) {
    // TODO: implement register
    throw UnimplementedError();
  }

  @override
  Future<void> signIn(String email, String password) {
    // TODO: implement signIn
  }

  Future<DocumentReference> getUserRef(String userId) {
    // TODO: implement getUserRef
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
  }

  Future<User> fromUserRef(DocumentReference userRef) {
    // TODO: implement fromUserRef
    throw UnimplementedError();
  }

  @override
  Future<User> getUser(String userId) async {
    return users.singleWhere((user) => user.id == userId);
  }
}
