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
    defaltHolidays: (json['default_holidays'] as List)
        ?.map(
            (e) => const HolidayConverter().fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$_$_OrganizationToJson(_$_Organization instance) =>
    <String, dynamic>{
      'id': instance.id,
      'owners': instance.owners?.map(const UserConverter().toJson)?.toList(),
      'members': instance.members?.map(const UserConverter().toJson)?.toList(),
      'default_holidays': instance.defaltHolidays
          ?.map(const HolidayConverter().toJson)
          ?.toList(),
    };
