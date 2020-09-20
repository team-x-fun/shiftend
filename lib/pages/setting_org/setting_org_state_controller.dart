import 'package:flutter/cupertino.dart';
import 'package:shiftend/models/notifier_state.dart';
import 'package:shiftend/pages/setting_org/setting_org_state.dart';
import 'package:shiftend/repositories/organization_repository.dart';
import 'package:state_notifier/state_notifier.dart';

class SettingOrgStateController extends StateNotifier<SettingOrgState>
    with LocatorMixin {
  SettingOrgStateController() : super(const SettingOrgState());

  OrganizationRepository get organizationRepository =>
      read<OrganizationRepository>();

  @override
  void initState() {
    fetchOrganizationMembers();
    super.initState();
  }

  Future<void> fetchOrganizationMembers() {
    state = state.copyWith(notifierState: NotifierState.loading);
    return organizationRepository.getOrganization('refOrg').then((value) {
      state = state.copyWith(
          notifierState: NotifierState.loaded, members: value.members);
    }).catchError((dynamic error) {
      debugPrint(error.toString());
    });
  }
}
