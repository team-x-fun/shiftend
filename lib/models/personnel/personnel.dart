import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'personnel.freezed.dart';
part 'personnel.g.dart';

@freezed
abstract class Personnel with _$Personnel {
  const factory Personnel({
    int number,
    @JsonKey(name: 'total_level') int totalLevel,
  }) = _Personnel;

  factory Personnel.fromJson(Map<String, dynamic> json) =>
      _$PersonnelFromJson(json);
}
