// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'calendar_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$CalendarStateTearOff {
  const _$CalendarStateTearOff();

// ignore: unused_element
  _CalendarState call(
      {NotifierState notifierState = NotifierState.initial,
      Map<DateTime, List<Shift>> shifts,
      Map<DateTime, List<Shift>> requestedShifts,
      DateTime selectedDate,
      List<Shift> selectedShifts = const <Shift>[],
      List<Shift> loggedinUserRequestedShifts = const <Shift>[],
      List<Shift> selectedRequestedShifts = const <Shift>[]}) {
    return _CalendarState(
      notifierState: notifierState,
      shifts: shifts,
      requestedShifts: requestedShifts,
      selectedDate: selectedDate,
      selectedShifts: selectedShifts,
      loggedinUserRequestedShifts: loggedinUserRequestedShifts,
      selectedRequestedShifts: selectedRequestedShifts,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $CalendarState = _$CalendarStateTearOff();

/// @nodoc
mixin _$CalendarState {
  NotifierState get notifierState;
  Map<DateTime, List<Shift>> get shifts;
  Map<DateTime, List<Shift>> get requestedShifts;
  DateTime get selectedDate;
  List<Shift> get selectedShifts;
  List<Shift> get loggedinUserRequestedShifts;
  List<Shift> get selectedRequestedShifts;

  $CalendarStateCopyWith<CalendarState> get copyWith;
}

/// @nodoc
abstract class $CalendarStateCopyWith<$Res> {
  factory $CalendarStateCopyWith(
          CalendarState value, $Res Function(CalendarState) then) =
      _$CalendarStateCopyWithImpl<$Res>;
  $Res call(
      {NotifierState notifierState,
      Map<DateTime, List<Shift>> shifts,
      Map<DateTime, List<Shift>> requestedShifts,
      DateTime selectedDate,
      List<Shift> selectedShifts,
      List<Shift> loggedinUserRequestedShifts,
      List<Shift> selectedRequestedShifts});
}

/// @nodoc
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
    Object requestedShifts = freezed,
    Object selectedDate = freezed,
    Object selectedShifts = freezed,
    Object loggedinUserRequestedShifts = freezed,
    Object selectedRequestedShifts = freezed,
  }) {
    return _then(_value.copyWith(
      notifierState: notifierState == freezed
          ? _value.notifierState
          : notifierState as NotifierState,
      shifts: shifts == freezed
          ? _value.shifts
          : shifts as Map<DateTime, List<Shift>>,
      requestedShifts: requestedShifts == freezed
          ? _value.requestedShifts
          : requestedShifts as Map<DateTime, List<Shift>>,
      selectedDate: selectedDate == freezed
          ? _value.selectedDate
          : selectedDate as DateTime,
      selectedShifts: selectedShifts == freezed
          ? _value.selectedShifts
          : selectedShifts as List<Shift>,
      loggedinUserRequestedShifts: loggedinUserRequestedShifts == freezed
          ? _value.loggedinUserRequestedShifts
          : loggedinUserRequestedShifts as List<Shift>,
      selectedRequestedShifts: selectedRequestedShifts == freezed
          ? _value.selectedRequestedShifts
          : selectedRequestedShifts as List<Shift>,
    ));
  }
}

/// @nodoc
abstract class _$CalendarStateCopyWith<$Res>
    implements $CalendarStateCopyWith<$Res> {
  factory _$CalendarStateCopyWith(
          _CalendarState value, $Res Function(_CalendarState) then) =
      __$CalendarStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {NotifierState notifierState,
      Map<DateTime, List<Shift>> shifts,
      Map<DateTime, List<Shift>> requestedShifts,
      DateTime selectedDate,
      List<Shift> selectedShifts,
      List<Shift> loggedinUserRequestedShifts,
      List<Shift> selectedRequestedShifts});
}

/// @nodoc
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
    Object requestedShifts = freezed,
    Object selectedDate = freezed,
    Object selectedShifts = freezed,
    Object loggedinUserRequestedShifts = freezed,
    Object selectedRequestedShifts = freezed,
  }) {
    return _then(_CalendarState(
      notifierState: notifierState == freezed
          ? _value.notifierState
          : notifierState as NotifierState,
      shifts: shifts == freezed
          ? _value.shifts
          : shifts as Map<DateTime, List<Shift>>,
      requestedShifts: requestedShifts == freezed
          ? _value.requestedShifts
          : requestedShifts as Map<DateTime, List<Shift>>,
      selectedDate: selectedDate == freezed
          ? _value.selectedDate
          : selectedDate as DateTime,
      selectedShifts: selectedShifts == freezed
          ? _value.selectedShifts
          : selectedShifts as List<Shift>,
      loggedinUserRequestedShifts: loggedinUserRequestedShifts == freezed
          ? _value.loggedinUserRequestedShifts
          : loggedinUserRequestedShifts as List<Shift>,
      selectedRequestedShifts: selectedRequestedShifts == freezed
          ? _value.selectedRequestedShifts
          : selectedRequestedShifts as List<Shift>,
    ));
  }
}

