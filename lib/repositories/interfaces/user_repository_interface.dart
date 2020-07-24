import 'package:shiftend/models/models.dart';

abstract class UserRepositoryInterface {
  Future<void> register(String email, String password);
  Future<void> signIn(String email, String password);
  Future<void> create(User user);
  Future<void> update(User user);
  Future<User> getCurrentUser();
  Future<List<User>> getUsers();
  Future<bool> isLogin();
}
