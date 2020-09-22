import 'package:state_notifier/state_notifier.dart';
import 'member_state.dart';

class MemberStateController extends StateNotifier<MemberState>
    with LocatorMixin {
  MemberStateController() : super(const MemberState());

  void changeLevel(double userLevel) {
    if (validateLevel(userLevel)) {
      state = state.copyWith(level: userLevel);
    }
  }

  bool validateLevel(double userLevel) {
    if (userLevel < 0 || userLevel > 5) {
      return false;
    }
    return true;
  }
}
