import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shiftend/models/models.dart';
import 'package:shiftend/repositories/interfaces/user_repository_interface.dart';

class UserRepositoryMock extends UserRepositoryInterface {
  UserRepositoryMock() {
    currentUser = defaultUser;
  }
  final List<User> _users = <User>[
    const User(
      id: '0',
      email: 'owner@example.com',
      iconUrl:
          'https://tblg.k-img.com/restaurant/images/Rvw/29971/640x640_rect_29971374.jpg',
      name: '佐藤 勇一郎',
    ),
    const User(
      id: '1',
      email: 'member1@example.com',
      iconUrl:
          'https://tblg.k-img.com/restaurant/images/Rvw/29971/640x640_rect_29971374.jpg',
      name: '工藤 大輔',
    ),
    const User(
      id: '2',
      email: 'member2@example.com',
      iconUrl:
          'https://tblg.k-img.com/restaurant/images/Rvw/29971/640x640_rect_29971374.jpg',
      name: '松山 航',
    ),
    const User(
        id: 'test_user',
        email: 'member3@example.com',
        name: 'test太郎',
        iconUrl: 'https://avatars0.githubusercontent.com/u/57802072'),
  ];
  List<User> get users => _users;
  final User defaultUser = const User(
    email: '',
    name: 'ログインされていません．',
    iconUrl:
        'https://cdn.icon-icons.com/icons2/1378/PNG/512/avatardefault_92824.png',
  );

  User currentUser;

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
  Future<void> signIn(String email, String password) async {
    users.forEach((user) {
      if (user.email == email && password == 'password') {
        currentUser = user;
        return;
      }
    });
    return;
  }

  @override
  Future<DocumentReference> getUserRef(String userId) {
    // TODO: implement getUserRef
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() async {
    currentUser = defaultUser;
  }

  @override
  Future<User> fromUserRef(DocumentReference userRef) {
    // TODO: implement fromUserRef
    throw UnimplementedError();
  }

  @override
  Future<User> getUser(String userId) async {
    return users.singleWhere((user) => user.id == userId);
  }

  @override
  Future<User> findByEmail(String email) {
    // TODO: implement findByEmail
    throw UnimplementedError();
  }

  @override
  Future<void> uploadIcon(String id, File file) {
    // TODO: implement uploadIcon
    throw UnimplementedError();
  }
}
