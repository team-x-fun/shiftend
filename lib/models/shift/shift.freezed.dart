// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'shift.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
Shift _$ShiftFromJson(Map<String, dynamic> json) {
  return _Shift.fromJson(json);
}

/// @nodoc
class _$ShiftTearOff {
  const _$ShiftTearOff();

// ignore: unused_element
  _Shift call(
      {@MemberConverter() Member member, DateTime start, DateTime end}) {
    return _Shift(
      member: member,
      start: start,
      end: end,
    );
  }

// ignore: unused_element
  Shift fromJson(Map<String, Object> json) {
    return Shift.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $Shift = _$ShiftTearOff();

/// @nodoc
mixin _$Shift {
  @MemberConverter()
  Member get member;
  DateTime get start;
  DateTime get end;

  Map<String, dynamic> toJson();
  $ShiftCopyWith<Shift> get copyWith;
}

/// @nodoc
abstract class $ShiftCopyWith<$Res> {
  factory $ShiftCopyWith(Shift value, $Res Function(Shift) then) =
      _$ShiftCopyWithImpl<$Res>;
  $Res call({@MemberConverter() Member member, DateTime start, DateTime end});

  $MemberCopyWith<$Res> get member;
}

/// @nodoc
class _$ShiftCopyWithImpl<$Res> implements $ShiftCopyWith<$Res> {
  _$ShiftCopyWithImpl(this._value, this._then);

  final Shift _value;
  // ignore: unused_field
  final $Res Function(Shift) _then;

  @override
  $Res call({
    Object member = freezed,
    Object start = freezed,
    Object end = freezed,
  }) {
    return _then(_value.copyWith(
      member: member == freezed ? _value.member : member as Member,
      start: start == freezed ? _value.start : start as DateTime,
      end: end == freezed ? _value.end : end as DateTime,
    ));
  }

  @override
  $MemberCopyWith<$Res> get member {
    if (_value.member == null) {
      return null;
    }
    return $MemberCopyWith<$Res>(_value.member, (value) {
      return _then(_value.copyWith(member: value));
    });
  }
}

/// @nodoc
abstract class _$ShiftCopyWith<$Res> implements $ShiftCopyWith<$Res> {
  factory _$ShiftCopyWith(_Shift value, $Res Function(_Shift) then) =
      __$ShiftCopyWithImpl<$Res>;
  @override
  $Res call({@MemberConverter() Member member, DateTime start, DateTime end});

  @override
  $MemberCopyWith<$Res> get member;
}

/// @nodoc
class __$ShiftCopyWithImpl<$Res> extends _$ShiftCopyWithImpl<$Res>
    implements _$ShiftCopyWith<$Res> {
  __$ShiftCopyWithImpl(_Shift _value, $Res Function(_Shift) _then)
      : super(_value, (v) => _then(v as _Shift));

  @override
  _Shift get _value => super._value as _Shift;

  @override
  $Res call({
    Object member = freezed,
    Object start = freezed,
    Object end = freezed,
  }) {
    return _then(_Shift(
      member: member == freezed ? _value.member : member as Member,
      start: start == freezed ? _value.start : start as DateTime,
      end: end == freezed ? _value.end : end as DateTime,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_Shift with DiagnosticableTreeMixin implements _Shift {
  const _$_Shift({@MemberConverter() this.member, this.start, this.end});

  factory _$_Shift.fromJson(Map<String, dynamic> json) =>
      _$_$_ShiftFromJson(json);

  @override
  @MemberConverter()
  final Member member;
  @override
  final DateTime start;
  @override
  final DateTime end;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Shift(member: $member, start: $start, end: $end)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Shift'))
      ..add(DiagnosticsProperty('member', member))
      ..add(DiagnosticsProperty('start', start))
      ..add(DiagnosticsProperty('end', end));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Shift &&
            (identical(other.member, member) ||
                const DeepCollectionEquality().equals(other.member, member)) &&
            (identical(other.start, start) ||
                const DeepCollectionEquality().equals(other.start, start)) &&
            (identical(other.end, end) ||
                const DeepCollectionEquality().equals(other.end, end)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(member) ^
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
      {@MemberConverter() Member member,
      DateTime start,
      DateTime end}) = _$_Shift;

  factory _Shift.fromJson(Map<String, dynamic> json) = _$_Shift.fromJson;

  @override
  @MemberConverter()
  Member get member;
  @override
  DateTime get start;
  @override
  DateTime get end;
  @override
  _$ShiftCopyWith<_Shift> get copyWith;
}
