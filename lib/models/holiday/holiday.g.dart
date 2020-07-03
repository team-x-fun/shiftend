// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'holiday.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Holiday _$_$_HolidayFromJson(Map<String, dynamic> json) {
  return _$_Holiday(
    id: json['id'] as String,
    dayOfWeek: json['day_of_week'] as int,
    nWeek: json['n_week'] as int,
  );
}

Map<String, dynamic> _$_$_HolidayToJson(_$_Holiday instance) =>
    <String, dynamic>{
      'id': instance.id,
      'day_of_week': instance.dayOfWeek,
      'n_week': instance.nWeek,
    };
