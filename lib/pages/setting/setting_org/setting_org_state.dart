import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shiftend/models/models.dart';
import 'package:shiftend/models/notifier_state.dart';

part 'setting_org_state.freezed.dart';

@freezed
abstract class SettingOrgState with _$SettingOrgState {
  const factory SettingOrgState(
      {@Default(NotifierState.initial) NotifierState notifierState,
      @Default(<Holiday>[]) List<Holiday> holidays,
      @Default(<User>[]) List<User> members}) = _SettingOrgState;
}
