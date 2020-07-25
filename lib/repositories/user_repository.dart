import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
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
  Future<bool> isLogin() async {
    return auth.currentUser().then((user) => user != null);
  }

  @override
  Future<List<User>> getUsers() async {
    // TODO: implement getUsers

    throw UnimplementedError();
  }

  @override
  Future<void> register(String email, String password) async {
    User user;
    await auth
        .createUserWithEmailAndPassword(email: email.trim(), password: password)
        .then((authResult) => {
              user = User(
                  id: authResult.user.uid,
                  email: email.trim(),
                  name: email.trim(),
                  role: 'アルバイト',
                  level: '100',
                  iconUrl: 'https://avatars0.githubusercontent.com/u/57802072'),
              create(user),
            });
  }

  @override
  Future<void> signIn(String email, String password) async {
    await auth.signInWithEmailAndPassword(
        email: email.trim(), password: password);
  }

  @override
  Future<void> signOut() async {
    await auth.signOut();
  }

  @override
  Future<DocumentReference> getUserRef(String userId) async {
    return firestore.collection(collectionName).document(userId);
  }

  @override
  Future<User> fromUserRef(DocumentReference userRef) async {
    return User.fromJson((await userRef.get()).data);
  }

  @override
  Future<User> getUser(String userId) async {
    final DocumentSnapshot snapshot =
        await firestore.collection(collectionName).document(userId).get();
    return User.fromJson(snapshot.data);
  }
}
