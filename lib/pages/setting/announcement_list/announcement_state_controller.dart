import 'package:flutter/cupertino.dart';
import 'package:shiftend/models/notifier_state.dart';
import 'package:shiftend/pages/setting/announcement_list/announcement_list_state.dart';
import 'package:shiftend/repositories/announcement_repository.dart';
import 'package:state_notifier/state_notifier.dart';

class AnnouncementListStateController
    extends StateNotifier<AnnouncementListState> with LocatorMixin {
  AnnouncementListStateController() : super(const AnnouncementListState());

  AnnouncementRepository get announcementRepository =>
      read<AnnouncementRepository>();

  @override
  void initState() {
    getAnnouncements();
    super.initState();
  }

  void getAnnouncements() {
    state = state.copyWith(notifierState: NotifierState.loading);
    announcementRepository.getAnnouncements().then((value) {
      state = state.copyWith(
          notifierState: NotifierState.loaded, announcements: value);
    }).catchError((dynamic error) {
      debugPrint(error.toString());
      state = state.copyWith(notifierState: NotifierState.loaded);
    });
  }
}