/// @nodoc
class _$_CalendarState implements _CalendarState {
  const _$_CalendarState(
      {this.notifierState = NotifierState.initial,
      this.shifts,
      this.requestedShifts,
      this.selectedDate,
      this.selectedShifts = const <Shift>[],
      this.loggedinUserRequestedShifts = const <Shift>[],
      this.selectedRequestedShifts = const <Shift>[]})
      : assert(notifierState != null),
        assert(selectedShifts != null),
        assert(loggedinUserRequestedShifts != null),
        assert(selectedRequestedShifts != null);

  @JsonKey(defaultValue: NotifierState.initial)
  @override
  final NotifierState notifierState;
  @override
  final Map<DateTime, List<Shift>> shifts;
  @override
  final Map<DateTime, List<Shift>> requestedShifts;
  @override
  final DateTime selectedDate;
  @JsonKey(defaultValue: const <Shift>[])
  @override
  final List<Shift> selectedShifts;
  @JsonKey(defaultValue: const <Shift>[])
  @override
  final List<Shift> loggedinUserRequestedShifts;
  @JsonKey(defaultValue: const <Shift>[])
  @override
  final List<Shift> selectedRequestedShifts;

  @override
  String toString() {
    return 'CalendarState(notifierState: $notifierState, shifts: $shifts, requestedShifts: $requestedShifts, selectedDate: $selectedDate, selectedShifts: $selectedShifts, loggedinUserRequestedShifts: $loggedinUserRequestedShifts, selectedRequestedShifts: $selectedRequestedShifts)';
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
            (identical(other.requestedShifts, requestedShifts) ||
                const DeepCollectionEquality()
                    .equals(other.requestedShifts, requestedShifts)) &&
            (identical(other.selectedDate, selectedDate) ||
                const DeepCollectionEquality()
                    .equals(other.selectedDate, selectedDate)) &&
            (identical(other.selectedShifts, selectedShifts) ||
                const DeepCollectionEquality()
                    .equals(other.selectedShifts, selectedShifts)) &&
            (identical(other.loggedinUserRequestedShifts,
                    loggedinUserRequestedShifts) ||
                const DeepCollectionEquality().equals(
                    other.loggedinUserRequestedShifts,
                    loggedinUserRequestedShifts)) &&
            (identical(
                    other.selectedRequestedShifts, selectedRequestedShifts) ||
                const DeepCollectionEquality().equals(
                    other.selectedRequestedShifts, selectedRequestedShifts)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(notifierState) ^
      const DeepCollectionEquality().hash(shifts) ^
      const DeepCollectionEquality().hash(requestedShifts) ^
      const DeepCollectionEquality().hash(selectedDate) ^
      const DeepCollectionEquality().hash(selectedShifts) ^
      const DeepCollectionEquality().hash(loggedinUserRequestedShifts) ^
      const DeepCollectionEquality().hash(selectedRequestedShifts);

  @override
  _$CalendarStateCopyWith<_CalendarState> get copyWith =>
      __$CalendarStateCopyWithImpl<_CalendarState>(this, _$identity);
}

abstract class _CalendarState implements CalendarState {
  const factory _CalendarState(
      {NotifierState notifierState,
      Map<DateTime, List<Shift>> shifts,
      Map<DateTime, List<Shift>> requestedShifts,
      DateTime selectedDate,
      List<Shift> selectedShifts,
      List<Shift> loggedinUserRequestedShifts,
      List<Shift> selectedRequestedShifts}) = _$_CalendarState;

  @override
  NotifierState get notifierState;
  @override
  Map<DateTime, List<Shift>> get shifts;
  @override
  Map<DateTime, List<Shift>> get requestedShifts;
  @override
  DateTime get selectedDate;
  @override
  List<Shift> get selectedShifts;
  @override
  List<Shift> get loggedinUserRequestedShifts;
  @override
  List<Shift> get selectedRequestedShifts;
  @override
  _$CalendarStateCopyWith<_CalendarState> get copyWith;
}
