import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shiftend/models/models.dart';

class UserConverter<T>
    implements JsonConverter<ShiftendUser, Map<String, dynamic>> {
  const UserConverter();

  @override
  ShiftendUser fromJson(Map<String, dynamic> json) {
    if (json != null) {
      return ShiftendUser.fromJson(json);
    } else {
      return null;
    }
  }

  @override
  Map<String, dynamic> toJson(ShiftendUser user) => user?.toJson();
}
