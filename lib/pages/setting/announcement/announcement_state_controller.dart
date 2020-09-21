import 'package:shiftend/models/notifier_state.dart';
import 'package:shiftend/pages/setting/announcement/announcement_state.dart';
import 'package:shiftend/repositories/announcement_repository.dart';
import 'package:state_notifier/state_notifier.dart';

class AnnouncementStateController extends StateNotifier<AnnouncementState>
    with LocatorMixin {
  AnnouncementStateController() : super(const AnnouncementState());

  AnnouncementRepository get announcementRepository =>
      read<AnnouncementRepository>();

  @override
  void initState() {
    super.initState();
  }

  void getAnnouncements() {
    state = state.copyWith(notifierState: NotifierState.loading);
    state = state.copyWith();
  }
}
