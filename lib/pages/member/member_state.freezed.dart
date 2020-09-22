// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'member_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$MemberStateTearOff {
  const _$MemberStateTearOff();

  _MemberState call({double level = 3, String tel = '000-0000-0000'}) {
    return _MemberState(
      level: level,
      tel: tel,
    );
  }
}

// ignore: unused_element
const $MemberState = _$MemberStateTearOff();

mixin _$MemberState {
  double get level;
  String get tel;

  $MemberStateCopyWith<MemberState> get copyWith;
}

abstract class $MemberStateCopyWith<$Res> {
  factory $MemberStateCopyWith(
          MemberState value, $Res Function(MemberState) then) =
      _$MemberStateCopyWithImpl<$Res>;
  $Res call({double level, String tel});
}

class _$MemberStateCopyWithImpl<$Res> implements $MemberStateCopyWith<$Res> {
  _$MemberStateCopyWithImpl(this._value, this._then);

  final MemberState _value;
  // ignore: unused_field
  final $Res Function(MemberState) _then;

  @override
  $Res call({
    Object level = freezed,
    Object tel = freezed,
  }) {
    return _then(_value.copyWith(
      level: level == freezed ? _value.level : level as double,
      tel: tel == freezed ? _value.tel : tel as String,
    ));
  }
}

abstract class _$MemberStateCopyWith<$Res>
    implements $MemberStateCopyWith<$Res> {
  factory _$MemberStateCopyWith(
          _MemberState value, $Res Function(_MemberState) then) =
      __$MemberStateCopyWithImpl<$Res>;
  @override
  $Res call({double level, String tel});
}

class __$MemberStateCopyWithImpl<$Res> extends _$MemberStateCopyWithImpl<$Res>
    implements _$MemberStateCopyWith<$Res> {
  __$MemberStateCopyWithImpl(
      _MemberState _value, $Res Function(_MemberState) _then)
      : super(_value, (v) => _then(v as _MemberState));

  @override
  _MemberState get _value => super._value as _MemberState;

  @override
  $Res call({
    Object level = freezed,
    Object tel = freezed,
  }) {
    return _then(_MemberState(
      level: level == freezed ? _value.level : level as double,
      tel: tel == freezed ? _value.tel : tel as String,
    ));
  }
}

class _$_MemberState with DiagnosticableTreeMixin implements _MemberState {
  const _$_MemberState({this.level = 3, this.tel = '000-0000-0000'})
      : assert(level != null),
        assert(tel != null);

  @JsonKey(defaultValue: 3)
  @override
  final double level;
  @JsonKey(defaultValue: '000-0000-0000')
  @override
  final String tel;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MemberState(level: $level, tel: $tel)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MemberState'))
      ..add(DiagnosticsProperty('level', level))
      ..add(DiagnosticsProperty('tel', tel));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _MemberState &&
            (identical(other.level, level) ||
                const DeepCollectionEquality().equals(other.level, level)) &&
            (identical(other.tel, tel) ||
                const DeepCollectionEquality().equals(other.tel, tel)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(level) ^
      const DeepCollectionEquality().hash(tel);

  @override
  _$MemberStateCopyWith<_MemberState> get copyWith =>
      __$MemberStateCopyWithImpl<_MemberState>(this, _$identity);
}

abstract class _MemberState implements MemberState {
  const factory _MemberState({double level, String tel}) = _$_MemberState;

  @override
  double get level;
  @override
  String get tel;
  @override
  _$MemberStateCopyWith<_MemberState> get copyWith;
}
