import 'package:flutter/cupertino.dart';
import 'package:shiftend/models/models.dart';
import 'package:shiftend/models/notifier_state.dart';
import 'package:shiftend/pages/login/login_state.dart';
import 'package:shiftend/pages/setting/setting_org/setting_org_state.dart';
import 'package:shiftend/repositories/organization_repository.dart';
import 'package:shiftend/util/logger.dart';
import 'package:state_notifier/state_notifier.dart';

class SettingOrgStateController extends StateNotifier<SettingOrgState>
    with LocatorMixin {
  SettingOrgStateController() : super(const SettingOrgState());

  OrganizationRepository get organizationRepository =>
      read<OrganizationRepository>();

  LoginState get loginState => read<LoginState>();

  @override
  void initState() {
    state = state.copyWith(notifierState: NotifierState.loading);
    if (loginState.selectedOrg.id == null) {
      state = state.copyWith(notifierState: NotifierState.loaded);
    } else {
      fetchOrganizationMembers();
      fetchHolidays();
    }
    super.initState();
  }

  Future<void> fetchOrganizationMembers() async {
    return organizationRepository
        .getOrganization(loginState.selectedOrg.id)
        .then((value) {
      state = state.copyWith(
          notifierState: NotifierState.loaded, members: value.members);
    }).catchError((dynamic error) {
      state = state.copyWith(notifierState: NotifierState.loaded);
      logger.shout(error.toString());
    });
  }

  void fetchHolidays() {
    organizationRepository.getHolidays(loginState.selectedOrg.id).then((value) {
      state =
          state.copyWith(notifierState: NotifierState.loaded, holidays: value);
    }).catchError((dynamic error) {
      state = state.copyWith(notifierState: NotifierState.loaded);
      debugPrint('fetchHolidaysのエラー $error');
    });
  }

  // ignore: avoid_positional_boolean_parameters
  void changeSelectedDayOfWeek(bool value, int dayOfWeekPosition) {
    final newValue = state.selectedDayOfWeeks.toList();
    newValue[dayOfWeekPosition] = value;
    state = state.copyWith(selectedDayOfWeeks: newValue);
  }

  void changeIntervalRegularHoliday(Object value) {
    state = state.copyWith(intervalRegularHoliday: int.parse(value.toString()));
  }

  Future<void> addRegularHoliday() async {
    Organization organization =
        await organizationRepository.getOrganization(loginState.selectedOrg.id);
    final regularHolidays = organization.defaultHolidays;

    for (int i = 0; i < state.selectedDayOfWeeks.length; i++) {
      if (state.selectedDayOfWeeks[i]) {
        if (!checkIsDuplicate(i)) {
          regularHolidays
              .add(Holiday(dayOfWeek: i, nWeek: state.intervalRegularHoliday));
        }
      }
    }
    organization = organization.copyWith(defaultHolidays: regularHolidays);

    return organizationRepository.update(organization).then((value) {
      debugPrint('追加に成功しました');
    }).catchError((dynamic error) {
      debugPrint('追加に失敗しました $error');
    });
  }

  Future<void> removeRegularHoliday(int index) async {
    Organization organization =
        await organizationRepository.getOrganization(loginState.selectedOrg.id);
    final regularHolidays = organization.defaultHolidays..removeAt(index);

    organization = organization.copyWith(defaultHolidays: regularHolidays);
    return organizationRepository.update(organization).then((value) {
      debugPrint('削除に成功しました');
    }).catchError((dynamic error) {
      debugPrint('削除に失敗しました $error');
    });
  }

  bool checkIsDuplicate(int dayOfWeek) {
    bool isDuplicate = false;
    state.holidays.forEach((holiday) {
      if (holiday.dayOfWeek == dayOfWeek &&
          holiday.nWeek == state.intervalRegularHoliday) {
        debugPrint('重複してました $dayOfWeek ${state.intervalRegularHoliday}');
        isDuplicate = true;
      }
    });
    return isDuplicate;
  }
}
