import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shiftend/models/models.dart';

part 'calendar_state.freezed.dart';

@freezed
abstract class CalendarState with _$CalendarState {
  const factory CalendarState({
    Map<DateTime, List<User>> attendees,
    DateTime selectedDate,
    List<User> selectedAttendees,
  }) = _CalendarState;
}
