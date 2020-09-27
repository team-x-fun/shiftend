import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shiftend/models/models.dart';

abstract class UserRepositoryInterface {
  Future<void> register(String email, String password);
  Future<void> signIn(String email, String password);
  Future<void> signOut();
  Future<void> create(User user);
  Future<void> update(User user);
  Future<User> getCurrentUser();
  Future<User> getUser(String userId);
  Future<List<User>> getUsers();
  Future<bool> isLogin();
  Future<DocumentReference> getUserRef(String userId);
  Future<User> fromUserRef(DocumentReference userRef);
  Future<User> findByEmail(String email);
  Future<void> uploadIcon(String id, File file);
}
