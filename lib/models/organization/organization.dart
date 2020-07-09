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
    @JsonKey(name: 'owner_ids') List<String> ownerIds,
    @JsonKey(name: 'member_ids') List<String> memberIds,
    @JsonKey(name: 'default_holidays')
    @HolidayConverter()
        List<Holiday> defaultHolidays,
  }) = _Organization;

  factory Organization.fromJson(Map<String, dynamic> json) =>
      _$OrganizationFromJson(json);
}
