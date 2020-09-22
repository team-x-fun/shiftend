import 'package:flutter/cupertino.dart';
import 'package:shiftend/models/notifier_state.dart';
import 'package:shiftend/pages/login/login_state.dart';
import 'package:shiftend/pages/setting/setting_org/setting_org_state.dart';
import 'package:shiftend/repositories/organization_repository.dart';
import 'package:state_notifier/state_notifier.dart';

class SettingOrgStateController extends StateNotifier<SettingOrgState>
    with LocatorMixin {
  SettingOrgStateController() : super(const SettingOrgState());

  OrganizationRepository get organizationRepository =>
      read<OrganizationRepository>();

  LoginState get loginState => read<LoginState>();

  @override
  void initState() {
    fetchOrganizationMembers();
    fetchHolidays();
    super.initState();
  }

  Future<void> fetchOrganizationMembers() async {
    state = state.copyWith(notifierState: NotifierState.loading);
    if (loginState.selectedOrg == null) {
      return;
    }
    return organizationRepository
        .getOrganization(loginState.selectedOrg.id)
        .then((value) {
      state = state.copyWith(
          notifierState: NotifierState.loaded, members: value.members);
    }).catchError((dynamic error) {
      debugPrint(error.toString());
    });
  }

  void fetchHolidays() {
    organizationRepository.getHolidays(loginState.selectedOrg.id);
  }
}
