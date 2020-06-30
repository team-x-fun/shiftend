import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:shiftend/models/models.dart';

class UserRepository {
  final Firestore firestore;
  final FirebaseAuth auth;
  final String collectionName = 'users';

  UserRepository({this.firestore, this.auth})
      : assert(firestore != null && auth != null);

  Future<void> create(User user) async {
    final String uid = await auth.currentUser().then((user) => user.uid);
    await firestore
        .collection(collectionName)
        .document(uid)
        .setData(user.toJson()..remove('id'));
  }

  Future<void> updateUser(User user) async {
    final String uid = await auth.currentUser().then((user) => user.uid);
    await firestore
        .collection(collectionName)
        .document(uid)
        .updateData(user.toJson()..remove('id'));
  }

  Future<User> getCurrentUser() async {
    final String uid = await auth.currentUser().then((user) => user.uid);
    final snapshot =
        await firestore.collection(collectionName).document(uid).get();
    return User.fromJson(snapshot.data);
  }
}
