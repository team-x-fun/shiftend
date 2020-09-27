import 'package:shiftend/models/models.dart';
import 'package:shiftend/models/notifier_state.dart';
import 'package:shiftend/models/personnel/personnel.dart';
import 'package:shiftend/pages/login/login_state.dart';
import 'package:shiftend/pages/setting/setting_org/setting_org_state.dart';
import 'package:shiftend/repositories/interfaces/interfaces.dart';
import 'package:shiftend/util/logger.dart';
import 'package:state_notifier/state_notifier.dart';

class SettingOrgStateController extends StateNotifier<SettingOrgState>
    with LocatorMixin {
  SettingOrgStateController() : super(const SettingOrgState());

  OrganizationRepositoryInterface get organizationRepository =>
      read<OrganizationRepositoryInterface>();

  LoginState get loginState => read<LoginState>();

  @override
  void initState() {
    state = state.copyWith(notifierState: NotifierState.loading);
    if (loginState.selectedOrg.id == null) {
      state = state.copyWith(notifierState: NotifierState.loaded);
    } else {
      fetchAll();
    }
    super.initState();
  }

  Future<void> fetchAll() async {
    await fetchOrganizationMembers();
    fetchHolidays();
    fetchDefaultPersonnel();
  }

  Future<void> fetchOrganizationMembers() async {
    return organizationRepository
        .getOrganization(loginState.selectedOrg.id)
        .then((value) {
      state = state.copyWith(
        notifierState: NotifierState.loaded,
        members: value.members,
      );
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
      logger.shout('fetchHolidaysのエラー $error');
    });
  }

  void changeSelectedDayOfWeek({bool value, int dayOfWeekPosition}) {
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
        if (!_isDuplicate(i)) {
          regularHolidays
              .add(Holiday(dayOfWeek: i, nWeek: state.intervalRegularHoliday));
        }
      }
    }
    organization = organization.copyWith(defaultHolidays: regularHolidays);

    return organizationRepository.update(organization).then((value) {
      logger.info('追加に成功しました');
    }).catchError((dynamic error) {
      logger.shout('追加に失敗しました $error');
    });
  }

  Future<void> removeRegularHoliday(Holiday holiday) async {
    Organization organization =
        await organizationRepository.getOrganization(loginState.selectedOrg.id);

    final removeIndex = organization.defaultHolidays.indexOf(holiday);
    final regularHolidays = organization.defaultHolidays..removeAt(removeIndex);

    organization = organization.copyWith(defaultHolidays: regularHolidays);
    return organizationRepository.update(organization).then((value) {
      logger.info('削除に成功しました');
    }).catchError((dynamic error) {
      logger.shout('削除に失敗しました $error');
    });
  }

  bool _isDuplicate(int dayOfWeek) {
    for (final Holiday holiday in state.holidays) {
      if (holiday.dayOfWeek == dayOfWeek &&
          holiday.nWeek == state.intervalRegularHoliday) {
        logger.warning('重複してました $dayOfWeek ${state.intervalRegularHoliday}');
        return true;
      }
    }
    return false;
  }

  void fetchDefaultPersonnel() {
    state = state.copyWith(
      notifierState: NotifierState.loaded,
      defaultPersonnel: loginState.selectedOrg.defaultPersonnel,
    );
  }

  Future<void> changeDefaultPersonnel(Personnel personnel) async {
    await organizationRepository
        .update(loginState.selectedOrg.copyWith(defaultPersonnel: personnel));
    await fetchAll();
  }
}
