// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organization.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Organization _$_$_OrganizationFromJson(Map<String, dynamic> json) {
  return _$_Organization(
    id: json['id'] as String,
    ownerIds: (json['owner_ids'] as List)?.map((e) => e as String)?.toList(),
    memberIds: (json['member_ids'] as List)?.map((e) => e as String)?.toList(),
    defaultHolidays: (json['default_holidays'] as List)
        ?.map(
            (e) => const HolidayConverter().fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$_$_OrganizationToJson(_$_Organization instance) =>
    <String, dynamic>{
      'id': instance.id,
      'owner_ids': instance.ownerIds,
      'member_ids': instance.memberIds,
      'default_holidays': instance.defaultHolidays
          ?.map(const HolidayConverter().toJson)
          ?.toList(),
    };
