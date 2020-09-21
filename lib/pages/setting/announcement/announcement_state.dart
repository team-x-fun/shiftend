import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shiftend/models/announcement/announcement.dart';
import 'package:shiftend/models/notifier_state.dart';

part 'announcement_state.freezed.dart';

@freezed
abstract class AnnouncementState with _$AnnouncementState {
  const factory AnnouncementState(
          {@Default(NotifierState.initial) NotifierState notifierState,
          @Default(<Announcement>[]) List<Announcement> announcements}) =
      _AnnouncementState;
}
