import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'shiftend_user.freezed.dart';
part 'shiftend_user.g.dart';

@freezed
abstract class ShiftendUser with _$ShiftendUser {
  const factory ShiftendUser({
    String id,
    String email,
    String name,
    String role,
    String level,
    @JsonKey(name: 'icon_url') String iconUrl,
  }) = _ShiftendUser;

  factory ShiftendUser.fromJson(Map<String, dynamic> json) =>
      _$ShiftendUserFromJson(json);
}
