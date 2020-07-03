import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'holiday.freezed.dart';
part 'holiday.g.dart';

@freezed
abstract class Holiday with _$Holiday {
  const factory Holiday({
    String id,
    DateTime day,
    int interval,
    bool all,
  }) = _Holiday;

  factory Holiday.fromJson(Map<String, dynamic> json) =>
      _$HolidayFromJson(json);
}
