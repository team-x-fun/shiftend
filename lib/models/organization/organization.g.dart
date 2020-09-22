// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organization.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Organization _$_$_OrganizationFromJson(Map<String, dynamic> json) {
  return _$_Organization(
    id: json['id'] as String,
    owners: (json['owners'] as List)
        ?.map((e) => const UserConverter().fromJson(e as Map<String, dynamic>))
        ?.toList(),
    members: (json['members'] as List)
        ?.map((e) => const UserConverter().fromJson(e as Map<String, dynamic>))
        ?.toList(),
    defaultHolidays: (json['default_holidays'] as List)
        ?.map(
            (e) => const HolidayConverter().fromJson(e as Map<String, dynamic>))
        ?.toList(),
    defaultPersonnel: json['default_personnel'] == null
        ? null
        : Personnel.fromJson(json['default_personnel'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_OrganizationToJson(_$_Organization instance) =>
    <String, dynamic>{
      'id': instance.id,
      'owners': instance.owners?.map(const UserConverter().toJson)?.toList(),
      'members': instance.members?.map(const UserConverter().toJson)?.toList(),
      'default_holidays': instance.defaultHolidays
          ?.map(const HolidayConverter().toJson)
          ?.toList(),
      'default_personnel': instance.defaultPersonnel,
    };
