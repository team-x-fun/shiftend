// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Member _$_$_MemberFromJson(Map<String, dynamic> json) {
  return _$_Member(
    level: (json['level'] as num)?.toDouble(),
    role: json['role'] as String,
    user: const UserConverter().fromJson(json['user'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_MemberToJson(_$_Member instance) => <String, dynamic>{
      'level': instance.level,
      'role': instance.role,
      'user': const UserConverter().toJson(instance.user),
    };
