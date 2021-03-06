// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'setting_org_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$SettingOrgStateTearOff {
  const _$SettingOrgStateTearOff();

// ignore: unused_element
  _SettingOrgState call(
      {NotifierState notifierState = NotifierState.initial,
      List<Holiday> holidays = const <Holiday>[],
      List<Member> members = const <Member>[],
      List<bool> selectedDayOfWeeks = const <bool>[
        false,
        false,
        false,
        false,
        false,
        false,
        false
      ],
      int intervalRegularHoliday = -1,
      Personnel defaultPersonnel = const Personnel(number: 0, totalLevel: 0)}) {
    return _SettingOrgState(
      notifierState: notifierState,
      holidays: holidays,
      members: members,
      selectedDayOfWeeks: selectedDayOfWeeks,
      intervalRegularHoliday: intervalRegularHoliday,
      defaultPersonnel: defaultPersonnel,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $SettingOrgState = _$SettingOrgStateTearOff();

/// @nodoc
mixin _$SettingOrgState {
  NotifierState get notifierState;
  List<Holiday> get holidays;
  List<Member> get members;
  List<bool> get selectedDayOfWeeks;
  int get intervalRegularHoliday;
  Personnel get defaultPersonnel;

  $SettingOrgStateCopyWith<SettingOrgState> get copyWith;
}

/// @nodoc
abstract class $SettingOrgStateCopyWith<$Res> {
  factory $SettingOrgStateCopyWith(
          SettingOrgState value, $Res Function(SettingOrgState) then) =
      _$SettingOrgStateCopyWithImpl<$Res>;
  $Res call(
      {NotifierState notifierState,
      List<Holiday> holidays,
      List<Member> members,
      List<bool> selectedDayOfWeeks,
      int intervalRegularHoliday,
      Personnel defaultPersonnel});

  $PersonnelCopyWith<$Res> get defaultPersonnel;
}

/// @nodoc
class _$SettingOrgStateCopyWithImpl<$Res>
    implements $SettingOrgStateCopyWith<$Res> {
  _$SettingOrgStateCopyWithImpl(this._value, this._then);

  final SettingOrgState _value;
  // ignore: unused_field
  final $Res Function(SettingOrgState) _then;

  @override
  $Res call({
    Object notifierState = freezed,
    Object holidays = freezed,
    Object members = freezed,
    Object selectedDayOfWeeks = freezed,
    Object intervalRegularHoliday = freezed,
    Object defaultPersonnel = freezed,
  }) {
    return _then(_value.copyWith(
      notifierState: notifierState == freezed
          ? _value.notifierState
          : notifierState as NotifierState,
      holidays:
          holidays == freezed ? _value.holidays : holidays as List<Holiday>,
      members: members == freezed ? _value.members : members as List<Member>,
      selectedDayOfWeeks: selectedDayOfWeeks == freezed
          ? _value.selectedDayOfWeeks
          : selectedDayOfWeeks as List<bool>,
      intervalRegularHoliday: intervalRegularHoliday == freezed
          ? _value.intervalRegularHoliday
          : intervalRegularHoliday as int,
      defaultPersonnel: defaultPersonnel == freezed
          ? _value.defaultPersonnel
          : defaultPersonnel as Personnel,
    ));
  }

  @override
  $PersonnelCopyWith<$Res> get defaultPersonnel {
    if (_value.defaultPersonnel == null) {
      return null;
    }
    return $PersonnelCopyWith<$Res>(_value.defaultPersonnel, (value) {
      return _then(_value.copyWith(defaultPersonnel: value));
    });
  }
}

/// @nodoc
abstract class _$SettingOrgStateCopyWith<$Res>
    implements $SettingOrgStateCopyWith<$Res> {
  factory _$SettingOrgStateCopyWith(
          _SettingOrgState value, $Res Function(_SettingOrgState) then) =
      __$SettingOrgStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {NotifierState notifierState,
      List<Holiday> holidays,
      List<Member> members,
      List<bool> selectedDayOfWeeks,
      int intervalRegularHoliday,
      Personnel defaultPersonnel});

  @override
  $PersonnelCopyWith<$Res> get defaultPersonnel;
}

/// @nodoc
class __$SettingOrgStateCopyWithImpl<$Res>
    extends _$SettingOrgStateCopyWithImpl<$Res>
    implements _$SettingOrgStateCopyWith<$Res> {
  __$SettingOrgStateCopyWithImpl(
      _SettingOrgState _value, $Res Function(_SettingOrgState) _then)
      : super(_value, (v) => _then(v as _SettingOrgState));

  @override
  _SettingOrgState get _value => super._value as _SettingOrgState;

  @override
  $Res call({
    Object notifierState = freezed,
    Object holidays = freezed,
    Object members = freezed,
    Object selectedDayOfWeeks = freezed,
    Object intervalRegularHoliday = freezed,
    Object defaultPersonnel = freezed,
  }) {
    return _then(_SettingOrgState(
      notifierState: notifierState == freezed
          ? _value.notifierState
          : notifierState as NotifierState,
      holidays:
          holidays == freezed ? _value.holidays : holidays as List<Holiday>,
      members: members == freezed ? _value.members : members as List<Member>,
      selectedDayOfWeeks: selectedDayOfWeeks == freezed
          ? _value.selectedDayOfWeeks
          : selectedDayOfWeeks as List<bool>,
      intervalRegularHoliday: intervalRegularHoliday == freezed
          ? _value.intervalRegularHoliday
          : intervalRegularHoliday as int,
      defaultPersonnel: defaultPersonnel == freezed
          ? _value.defaultPersonnel
          : defaultPersonnel as Personnel,
    ));
  }
}

/// @nodoc
class _$_SettingOrgState implements _SettingOrgState {
  const _$_SettingOrgState(
      {this.notifierState = NotifierState.initial,
      this.holidays = const <Holiday>[],
      this.members = const <Member>[],
      this.selectedDayOfWeeks = const <bool>[
        false,
        false,
        false,
        false,
        false,
        false,
        false
      ],
      this.intervalRegularHoliday = -1,
      this.defaultPersonnel = const Personnel(number: 0, totalLevel: 0)})
      : assert(notifierState != null),
        assert(holidays != null),
        assert(members != null),
        assert(selectedDayOfWeeks != null),
        assert(intervalRegularHoliday != null),
        assert(defaultPersonnel != null);

  @JsonKey(defaultValue: NotifierState.initial)
  @override
  final NotifierState notifierState;
  @JsonKey(defaultValue: const <Holiday>[])
  @override
  final List<Holiday> holidays;
  @JsonKey(defaultValue: const <Member>[])
  @override
  final List<Member> members;
  @JsonKey(defaultValue: const <bool>[
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ])
  @override
  final List<bool> selectedDayOfWeeks;
  @JsonKey(defaultValue: -1)
  @override
  final int intervalRegularHoliday;
  @JsonKey(defaultValue: const Personnel(number: 0, totalLevel: 0))
  @override
  final Personnel defaultPersonnel;

  @override
  String toString() {
    return 'SettingOrgState(notifierState: $notifierState, holidays: $holidays, members: $members, selectedDayOfWeeks: $selectedDayOfWeeks, intervalRegularHoliday: $intervalRegularHoliday, defaultPersonnel: $defaultPersonnel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SettingOrgState &&
            (identical(other.notifierState, notifierState) ||
                const DeepCollectionEquality()
                    .equals(other.notifierState, notifierState)) &&
            (identical(other.holidays, holidays) ||
                const DeepCollectionEquality()
                    .equals(other.holidays, holidays)) &&
            (identical(other.members, members) ||
                const DeepCollectionEquality()
                    .equals(other.members, members)) &&
            (identical(other.selectedDayOfWeeks, selectedDayOfWeeks) ||
                const DeepCollectionEquality()
                    .equals(other.selectedDayOfWeeks, selectedDayOfWeeks)) &&
            (identical(other.intervalRegularHoliday, intervalRegularHoliday) ||
                const DeepCollectionEquality().equals(
                    other.intervalRegularHoliday, intervalRegularHoliday)) &&
            (identical(other.defaultPersonnel, defaultPersonnel) ||
                const DeepCollectionEquality()
                    .equals(other.defaultPersonnel, defaultPersonnel)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(notifierState) ^
      const DeepCollectionEquality().hash(holidays) ^
      const DeepCollectionEquality().hash(members) ^
      const DeepCollectionEquality().hash(selectedDayOfWeeks) ^
      const DeepCollectionEquality().hash(intervalRegularHoliday) ^
      const DeepCollectionEquality().hash(defaultPersonnel);

  @override
  _$SettingOrgStateCopyWith<_SettingOrgState> get copyWith =>
      __$SettingOrgStateCopyWithImpl<_SettingOrgState>(this, _$identity);
}

abstract class _SettingOrgState implements SettingOrgState {
  const factory _SettingOrgState(
      {NotifierState notifierState,
      List<Holiday> holidays,
      List<Member> members,
      List<bool> selectedDayOfWeeks,
      int intervalRegularHoliday,
      Personnel defaultPersonnel}) = _$_SettingOrgState;

  @override
  NotifierState get notifierState;
  @override
  List<Holiday> get holidays;
  @override
  List<Member> get members;
  @override
  List<bool> get selectedDayOfWeeks;
  @override
  int get intervalRegularHoliday;
  @override
  Personnel get defaultPersonnel;
  @override
  _$SettingOrgStateCopyWith<_SettingOrgState> get copyWith;
}
