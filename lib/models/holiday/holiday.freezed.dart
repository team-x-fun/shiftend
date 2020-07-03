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

  _Holiday call({String id, DateTime day, int interval, bool all}) {
    return _Holiday(
      id: id,
      day: day,
      interval: interval,
      all: all,
    );
  }
}

// ignore: unused_element
const $Holiday = _$HolidayTearOff();

mixin _$Holiday {
  String get id;
  DateTime get day;
  int get interval;
  bool get all;

  Map<String, dynamic> toJson();
  $HolidayCopyWith<Holiday> get copyWith;
}

abstract class $HolidayCopyWith<$Res> {
  factory $HolidayCopyWith(Holiday value, $Res Function(Holiday) then) =
      _$HolidayCopyWithImpl<$Res>;
  $Res call({String id, DateTime day, int interval, bool all});
}

class _$HolidayCopyWithImpl<$Res> implements $HolidayCopyWith<$Res> {
  _$HolidayCopyWithImpl(this._value, this._then);

  final Holiday _value;
  // ignore: unused_field
  final $Res Function(Holiday) _then;

  @override
  $Res call({
    Object id = freezed,
    Object day = freezed,
    Object interval = freezed,
    Object all = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      day: day == freezed ? _value.day : day as DateTime,
      interval: interval == freezed ? _value.interval : interval as int,
      all: all == freezed ? _value.all : all as bool,
    ));
  }
}

abstract class _$HolidayCopyWith<$Res> implements $HolidayCopyWith<$Res> {
  factory _$HolidayCopyWith(_Holiday value, $Res Function(_Holiday) then) =
      __$HolidayCopyWithImpl<$Res>;
  @override
  $Res call({String id, DateTime day, int interval, bool all});
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
    Object day = freezed,
    Object interval = freezed,
    Object all = freezed,
  }) {
    return _then(_Holiday(
      id: id == freezed ? _value.id : id as String,
      day: day == freezed ? _value.day : day as DateTime,
      interval: interval == freezed ? _value.interval : interval as int,
      all: all == freezed ? _value.all : all as bool,
    ));
  }
}

@JsonSerializable()
class _$_Holiday with DiagnosticableTreeMixin implements _Holiday {
  const _$_Holiday({this.id, this.day, this.interval, this.all});

  factory _$_Holiday.fromJson(Map<String, dynamic> json) =>
      _$_$_HolidayFromJson(json);

  @override
  final String id;
  @override
  final DateTime day;
  @override
  final int interval;
  @override
  final bool all;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Holiday(id: $id, day: $day, interval: $interval, all: $all)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Holiday'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('day', day))
      ..add(DiagnosticsProperty('interval', interval))
      ..add(DiagnosticsProperty('all', all));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Holiday &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.day, day) ||
                const DeepCollectionEquality().equals(other.day, day)) &&
            (identical(other.interval, interval) ||
                const DeepCollectionEquality()
                    .equals(other.interval, interval)) &&
            (identical(other.all, all) ||
                const DeepCollectionEquality().equals(other.all, all)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(day) ^
      const DeepCollectionEquality().hash(interval) ^
      const DeepCollectionEquality().hash(all);

  @override
  _$HolidayCopyWith<_Holiday> get copyWith =>
      __$HolidayCopyWithImpl<_Holiday>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_HolidayToJson(this);
  }
}

abstract class _Holiday implements Holiday {
  const factory _Holiday({String id, DateTime day, int interval, bool all}) =
      _$_Holiday;

  factory _Holiday.fromJson(Map<String, dynamic> json) = _$_Holiday.fromJson;

  @override
  String get id;
  @override
  DateTime get day;
  @override
  int get interval;
  @override
  bool get all;
  @override
  _$HolidayCopyWith<_Holiday> get copyWith;
}
