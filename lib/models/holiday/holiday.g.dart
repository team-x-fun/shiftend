// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'holiday.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Holiday _$_$_HolidayFromJson(Map<String, dynamic> json) {
  return _$_Holiday(
    id: json['id'] as String,
    day: json['day'] == null ? null : DateTime.parse(json['day'] as String),
    interval: json['interval'] as int,
    all: json['all'] as bool,
  );
}

Map<String, dynamic> _$_$_HolidayToJson(_$_Holiday instance) =>
    <String, dynamic>{
      'id': instance.id,
      'day': instance.day?.toIso8601String(),
      'interval': instance.interval,
      'all': instance.all,
    };
