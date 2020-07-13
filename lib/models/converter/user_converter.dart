import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shiftend/models/models.dart';

class UserConverter<T> implements JsonConverter<User, Map<String, dynamic>> {
  const UserConverter();

  @override
  User fromJson(Map<String, dynamic> json) {
    if (json != null) {
      return User.fromJson(json);
    } else {
      return null;
    }
  }

  @override
  Map<String, dynamic> toJson(User user) => user?.toJson();
}
