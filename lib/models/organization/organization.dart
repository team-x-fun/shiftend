import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shiftend/models/converter/holiday_converter.dart';

import 'package:shiftend/models/models.dart';
import 'package:shiftend/models/converter/converter.dart';

part 'organization.freezed.dart';
part 'organization.g.dart';

@freezed
abstract class Organization with _$Organization {
  const factory Organization({
    String id,
    @UserConverter() List<User> owners,
    @UserConverter() List<User> members,
    @JsonKey(name: 'default_holidays')
    @HolidayConverter()
        List<Holiday> defaltHolidays,
  }) = _Organization;

  factory Organization.fromJson(Map<String, dynamic> json) =>
      _$OrganizationFromJson(json);
}
