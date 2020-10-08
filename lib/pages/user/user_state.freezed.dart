// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'user_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$UserStateTearOff {
  const _$UserStateTearOff();

// ignore: unused_element
  _UserState call({NotifierState notifierState = NotifierState.initial}) {
    return _UserState(
      notifierState: notifierState,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $UserState = _$UserStateTearOff();

/// @nodoc
mixin _$UserState {
  NotifierState get notifierState;

  $UserStateCopyWith<UserState> get copyWith;
}

/// @nodoc
abstract class $UserStateCopyWith<$Res> {
  factory $UserStateCopyWith(UserState value, $Res Function(UserState) then) =
      _$UserStateCopyWithImpl<$Res>;
  $Res call({NotifierState notifierState});
}

/// @nodoc
class _$UserStateCopyWithImpl<$Res> implements $UserStateCopyWith<$Res> {
  _$UserStateCopyWithImpl(this._value, this._then);

  final UserState _value;
  // ignore: unused_field
  final $Res Function(UserState) _then;

  @override
  $Res call({
    Object notifierState = freezed,
  }) {
    return _then(_value.copyWith(
      notifierState: notifierState == freezed
          ? _value.notifierState
          : notifierState as NotifierState,
    ));
  }
}

/// @nodoc
abstract class _$UserStateCopyWith<$Res> implements $UserStateCopyWith<$Res> {
  factory _$UserStateCopyWith(
          _UserState value, $Res Function(_UserState) then) =
      __$UserStateCopyWithImpl<$Res>;
  @override
  $Res call({NotifierState notifierState});
}

/// @nodoc
class __$UserStateCopyWithImpl<$Res> extends _$UserStateCopyWithImpl<$Res>
    implements _$UserStateCopyWith<$Res> {
  __$UserStateCopyWithImpl(_UserState _value, $Res Function(_UserState) _then)
      : super(_value, (v) => _then(v as _UserState));

  @override
  _UserState get _value => super._value as _UserState;

  @override
  $Res call({
    Object notifierState = freezed,
  }) {
    return _then(_UserState(
      notifierState: notifierState == freezed
          ? _value.notifierState
          : notifierState as NotifierState,
    ));
  }
}

/// @nodoc
class _$_UserState implements _UserState {
  const _$_UserState({this.notifierState = NotifierState.initial})
      : assert(notifierState != null);

  @JsonKey(defaultValue: NotifierState.initial)
  @override
  final NotifierState notifierState;

  @override
  String toString() {
    return 'UserState(notifierState: $notifierState)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UserState &&
            (identical(other.notifierState, notifierState) ||
                const DeepCollectionEquality()
                    .equals(other.notifierState, notifierState)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(notifierState);

  @override
  _$UserStateCopyWith<_UserState> get copyWith =>
      __$UserStateCopyWithImpl<_UserState>(this, _$identity);
}

abstract class _UserState implements UserState {
  const factory _UserState({NotifierState notifierState}) = _$_UserState;

  @override
  NotifierState get notifierState;
  @override
  _$UserStateCopyWith<_UserState> get copyWith;
}
