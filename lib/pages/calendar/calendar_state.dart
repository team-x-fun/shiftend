import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shiftend/models/models.dart';
import 'package:shiftend/models/notifier_state.dart';

part 'calendar_state.freezed.dart';

@freezed
abstract class CalendarState with _$CalendarState {
  const factory CalendarState({
    @Default(NotifierState.initial) NotifierState notifierState,
    Map<DateTime, List<Shift>> shifts,
    Map<DateTime, List<Shift>> requestedShifts,
    DateTime selectedDate,
    @Default(<Shift>[]) List<Shift> selectedShifts,
    @Default(<Shift>[]) List<Shift> loggedinUserRequestedShifts,
    @Default(<Shift>[]) List<Shift> selectedRequestedShifts,
  }) = _CalendarState;
}
