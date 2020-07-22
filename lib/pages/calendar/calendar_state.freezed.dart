// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'calendar_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$CalendarStateTearOff {
  const _$CalendarStateTearOff();

  _CalendarState call(
      {NotifierState notifierState = NotifierState.initial,
      Map<DateTime, List<Shift>> shifts,
      DateTime selectedDate,
      List<Shift> selectedShifts}) {
    return _CalendarState(
      notifierState: notifierState,
      shifts: shifts,
      selectedDate: selectedDate,
      selectedShifts: selectedShifts,
    );
  }
}

// ignore: unused_element
const $CalendarState = _$CalendarStateTearOff();

mixin _$CalendarState {
  NotifierState get notifierState;
  Map<DateTime, List<Shift>> get shifts;
  DateTime get selectedDate;
  List<Shift> get selectedShifts;

  $CalendarStateCopyWith<CalendarState> get copyWith;
}

abstract class $CalendarStateCopyWith<$Res> {
  factory $CalendarStateCopyWith(
          CalendarState value, $Res Function(CalendarState) then) =
      _$CalendarStateCopyWithImpl<$Res>;
  $Res call(
      {NotifierState notifierState,
      Map<DateTime, List<Shift>> shifts,
      DateTime selectedDate,
      List<Shift> selectedShifts});
}

class _$CalendarStateCopyWithImpl<$Res>
    implements $CalendarStateCopyWith<$Res> {
  _$CalendarStateCopyWithImpl(this._value, this._then);

  final CalendarState _value;
  // ignore: unused_field
  final $Res Function(CalendarState) _then;

  @override
  $Res call({
    Object notifierState = freezed,
    Object shifts = freezed,
    Object selectedDate = freezed,
    Object selectedShifts = freezed,
  }) {
    return _then(_value.copyWith(
      notifierState: notifierState == freezed
          ? _value.notifierState
          : notifierState as NotifierState,
      shifts: shifts == freezed
          ? _value.shifts
          : shifts as Map<DateTime, List<Shift>>,
      selectedDate: selectedDate == freezed
          ? _value.selectedDate
          : selectedDate as DateTime,
      selectedShifts: selectedShifts == freezed
          ? _value.selectedShifts
          : selectedShifts as List<Shift>,
    ));
  }
}

abstract class _$CalendarStateCopyWith<$Res>
    implements $CalendarStateCopyWith<$Res> {
  factory _$CalendarStateCopyWith(
          _CalendarState value, $Res Function(_CalendarState) then) =
      __$CalendarStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {NotifierState notifierState,
      Map<DateTime, List<Shift>> shifts,
      DateTime selectedDate,
      List<Shift> selectedShifts});
}

class __$CalendarStateCopyWithImpl<$Res>
    extends _$CalendarStateCopyWithImpl<$Res>
    implements _$CalendarStateCopyWith<$Res> {
  __$CalendarStateCopyWithImpl(
      _CalendarState _value, $Res Function(_CalendarState) _then)
      : super(_value, (v) => _then(v as _CalendarState));

  @override
  _CalendarState get _value => super._value as _CalendarState;

  @override
  $Res call({
    Object notifierState = freezed,
    Object shifts = freezed,
    Object selectedDate = freezed,
    Object selectedShifts = freezed,
  }) {
    return _then(_CalendarState(
      notifierState: notifierState == freezed
          ? _value.notifierState
          : notifierState as NotifierState,
      shifts: shifts == freezed
          ? _value.shifts
          : shifts as Map<DateTime, List<Shift>>,
      selectedDate: selectedDate == freezed
          ? _value.selectedDate
          : selectedDate as DateTime,
      selectedShifts: selectedShifts == freezed
          ? _value.selectedShifts
          : selectedShifts as List<Shift>,
    ));
  }
}

class _$_CalendarState implements _CalendarState {
  const _$_CalendarState(
      {this.notifierState = NotifierState.initial,
      this.shifts,
      this.selectedDate,
      this.selectedShifts})
      : assert(notifierState != null);

  @JsonKey(defaultValue: NotifierState.initial)
  @override
  final NotifierState notifierState;
  @override
  final Map<DateTime, List<Shift>> shifts;
  @override
  final DateTime selectedDate;
  @override
  final List<Shift> selectedShifts;

  @override
  String toString() {
    return 'CalendarState(notifierState: $notifierState, shifts: $shifts, selectedDate: $selectedDate, selectedShifts: $selectedShifts)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CalendarState &&
            (identical(other.notifierState, notifierState) ||
                const DeepCollectionEquality()
                    .equals(other.notifierState, notifierState)) &&
            (identical(other.shifts, shifts) ||
                const DeepCollectionEquality().equals(other.shifts, shifts)) &&
            (identical(other.selectedDate, selectedDate) ||
                const DeepCollectionEquality()
                    .equals(other.selectedDate, selectedDate)) &&
            (identical(other.selectedShifts, selectedShifts) ||
                const DeepCollectionEquality()
                    .equals(other.selectedShifts, selectedShifts)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(notifierState) ^
      const DeepCollectionEquality().hash(shifts) ^
      const DeepCollectionEquality().hash(selectedDate) ^
      const DeepCollectionEquality().hash(selectedShifts);

  @override
  _$CalendarStateCopyWith<_CalendarState> get copyWith =>
      __$CalendarStateCopyWithImpl<_CalendarState>(this, _$identity);
}

abstract class _CalendarState implements CalendarState {
  const factory _CalendarState(
      {NotifierState notifierState,
      Map<DateTime, List<Shift>> shifts,
      DateTime selectedDate,
      List<Shift> selectedShifts}) = _$_CalendarState;

  @override
  NotifierState get notifierState;
  @override
  Map<DateTime, List<Shift>> get shifts;
  @override
  DateTime get selectedDate;
  @override
  List<Shift> get selectedShifts;
  @override
  _$CalendarStateCopyWith<_CalendarState> get copyWith;
}
