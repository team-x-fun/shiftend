import 'package:shiftend/models/models.dart';
import 'package:shiftend/repositories/organization_repository.dart';
import 'package:shiftend/repositories/user_repository.dart';
import 'package:state_notifier/state_notifier.dart';

import 'login_state.dart';

class LoginStateController extends StateNotifier<LoginState> with LocatorMixin {
  LoginStateController() : super(const LoginState());

  UserRepository get userRepository => read<UserRepository>();
  OrganizationRepository get orgRepository => read<OrganizationRepository>();

  @override
  void initState() {
    super.initState();
    fetchLoginState();
  }

  Future<void> fetchLoginState() async {
    state = state.copyWith(
      isLogin: await userRepository.isLogin(),
    );
    state = state.copyWith(
      currentUser: await userRepository.getCurrentUser(),
    );
    state = state.copyWith(
      orgs: await orgRepository.getOrganizations(state.currentUser.id),
    );
  }

  Future<void> register(String email, String password) async {
    await userRepository.register(email, password);
    await fetchLoginState();
  }

  Future<void> signIn(String email, String password) async {
    await userRepository.signIn(email, password);
    await fetchLoginState();
  }

  Future<void> signOut() async {
    await userRepository.signOut();
    await fetchLoginState();
  }

  Future<void> selectOrg(Organization newOrg) async {
    state = state.copyWith(selectedOrg: newOrg);
    await fetchLoginState();
  }
}
