// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shift.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Shift _$_$_ShiftFromJson(Map json) {
  return _$_Shift(
    member: const MemberConverter()
        .fromJson(json['member'] as Map<String, dynamic>),
    start:
        json['start'] == null ? null : DateTime.parse(json['start'] as String),
    end: json['end'] == null ? null : DateTime.parse(json['end'] as String),
  );
}

Map<String, dynamic> _$_$_ShiftToJson(_$_Shift instance) => <String, dynamic>{
      'member': const MemberConverter().toJson(instance.member),
      'start': instance.start?.toIso8601String(),
      'end': instance.end?.toIso8601String(),
    };
