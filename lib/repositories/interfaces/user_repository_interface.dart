import 'package:shiftend/models/models.dart';

abstract class UserRepositoryInterface {
  Future<void> create(User user);
  Future<void> update(User user);
  Future<User> getCurrentUser();
  Future<List<User>> getUsers();
}
