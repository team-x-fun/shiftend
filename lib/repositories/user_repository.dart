import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebaseauth;
import 'package:meta/meta.dart';
import 'package:shiftend/models/models.dart';

import 'interfaces/user_repository_interface.dart';

class UserRepository extends UserRepositoryInterface {
  UserRepository({@required this.firestore, @required this.auth})
      : assert(firestore != null && auth != null);

  final FirebaseFirestore firestore;
  final firebaseauth.FirebaseAuth auth;
  static const String collectionName = 'users';
  final User defaultUser = const User(
    email: '',
    name: 'ログインされていません．',
    iconUrl:
        'https://cdn.icon-icons.com/icons2/1378/PNG/512/avatardefault_92824.png',
  );

  @override
  Future<void> create(User user) async {
    final String uid = auth.currentUser.uid;
    await firestore.collection(collectionName).doc(uid).set(user.toJson());
  }

  @override
  Future<void> update(User user) async {
    final String uid = auth.currentUser.uid;
    await firestore.collection(collectionName).doc(uid).update(user.toJson());
  }

  @override
  Future<User> getCurrentUser() async {
    final currentUser = auth.currentUser;
    if (currentUser == null) {
      return defaultUser;
    }
    final uid = currentUser.uid;
    final snapshot = await firestore.collection(collectionName).doc(uid).get();
    final user = User.fromJson(snapshot.data());
    return user.copyWith(id: uid);
  }

  @override
  Future<bool> isLogin() async {
    return auth.currentUser != null;
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
    return firestore.collection(collectionName).doc(userId);
  }

  @override
  Future<User> fromUserRef(DocumentReference userRef) async {
    return User.fromJson((await userRef.get()).data());
  }

  @override
  Future<User> getUser(String userId) async {
    final DocumentSnapshot snapshot =
        await firestore.collection(collectionName).doc(userId).get();
    return User.fromJson(snapshot.data());
  }
}
