import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:shiftend/models/models.dart';

import 'interfaces/user_repository_interface.dart';

class UserRepository extends UserRepositoryInterface {
  UserRepository({@required this.firestore, @required this.auth})
      : assert(firestore != null && auth != null);

  final FirebaseFirestore firestore;
  final FirebaseAuth auth;
  static const String collectionName = 'users';
  final ShiftendUser defaultUser = const ShiftendUser(
    email: '',
    name: 'ログインされていません．',
    iconUrl:
        'https://cdn.icon-icons.com/icons2/1378/PNG/512/avatardefault_92824.png',
  );

  @override
  Future<void> create(ShiftendUser user) async {
    final String uid = auth.currentUser.uid;
    await firestore.collection(collectionName).doc(uid).set(user.toJson());
  }

  @override
  Future<void> update(ShiftendUser user) async {
    final String uid = auth.currentUser.uid;
    await firestore.collection(collectionName).doc(uid).update(user.toJson());
  }

  @override
  Future<ShiftendUser> getCurrentUser() async {
    final User currentUser = auth.currentUser;
    if (currentUser == null) {
      return defaultUser;
    }
    final uid = currentUser.uid;
    final snapshot = await firestore.collection(collectionName).doc(uid).get();
    final user = ShiftendUser.fromJson(snapshot.data());
    return user.copyWith(id: uid);
  }

  @override
  Future<bool> isLogin() async {
    return auth.currentUser != null;
  }

  @override
  Future<List<ShiftendUser>> getUsers() async {
    // TODO: implement getUsers

    throw UnimplementedError();
  }

  @override
  Future<void> register(String email, String password) async {
    ShiftendUser user;
    await auth
        .createUserWithEmailAndPassword(email: email.trim(), password: password)
        .then((authResult) => {
              user = ShiftendUser(
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
  Future<ShiftendUser> fromUserRef(DocumentReference userRef) async {
    return ShiftendUser.fromJson((await userRef.get()).data());
  }

  @override
  Future<ShiftendUser> getUser(String userId) async {
    final DocumentSnapshot snapshot =
        await firestore.collection(collectionName).doc(userId).get();
    return ShiftendUser.fromJson(snapshot.data());
  }
}
