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
      {Map<DateTime, List<User>> attendees,
      DateTime selectedDate,
      List<User> selectedAttendees}) {
    return _CalendarState(
      attendees: attendees,
      selectedDate: selectedDate,
      selectedAttendees: selectedAttendees,
    );
  }
}

// ignore: unused_element
const $CalendarState = _$CalendarStateTearOff();

mixin _$CalendarState {
  Map<DateTime, List<User>> get attendees;
  DateTime get selectedDate;
  List<User> get selectedAttendees;

  $CalendarStateCopyWith<CalendarState> get copyWith;
}

abstract class $CalendarStateCopyWith<$Res> {
  factory $CalendarStateCopyWith(
          CalendarState value, $Res Function(CalendarState) then) =
      _$CalendarStateCopyWithImpl<$Res>;
  $Res call(
      {Map<DateTime, List<User>> attendees,
      DateTime selectedDate,
      List<User> selectedAttendees});
}

class _$CalendarStateCopyWithImpl<$Res>
    implements $CalendarStateCopyWith<$Res> {
  _$CalendarStateCopyWithImpl(this._value, this._then);

  final CalendarState _value;
  // ignore: unused_field
  final $Res Function(CalendarState) _then;

  @override
  $Res call({
    Object attendees = freezed,
    Object selectedDate = freezed,
    Object selectedAttendees = freezed,
  }) {
    return _then(_value.copyWith(
      attendees: attendees == freezed
          ? _value.attendees
          : attendees as Map<DateTime, List<User>>,
      selectedDate: selectedDate == freezed
          ? _value.selectedDate
          : selectedDate as DateTime,
      selectedAttendees: selectedAttendees == freezed
          ? _value.selectedAttendees
          : selectedAttendees as List<User>,
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
      {Map<DateTime, List<User>> attendees,
      DateTime selectedDate,
      List<User> selectedAttendees});
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
    Object attendees = freezed,
    Object selectedDate = freezed,
    Object selectedAttendees = freezed,
  }) {
    return _then(_CalendarState(
      attendees: attendees == freezed
          ? _value.attendees
          : attendees as Map<DateTime, List<User>>,
      selectedDate: selectedDate == freezed
          ? _value.selectedDate
          : selectedDate as DateTime,
      selectedAttendees: selectedAttendees == freezed
          ? _value.selectedAttendees
          : selectedAttendees as List<User>,
    ));
  }
}

class _$_CalendarState implements _CalendarState {
  const _$_CalendarState(
      {this.attendees, this.selectedDate, this.selectedAttendees});

  @override
  final Map<DateTime, List<User>> attendees;
  @override
  final DateTime selectedDate;
  @override
  final List<User> selectedAttendees;

  @override
  String toString() {
    return 'CalendarState(attendees: $attendees, selectedDate: $selectedDate, selectedAttendees: $selectedAttendees)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CalendarState &&
            (identical(other.attendees, attendees) ||
                const DeepCollectionEquality()
                    .equals(other.attendees, attendees)) &&
            (identical(other.selectedDate, selectedDate) ||
                const DeepCollectionEquality()
                    .equals(other.selectedDate, selectedDate)) &&
            (identical(other.selectedAttendees, selectedAttendees) ||
                const DeepCollectionEquality()
                    .equals(other.selectedAttendees, selectedAttendees)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(attendees) ^
      const DeepCollectionEquality().hash(selectedDate) ^
      const DeepCollectionEquality().hash(selectedAttendees);

  @override
  _$CalendarStateCopyWith<_CalendarState> get copyWith =>
      __$CalendarStateCopyWithImpl<_CalendarState>(this, _$identity);
}

abstract class _CalendarState implements CalendarState {
  const factory _CalendarState(
      {Map<DateTime, List<User>> attendees,
      DateTime selectedDate,
      List<User> selectedAttendees}) = _$_CalendarState;

  @override
  Map<DateTime, List<User>> get attendees;
  @override
  DateTime get selectedDate;
  @override
  List<User> get selectedAttendees;
  @override
  _$CalendarStateCopyWith<_CalendarState> get copyWith;
}
