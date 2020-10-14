// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'member_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$MemberStateTearOff {
  const _$MemberStateTearOff();

// ignore: unused_element
  _MemberState call(
      {List<Member> members, Stream<List<Member>> membersStream}) {
    return _MemberState(
      members: members,
      membersStream: membersStream,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $MemberState = _$MemberStateTearOff();

/// @nodoc
mixin _$MemberState {
  List<Member> get members;
  Stream<List<Member>> get membersStream;

  $MemberStateCopyWith<MemberState> get copyWith;
}

/// @nodoc
abstract class $MemberStateCopyWith<$Res> {
  factory $MemberStateCopyWith(
          MemberState value, $Res Function(MemberState) then) =
      _$MemberStateCopyWithImpl<$Res>;
  $Res call({List<Member> members, Stream<List<Member>> membersStream});
}

/// @nodoc
class _$MemberStateCopyWithImpl<$Res> implements $MemberStateCopyWith<$Res> {
  _$MemberStateCopyWithImpl(this._value, this._then);

  final MemberState _value;
  // ignore: unused_field
  final $Res Function(MemberState) _then;

  @override
  $Res call({
    Object members = freezed,
    Object membersStream = freezed,
  }) {
    return _then(_value.copyWith(
      members: members == freezed ? _value.members : members as List<Member>,
      membersStream: membersStream == freezed
          ? _value.membersStream
          : membersStream as Stream<List<Member>>,
    ));
  }
}

/// @nodoc
abstract class _$MemberStateCopyWith<$Res>
    implements $MemberStateCopyWith<$Res> {
  factory _$MemberStateCopyWith(
          _MemberState value, $Res Function(_MemberState) then) =
      __$MemberStateCopyWithImpl<$Res>;
  @override
  $Res call({List<Member> members, Stream<List<Member>> membersStream});
}

/// @nodoc
class __$MemberStateCopyWithImpl<$Res> extends _$MemberStateCopyWithImpl<$Res>
    implements _$MemberStateCopyWith<$Res> {
  __$MemberStateCopyWithImpl(
      _MemberState _value, $Res Function(_MemberState) _then)
      : super(_value, (v) => _then(v as _MemberState));

  @override
  _MemberState get _value => super._value as _MemberState;

  @override
  $Res call({
    Object members = freezed,
    Object membersStream = freezed,
  }) {
    return _then(_MemberState(
      members: members == freezed ? _value.members : members as List<Member>,
      membersStream: membersStream == freezed
          ? _value.membersStream
          : membersStream as Stream<List<Member>>,
    ));
  }
}

/// @nodoc
class _$_MemberState with DiagnosticableTreeMixin implements _MemberState {
  const _$_MemberState({this.members, this.membersStream});

  @override
  final List<Member> members;
  @override
  final Stream<List<Member>> membersStream;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MemberState(members: $members, membersStream: $membersStream)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MemberState'))
      ..add(DiagnosticsProperty('members', members))
      ..add(DiagnosticsProperty('membersStream', membersStream));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _MemberState &&
            (identical(other.members, members) ||
                const DeepCollectionEquality()
                    .equals(other.members, members)) &&
            (identical(other.membersStream, membersStream) ||
                const DeepCollectionEquality()
                    .equals(other.membersStream, membersStream)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(members) ^
      const DeepCollectionEquality().hash(membersStream);

  @override
  _$MemberStateCopyWith<_MemberState> get copyWith =>
      __$MemberStateCopyWithImpl<_MemberState>(this, _$identity);
}

abstract class _MemberState implements MemberState {
  const factory _MemberState(
      {List<Member> members,
      Stream<List<Member>> membersStream}) = _$_MemberState;

  @override
  List<Member> get members;
  @override
  Stream<List<Member>> get membersStream;
  @override
  _$MemberStateCopyWith<_MemberState> get copyWith;
}
