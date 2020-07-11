import 'dart:async';

import 'package:meta/meta.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:shiftend/models/models.dart';
import 'interfaces/user_repository_interface.dart';

class UserRepository extends UserRepositoryInterface {
  final Firestore firestore;
  final FirebaseAuth auth;
  final String collectionName = 'users';

  UserRepository({@required this.firestore, @required this.auth})
      : assert(firestore != null && auth != null);

  @override
  Future<void> create(User user) async {
    final String uid = await auth.currentUser().then((user) => user.uid);
    await firestore
        .collection(collectionName)
        .document(uid)
        .setData(user.toJson()..remove('id'));
  }

  @override
  Future<void> update(User user) async {
    final String uid = await auth.currentUser().then((user) => user.uid);
    await firestore
        .collection(collectionName)
        .document(uid)
        .updateData(user.toJson()..remove('id'));
  }

  @override
  Future<User> getCurrentUser() async {
    final String uid = await auth.currentUser().then((user) => user.uid);
    final snapshot =
        await firestore.collection(collectionName).document(uid).get();
    return User.fromJson(snapshot.data);
  }

  @override
  Future<List<User>> getUsers() async {
    // TODO: implement getUsers

    throw UnimplementedError();
  }
}
