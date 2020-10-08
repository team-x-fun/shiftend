import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shiftend/models/announcement/announcement.dart';
import 'package:shiftend/models/notifier_state.dart';

part 'announcement_list_state.freezed.dart';

@freezed
abstract class AnnouncementListState with _$AnnouncementListState {
  const factory AnnouncementListState({
    @Default(NotifierState.initial) NotifierState notifierState,
    @Default(<Announcement>[]) List<Announcement> announcements,
  }) = _AnnouncementListState;
}
