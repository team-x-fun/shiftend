import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shiftend/models/models.dart';

part 'member_state.freezed.dart';

@freezed
abstract class MemberState with _$MemberState {
  const factory MemberState({
    List<Member> members,
  }) = _MemberState;
}
