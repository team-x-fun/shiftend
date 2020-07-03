// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'holiday.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
Holiday _$HolidayFromJson(Map<String, dynamic> json) {
  return _Holiday.fromJson(json);
}

class _$HolidayTearOff {
  const _$HolidayTearOff();

  _Holiday call(
      {String id,
      @JsonKey(name: 'day_of_week') int dayOfWeek,
      @JsonKey(name: 'n_week') int nWeek}) {
    return _Holiday(
      id: id,
      dayOfWeek: dayOfWeek,
      nWeek: nWeek,
    );
  }
}

// ignore: unused_element
const $Holiday = _$HolidayTearOff();

mixin _$Holiday {
  String get id;
  @JsonKey(name: 'day_of_week')
  int get dayOfWeek;
  @JsonKey(name: 'n_week')
  int get nWeek;

  Map<String, dynamic> toJson();
  $HolidayCopyWith<Holiday> get copyWith;
}

abstract class $HolidayCopyWith<$Res> {
  factory $HolidayCopyWith(Holiday value, $Res Function(Holiday) then) =
      _$HolidayCopyWithImpl<$Res>;
  $Res call(
      {String id,
      @JsonKey(name: 'day_of_week') int dayOfWeek,
      @JsonKey(name: 'n_week') int nWeek});
}

class _$HolidayCopyWithImpl<$Res> implements $HolidayCopyWith<$Res> {
  _$HolidayCopyWithImpl(this._value, this._then);

  final Holiday _value;
  // ignore: unused_field
  final $Res Function(Holiday) _then;

  @override
  $Res call({
    Object id = freezed,
    Object dayOfWeek = freezed,
    Object nWeek = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      dayOfWeek: dayOfWeek == freezed ? _value.dayOfWeek : dayOfWeek as int,
      nWeek: nWeek == freezed ? _value.nWeek : nWeek as int,
    ));
  }
}

abstract class _$HolidayCopyWith<$Res> implements $HolidayCopyWith<$Res> {
  factory _$HolidayCopyWith(_Holiday value, $Res Function(_Holiday) then) =
      __$HolidayCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      @JsonKey(name: 'day_of_week') int dayOfWeek,
      @JsonKey(name: 'n_week') int nWeek});
}

class __$HolidayCopyWithImpl<$Res> extends _$HolidayCopyWithImpl<$Res>
    implements _$HolidayCopyWith<$Res> {
  __$HolidayCopyWithImpl(_Holiday _value, $Res Function(_Holiday) _then)
      : super(_value, (v) => _then(v as _Holiday));

  @override
  _Holiday get _value => super._value as _Holiday;

  @override
  $Res call({
    Object id = freezed,
    Object dayOfWeek = freezed,
    Object nWeek = freezed,
  }) {
    return _then(_Holiday(
      id: id == freezed ? _value.id : id as String,
      dayOfWeek: dayOfWeek == freezed ? _value.dayOfWeek : dayOfWeek as int,
      nWeek: nWeek == freezed ? _value.nWeek : nWeek as int,
    ));
  }
}

@JsonSerializable()
class _$_Holiday with DiagnosticableTreeMixin implements _Holiday {
  const _$_Holiday(
      {this.id,
      @JsonKey(name: 'day_of_week') this.dayOfWeek,
      @JsonKey(name: 'n_week') this.nWeek});

  factory _$_Holiday.fromJson(Map<String, dynamic> json) =>
      _$_$_HolidayFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'day_of_week')
  final int dayOfWeek;
  @override
  @JsonKey(name: 'n_week')
  final int nWeek;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Holiday(id: $id, dayOfWeek: $dayOfWeek, nWeek: $nWeek)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Holiday'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('dayOfWeek', dayOfWeek))
      ..add(DiagnosticsProperty('nWeek', nWeek));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Holiday &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.dayOfWeek, dayOfWeek) ||
                const DeepCollectionEquality()
                    .equals(other.dayOfWeek, dayOfWeek)) &&
            (identical(other.nWeek, nWeek) ||
                const DeepCollectionEquality().equals(other.nWeek, nWeek)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
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
      {String id,
      @JsonKey(name: 'day_of_week') int dayOfWeek,
      @JsonKey(name: 'n_week') int nWeek}) = _$_Holiday;

  factory _Holiday.fromJson(Map<String, dynamic> json) = _$_Holiday.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'day_of_week')
  int get dayOfWeek;
  @override
  @JsonKey(name: 'n_week')
  int get nWeek;
  @override
  _$HolidayCopyWith<_Holiday> get copyWith;
}
