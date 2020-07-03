import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'holiday.freezed.dart';
part 'holiday.g.dart';

@freezed
abstract class Holiday with _$Holiday {
  const factory Holiday({
    String id,
    @JsonKey(name: 'day_of_week') int dayOfWeek,
    @JsonKey(name: 'n_week') int nWeek,
  }) = _Holiday;

  factory Holiday.fromJson(Map<String, dynamic> json) =>
      _$HolidayFromJson(json);
}
