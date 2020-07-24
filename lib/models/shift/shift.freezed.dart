// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'shift.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
Shift _$ShiftFromJson(Map<String, dynamic> json) {
  return _Shift.fromJson(json);
}

class _$ShiftTearOff {
  const _$ShiftTearOff();

  _Shift call(
      {@JsonKey(name: 'user_id') String userId, DateTime start, DateTime end}) {
    return _Shift(
      userId: userId,
      start: start,
      end: end,
    );
  }
}

// ignore: unused_element
const $Shift = _$ShiftTearOff();

mixin _$Shift {
  @JsonKey(name: 'user_id')
  String get userId;
  DateTime get start;
  DateTime get end;

  Map<String, dynamic> toJson();
  $ShiftCopyWith<Shift> get copyWith;
}

abstract class $ShiftCopyWith<$Res> {
  factory $ShiftCopyWith(Shift value, $Res Function(Shift) then) =
      _$ShiftCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'user_id') String userId, DateTime start, DateTime end});
}

class _$ShiftCopyWithImpl<$Res> implements $ShiftCopyWith<$Res> {
  _$ShiftCopyWithImpl(this._value, this._then);

  final Shift _value;
  // ignore: unused_field
  final $Res Function(Shift) _then;

  @override
  $Res call({
    Object userId = freezed,
    Object start = freezed,
    Object end = freezed,
  }) {
    return _then(_value.copyWith(
      userId: userId == freezed ? _value.userId : userId as String,
      start: start == freezed ? _value.start : start as DateTime,
      end: end == freezed ? _value.end : end as DateTime,
    ));
  }
}

abstract class _$ShiftCopyWith<$Res> implements $ShiftCopyWith<$Res> {
  factory _$ShiftCopyWith(_Shift value, $Res Function(_Shift) then) =
      __$ShiftCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'user_id') String userId, DateTime start, DateTime end});
}

class __$ShiftCopyWithImpl<$Res> extends _$ShiftCopyWithImpl<$Res>
    implements _$ShiftCopyWith<$Res> {
  __$ShiftCopyWithImpl(_Shift _value, $Res Function(_Shift) _then)
      : super(_value, (v) => _then(v as _Shift));

  @override
  _Shift get _value => super._value as _Shift;

  @override
  $Res call({
    Object userId = freezed,
    Object start = freezed,
    Object end = freezed,
  }) {
    return _then(_Shift(
      userId: userId == freezed ? _value.userId : userId as String,
      start: start == freezed ? _value.start : start as DateTime,
      end: end == freezed ? _value.end : end as DateTime,
    ));
  }
}

@JsonSerializable()
class _$_Shift with DiagnosticableTreeMixin implements _Shift {
  const _$_Shift({@JsonKey(name: 'user_id') this.userId, this.start, this.end});

  factory _$_Shift.fromJson(Map<String, dynamic> json) =>
      _$_$_ShiftFromJson(json);

  @override
  @JsonKey(name: 'user_id')
  final String userId;
  @override
  final DateTime start;
  @override
  final DateTime end;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Shift(userId: $userId, start: $start, end: $end)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Shift'))
      ..add(DiagnosticsProperty('userId', userId))
      ..add(DiagnosticsProperty('start', start))
      ..add(DiagnosticsProperty('end', end));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Shift &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.start, start) ||
                const DeepCollectionEquality().equals(other.start, start)) &&
            (identical(other.end, end) ||
                const DeepCollectionEquality().equals(other.end, end)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(userId) ^
      const DeepCollectionEquality().hash(start) ^
      const DeepCollectionEquality().hash(end);

  @override
  _$ShiftCopyWith<_Shift> get copyWith =>
      __$ShiftCopyWithImpl<_Shift>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ShiftToJson(this);
  }
}

abstract class _Shift implements Shift {
  const factory _Shift(
      {@JsonKey(name: 'user_id') String userId,
      DateTime start,
      DateTime end}) = _$_Shift;

  factory _Shift.fromJson(Map<String, dynamic> json) = _$_Shift.fromJson;

  @override
  @JsonKey(name: 'user_id')
  String get userId;
  @override
  DateTime get start;
  @override
  DateTime get end;
  @override
  _$ShiftCopyWith<_Shift> get copyWith;
}
