import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shiftend/models/models.dart';

class PersonnelConverter<T>
    implements JsonConverter<Personnel, Map<String, dynamic>> {
  const PersonnelConverter();

  @override
  Personnel fromJson(Map<String, dynamic> json) {
    if (json != null) {
      return Personnel.fromJson(json);
    } else {
      return null;
    }
  }

  @override
  Map<String, dynamic> toJson(Personnel personnel) => personnel?.toJson();
}
