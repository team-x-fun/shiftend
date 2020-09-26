import 'package:shiftend/models/notifier_state.dart';
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
      logger.shout(error.toString());
    });
  }

  void fetchHolidays() {
    organizationRepository.getHolidays(loginState.selectedOrg.id).then((value) {
      state =
          state.copyWith(notifierState: NotifierState.loaded, holidays: value);
    });
  }
}
