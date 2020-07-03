import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shiftend/models/models.dart';

class HolidayConverter<T>
    implements JsonConverter<Holiday, Map<String, dynamic>> {
  const HolidayConverter();

  @override
  Holiday fromJson(Map<String, dynamic> json) {
    if (json != null) {
      return Holiday.fromJson(json);
    } else {
      return null;
    }
  }

  @override
  Map<String, dynamic> toJson(Holiday holiday) => holiday?.toJson();
}
