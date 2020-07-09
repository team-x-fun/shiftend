// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shift.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Shift _$_$_ShiftFromJson(Map<String, dynamic> json) {
  return _$_Shift(
    userId: json['user_id'] as String,
    start:
        json['start'] == null ? null : DateTime.parse(json['start'] as String),
    end: json['end'] == null ? null : DateTime.parse(json['end'] as String),
  );
}

Map<String, dynamic> _$_$_ShiftToJson(_$_Shift instance) => <String, dynamic>{
      'user_id': instance.userId,
      'start': instance.start?.toIso8601String(),
      'end': instance.end?.toIso8601String(),
    };
