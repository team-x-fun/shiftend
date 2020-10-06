import 'package:shiftend/debug_views/globals.dart';
import 'package:shiftend/models/models.dart';
import 'package:shiftend/pages/login/login_state.dart';
import 'package:shiftend/repositories/interfaces/organization_repository_interface.dart';
import 'package:shiftend/util/logger.dart';
import 'package:state_notifier/state_notifier.dart';
import 'member_state.dart';

class MemberStateController extends StateNotifier<MemberState>
    with LocatorMixin {
  MemberStateController() : super(const MemberState());

  OrganizationRepositoryInterface get orgRepo =>
      read<OrganizationRepositoryInterface>();

  LoginState get loginState => read<LoginState>();

  @override
  void initState() {
    state = state.copyWith(members: loginState.selectedOrg.members);
  }

  void changeLevel(String id, double userLevel) {
    if (validateLevel(userLevel)) {
      final member = state.members
          .singleWhere((member) => member.user.id == id)
          .copyWith(level: userLevel);
      final newMembers = state.members
        ..removeWhere((member) => member.user.id == id)
        ..add(member)
        ..sort((a, b) => (b.level - a.level).toInt());
      logger.info('newMembers = ${newMembers[0]}');
      state = state.copyWith(members: newMembers);
      logger.info('state = ${state.members[0]}');
    }
  }

  bool validateLevel(double userLevel) {
    if (userLevel < 0 || userLevel > 5) {
      return false;
    }
    return true;
  }
}
