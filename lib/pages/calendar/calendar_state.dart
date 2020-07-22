import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shiftend/models/models.dart';
import 'package:shiftend/models/notifier_state.dart';

part 'calendar_state.freezed.dart';

@freezed
abstract class CalendarState with _$CalendarState {
  const factory CalendarState({
    @Default(NotifierState.initial) NotifierState notifierState,
    Map<DateTime, List<Shift>> shifts,
    DateTime selectedDate,
    List<Shift> selectedShifts,
  }) = _CalendarState;
}
