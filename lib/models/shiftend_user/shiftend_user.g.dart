// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shiftend_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ShiftendUser _$_$_ShiftendUserFromJson(Map<String, dynamic> json) {
  return _$_ShiftendUser(
    id: json['id'] as String,
    email: json['email'] as String,
    name: json['name'] as String,
    role: json['role'] as String,
    level: json['level'] as String,
    iconUrl: json['icon_url'] as String,
  );
}

Map<String, dynamic> _$_$_ShiftendUserToJson(_$_ShiftendUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'role': instance.role,
      'level': instance.level,
      'icon_url': instance.iconUrl,
    };
