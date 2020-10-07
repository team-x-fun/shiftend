// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$_$_UserFromJson(Map json) {
  return _$_User(
    id: json['id'] as String,
    email: json['email'] as String,
    name: json['name'] as String,
    iconUrl: json['icon_url'] as String,
  );
}

Map<String, dynamic> _$_$_UserToJson(_$_User instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'icon_url': instance.iconUrl,
    };
