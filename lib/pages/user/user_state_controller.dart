import 'package:shiftend/models/models.dart';
import 'package:shiftend/models/notifier_state.dart';
import 'package:shiftend/pages/user/user_state.dart';
import 'package:shiftend/repositories/interfaces/interfaces.dart';
import 'package:shiftend/util/logger.dart';
import 'package:state_notifier/state_notifier.dart';

class UserStateController extends StateNotifier<UserState> with LocatorMixin {
  UserStateController() : super(const UserState());

  UserRepositoryInterface get userRepository => read<UserRepositoryInterface>();
  OrganizationRepositoryInterface get orgRepository =>
      read<OrganizationRepositoryInterface>();

  Future<void> createOrganization(String id, User user) async {
    state = state.copyWith(notifierState: NotifierState.loading);
    if (user.id != null) {
      final org = Organization(
        id: id,
        owners: <User>[user],
        members: <Member>[
          Member(
            level: 1,
            role: 'owner',
            user: user,
          ),
        ],
        defaultHolidays: <Holiday>[],
      );
      await orgRepository.create(org).then((value) {
        logger.info('組織作成成功');
        state = state.copyWith(notifierState: NotifierState.loaded);
      }).catchError((dynamic error) {
        logger.shout('組織作成失敗 $error');
        state = state.copyWith(notifierState: NotifierState.loaded);
      });
    } else {
      logger.warning('ユーザの取得に失敗して組織作成できませんでした');
      state = state.copyWith(notifierState: NotifierState.loaded);
    }
  }
}
