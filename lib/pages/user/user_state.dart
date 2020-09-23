import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shiftend/models/notifier_state.dart';

part 'user_state.freezed.dart';

@freezed
abstract class UserState with _$UserState {
  const factory UserState({
    @Default(NotifierState.initial) NotifierState notifierState,
  }) = _UserState;
}
