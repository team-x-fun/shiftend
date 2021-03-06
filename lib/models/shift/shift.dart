import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shiftend/models/converter/converter.dart';
import 'package:shiftend/models/models.dart';
part 'shift.freezed.dart';
part 'shift.g.dart';

@freezed
abstract class Shift with _$Shift {
  const factory Shift({
    @MemberConverter() Member member,
    DateTime start,
    DateTime end,
  }) = _Shift;

  factory Shift.fromJson(Map<String, dynamic> json) => _$ShiftFromJson(json);
}
