// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'holiday.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
Holiday _$HolidayFromJson(Map<String, dynamic> json) {
  return _Holiday.fromJson(json);
}

/// @nodoc
class _$HolidayTearOff {
  const _$HolidayTearOff();

// ignore: unused_element
  _Holiday call(
      {@JsonKey(name: 'day_of_week') int dayOfWeek,
      @JsonKey(name: 'n_week') int nWeek}) {
    return _Holiday(
      dayOfWeek: dayOfWeek,
      nWeek: nWeek,
    );
  }

// ignore: unused_element
  Holiday fromJson(Map<String, Object> json) {
    return Holiday.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $Holiday = _$HolidayTearOff();

/// @nodoc
mixin _$Holiday {
  @JsonKey(name: 'day_of_week')
  int get dayOfWeek;
  @JsonKey(name: 'n_week')
  int get nWeek;

  Map<String, dynamic> toJson();
  $HolidayCopyWith<Holiday> get copyWith;
}

/// @nodoc
abstract class $HolidayCopyWith<$Res> {
  factory $HolidayCopyWith(Holiday value, $Res Function(Holiday) then) =
      _$HolidayCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'day_of_week') int dayOfWeek,
      @JsonKey(name: 'n_week') int nWeek});
}

/// @nodoc
class _$HolidayCopyWithImpl<$Res> implements $HolidayCopyWith<$Res> {
  _$HolidayCopyWithImpl(this._value, this._then);

  final Holiday _value;
  // ignore: unused_field
  final $Res Function(Holiday) _then;

  @override
  $Res call({
    Object dayOfWeek = freezed,
    Object nWeek = freezed,
  }) {
    return _then(_value.copyWith(
      dayOfWeek: dayOfWeek == freezed ? _value.dayOfWeek : dayOfWeek as int,
      nWeek: nWeek == freezed ? _value.nWeek : nWeek as int,
    ));
  }
}

/// @nodoc
abstract class _$HolidayCopyWith<$Res> implements $HolidayCopyWith<$Res> {
  factory _$HolidayCopyWith(_Holiday value, $Res Function(_Holiday) then) =
      __$HolidayCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'day_of_week') int dayOfWeek,
      @JsonKey(name: 'n_week') int nWeek});
}

/// @nodoc
class __$HolidayCopyWithImpl<$Res> extends _$HolidayCopyWithImpl<$Res>
    implements _$HolidayCopyWith<$Res> {
  __$HolidayCopyWithImpl(_Holiday _value, $Res Function(_Holiday) _then)
      : super(_value, (v) => _then(v as _Holiday));

  @override
  _Holiday get _value => super._value as _Holiday;

  @override
  $Res call({
    Object dayOfWeek = freezed,
    Object nWeek = freezed,
  }) {
    return _then(_Holiday(
      dayOfWeek: dayOfWeek == freezed ? _value.dayOfWeek : dayOfWeek as int,
      nWeek: nWeek == freezed ? _value.nWeek : nWeek as int,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_Holiday with DiagnosticableTreeMixin implements _Holiday {
  const _$_Holiday(
      {@JsonKey(name: 'day_of_week') this.dayOfWeek,
      @JsonKey(name: 'n_week') this.nWeek});

  factory _$_Holiday.fromJson(Map<String, dynamic> json) =>
      _$_$_HolidayFromJson(json);

  @override
  @JsonKey(name: 'day_of_week')
  final int dayOfWeek;
  @override
  @JsonKey(name: 'n_week')
  final int nWeek;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Holiday(dayOfWeek: $dayOfWeek, nWeek: $nWeek)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Holiday'))
      ..add(DiagnosticsProperty('dayOfWeek', dayOfWeek))
      ..add(DiagnosticsProperty('nWeek', nWeek));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Holiday &&
            (identical(other.dayOfWeek, dayOfWeek) ||
                const DeepCollectionEquality()
                    .equals(other.dayOfWeek, dayOfWeek)) &&
            (identical(other.nWeek, nWeek) ||
                const DeepCollectionEquality().equals(other.nWeek, nWeek)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(dayOfWeek) ^
      const DeepCollectionEquality().hash(nWeek);

  @override
  _$HolidayCopyWith<_Holiday> get copyWith =>
      __$HolidayCopyWithImpl<_Holiday>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_HolidayToJson(this);
  }
}

abstract class _Holiday implements Holiday {
  const factory _Holiday(
      {@JsonKey(name: 'day_of_week') int dayOfWeek,
      @JsonKey(name: 'n_week') int nWeek}) = _$_Holiday;

  factory _Holiday.fromJson(Map<String, dynamic> json) = _$_Holiday.fromJson;

  @override
  @JsonKey(name: 'day_of_week')
  int get dayOfWeek;
  @override
  @JsonKey(name: 'n_week')
  int get nWeek;
  @override
  _$HolidayCopyWith<_Holiday> get copyWith;
}
