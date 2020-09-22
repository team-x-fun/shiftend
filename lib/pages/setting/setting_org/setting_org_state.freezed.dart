// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'setting_org_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$SettingOrgStateTearOff {
  const _$SettingOrgStateTearOff();

  _SettingOrgState call(
      {NotifierState notifierState = NotifierState.initial,
      List<Holiday> holidays = const <Holiday>[],
      List<User> members = const <User>[]}) {
    return _SettingOrgState(
      notifierState: notifierState,
      holidays: holidays,
      members: members,
    );
  }
}

// ignore: unused_element
const $SettingOrgState = _$SettingOrgStateTearOff();

mixin _$SettingOrgState {
  NotifierState get notifierState;
  List<Holiday> get holidays;
  List<User> get members;

  $SettingOrgStateCopyWith<SettingOrgState> get copyWith;
}

abstract class $SettingOrgStateCopyWith<$Res> {
  factory $SettingOrgStateCopyWith(
          SettingOrgState value, $Res Function(SettingOrgState) then) =
      _$SettingOrgStateCopyWithImpl<$Res>;
  $Res call(
      {NotifierState notifierState,
      List<Holiday> holidays,
      List<User> members});
}

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
  }) {
    return _then(_value.copyWith(
      notifierState: notifierState == freezed
          ? _value.notifierState
          : notifierState as NotifierState,
      holidays:
          holidays == freezed ? _value.holidays : holidays as List<Holiday>,
      members: members == freezed ? _value.members : members as List<User>,
    ));
  }
}

abstract class _$SettingOrgStateCopyWith<$Res>
    implements $SettingOrgStateCopyWith<$Res> {
  factory _$SettingOrgStateCopyWith(
          _SettingOrgState value, $Res Function(_SettingOrgState) then) =
      __$SettingOrgStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {NotifierState notifierState,
      List<Holiday> holidays,
      List<User> members});
}

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
  }) {
    return _then(_SettingOrgState(
      notifierState: notifierState == freezed
          ? _value.notifierState
          : notifierState as NotifierState,
      holidays:
          holidays == freezed ? _value.holidays : holidays as List<Holiday>,
      members: members == freezed ? _value.members : members as List<User>,
    ));
  }
}

class _$_SettingOrgState implements _SettingOrgState {
  const _$_SettingOrgState(
      {this.notifierState = NotifierState.initial,
      this.holidays = const <Holiday>[],
      this.members = const <User>[]})
      : assert(notifierState != null),
        assert(holidays != null),
        assert(members != null);

  @JsonKey(defaultValue: NotifierState.initial)
  @override
  final NotifierState notifierState;
  @JsonKey(defaultValue: const <Holiday>[])
  @override
  final List<Holiday> holidays;
  @JsonKey(defaultValue: const <User>[])
  @override
  final List<User> members;

  @override
  String toString() {
    return 'SettingOrgState(notifierState: $notifierState, holidays: $holidays, members: $members)';
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
                const DeepCollectionEquality().equals(other.members, members)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(notifierState) ^
      const DeepCollectionEquality().hash(holidays) ^
      const DeepCollectionEquality().hash(members);

  @override
  _$SettingOrgStateCopyWith<_SettingOrgState> get copyWith =>
      __$SettingOrgStateCopyWithImpl<_SettingOrgState>(this, _$identity);
}

abstract class _SettingOrgState implements SettingOrgState {
  const factory _SettingOrgState(
      {NotifierState notifierState,
      List<Holiday> holidays,
      List<User> members}) = _$_SettingOrgState;

  @override
  NotifierState get notifierState;
  @override
  List<Holiday> get holidays;
  @override
  List<User> get members;
  @override
  _$SettingOrgStateCopyWith<_SettingOrgState> get copyWith;
}
