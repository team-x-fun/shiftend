import 'dart:io';

import 'package:shiftend/models/models.dart';
import 'package:shiftend/repositories/organization_repository.dart';
import 'package:shiftend/repositories/user_repository.dart';
import 'package:shiftend/util/logger.dart';
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
    if (state.selectedOrg == null && state.currentUser != null) {
      state = state.copyWith(selectedOrg: state.orgs.first);
    }
  }

  Future<void> fetchLoginState() async {
    state = state.copyWith(
      isLogin: await userRepository.isLogin(),
    );
    state = state.copyWith(
      currentUser: await userRepository.getCurrentUser(),
    );
    if (state.currentUser.id != null) {
      logger.info('set orgs: currentUser.id = ${state.currentUser.id}');
      state = state.copyWith(
        orgs: await orgRepository.getOrganizations(state.currentUser.id),
      );
      logger.info('fetchLoginState: selectedOrg = ${state.selectedOrg}');
      if (state.selectedOrg.id == null) {
        logger.info('fetchLoginState: set selectedOrg');
        state = state.copyWith(selectedOrg: state.orgs.first);
        logger.info('fetchLoginState: selectedOrg = ${state.selectedOrg}');
      }
    } else {
      state = state.copyWith(
        orgs: <Organization>[],
        selectedOrg: const Organization(),
      );
    }
    logger.info('fetchLoginState: state = $state');
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
    logger.info('selectOrg: ${state.selectedOrg}');
  }

  Future<void> uploadImage(File file) async {
    await userRepository.uploadIcon(state.currentUser.id, file);
    await fetchLoginState();
  }
}
