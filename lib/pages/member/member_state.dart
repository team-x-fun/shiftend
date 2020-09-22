import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'member_state.freezed.dart';

@freezed
abstract class MemberState with _$MemberState {
  const factory MemberState({
    @Default(3) double level,
    @Default('000-0000-0000') String tel,
  }) = _MemberState;
}
