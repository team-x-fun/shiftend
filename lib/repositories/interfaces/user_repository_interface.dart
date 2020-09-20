import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shiftend/models/models.dart';

abstract class UserRepositoryInterface {
  Future<void> register(String email, String password);
  Future<void> signIn(String email, String password);
  Future<void> signOut();
  Future<void> create(ShiftendUser user);
  Future<void> update(ShiftendUser user);
  Future<ShiftendUser> getCurrentUser();
  Future<ShiftendUser> getUser(String userId);
  Future<List<ShiftendUser>> getUsers();
  Future<bool> isLogin();
  Future<DocumentReference> getUserRef(String userId);
  Future<ShiftendUser> fromUserRef(DocumentReference userRef);
}
