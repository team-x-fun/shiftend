import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shiftend/models/models.dart';
import 'package:shiftend/models/notifier_state.dart';
import 'package:shiftend/pages/calendar/calendar_bottom_tab.dart';

part 'calendar_state.freezed.dart';

@freezed
abstract class CalendarState with _$CalendarState {
  const factory CalendarState({
    @Default(NotifierState.initial) NotifierState notifierState,
    Map<DateTime, List<Shift>> shifts,
    DateTime selectedDate,
    @Default(<Shift>[]) List<Shift> selectedShifts,
    @Default(<CalendarBottomTab>[]) List<CalendarBottomTab> calendarBottomTabs,
  }) = _CalendarState;
}
