import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shiftend/models/models.dart';
import 'package:shiftend/models/notifier_state.dart';

part 'setting_org_state.freezed.dart';

@freezed
abstract class SettingOrgState with _$SettingOrgState {
  const factory SettingOrgState({
    @Default(NotifierState.initial)
        NotifierState notifierState,
    @Default(<Holiday>[])
        List<Holiday> holidays,
    @Default(<User>[])
        List<User> members,
    @Default(<bool>[false, false, false, false, false, false, false])
        List<bool> selectedDayOfWeeks,
    @Default(-1)
        int intervalRegularHoliday,
    @Default(Personnel(
      number: 0,
      totalLevel: 0,
    ))
        Personnel defaultPersonnel,
  }) = _SettingOrgState;
}
