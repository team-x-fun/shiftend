import 'package:shiftend/models/models.dart';
import 'package:shiftend/pages/login/login_state_controller.dart';
import 'package:shiftend/repositories/interfaces/interfaces.dart';
import 'package:shiftend/repositories/mocks/organization_repository_mock.dart';
import 'package:shiftend/repositories/mocks/user_repository_mock.dart';
import 'package:test/test.dart';

void main() {
  UserRepositoryInterface userRepoMock;
  OrganizationRepositoryInterface orgRepoMock;
  LoginStateController controller;
  const email = 'owner@example.com';
  const password = 'password';
  setUp(() {
    userRepoMock = UserRepositoryMock();
    orgRepoMock = OrganizationRepositoryMock();
    controller = LoginStateController()
      ..debugMockDependency<UserRepositoryInterface>(userRepoMock)
      ..debugMockDependency<OrganizationRepositoryInterface>(orgRepoMock);
  });
  test('ログインすることができる．', () async {
    await controller.signIn(email, password);
    final currentUser = controller.debugState.currentUser;
    expect(currentUser?.email, email);
  });
  test('ログインしたあと，組織がデフォルトで選択されている．', () async {
    await controller.signIn(email, password);
    expect(controller.debugState.selectedOrg == null, false);
  });

  test('ログアウトしたあと，組織と組織の選択が初期化されている．', () async {
    await controller.signIn(email, password);
    final currentUser = controller.debugState.currentUser;
    expect(currentUser?.email, email);
    await controller.signOut();
    expect(controller.debugState.orgs, <Organization>[]);
    expect(controller.debugState.selectedOrg?.id == null, true);
  });
}
