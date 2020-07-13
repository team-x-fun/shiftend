import 'dart:async';

import 'package:meta/meta.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:shiftend/models/models.dart';
import 'interfaces/user_repository_interface.dart';

class UserRepository extends UserRepositoryInterface {
  UserRepository({@required this.firestore, @required this.auth})
      : assert(firestore != null && auth != null);

  final Firestore firestore;
  final FirebaseAuth auth;
  static const String collectionName = 'users';

  @override
  Future<void> create(User user) async {
    final String uid = await auth.currentUser().then((user) => user.uid);
    await firestore
        .collection(collectionName)
        .document(uid)
        .setData(user.toJson());
  }

  @override
  Future<void> update(User user) async {
    final String uid = await auth.currentUser().then((user) => user.uid);
    await firestore
        .collection(collectionName)
        .document(uid)
        .updateData(user.toJson());
  }

  @override
  Future<User> getCurrentUser() async {
    final String uid = await auth.currentUser().then((user) => user.uid);
    final snapshot =
        await firestore.collection(collectionName).document(uid).get();
    final user = User.fromJson(snapshot.data);
    return user.copyWith(id: uid);
  }

  @override
  Future<List<User>> getUsers() async {
    // TODO: implement getUsers

    throw UnimplementedError();
  }
}
