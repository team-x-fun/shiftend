// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'personnel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
Personnel _$PersonnelFromJson(Map<String, dynamic> json) {
  return _Personnel.fromJson(json);
}

class _$PersonnelTearOff {
  const _$PersonnelTearOff();

  _Personnel call({int number, @JsonKey(name: 'total_level') int totalLevel}) {
    return _Personnel(
      number: number,
      totalLevel: totalLevel,
    );
  }
}

// ignore: unused_element
const $Personnel = _$PersonnelTearOff();

mixin _$Personnel {
  int get number;
  @JsonKey(name: 'total_level')
  int get totalLevel;

  Map<String, dynamic> toJson();
  $PersonnelCopyWith<Personnel> get copyWith;
}

abstract class $PersonnelCopyWith<$Res> {
  factory $PersonnelCopyWith(Personnel value, $Res Function(Personnel) then) =
      _$PersonnelCopyWithImpl<$Res>;
  $Res call({int number, @JsonKey(name: 'total_level') int totalLevel});
}

class _$PersonnelCopyWithImpl<$Res> implements $PersonnelCopyWith<$Res> {
  _$PersonnelCopyWithImpl(this._value, this._then);

  final Personnel _value;
  // ignore: unused_field
  final $Res Function(Personnel) _then;

  @override
  $Res call({
    Object number = freezed,
    Object totalLevel = freezed,
  }) {
    return _then(_value.copyWith(
      number: number == freezed ? _value.number : number as int,
      totalLevel: totalLevel == freezed ? _value.totalLevel : totalLevel as int,
    ));
  }
}

abstract class _$PersonnelCopyWith<$Res> implements $PersonnelCopyWith<$Res> {
  factory _$PersonnelCopyWith(
          _Personnel value, $Res Function(_Personnel) then) =
      __$PersonnelCopyWithImpl<$Res>;
  @override
  $Res call({int number, @JsonKey(name: 'total_level') int totalLevel});
}

class __$PersonnelCopyWithImpl<$Res> extends _$PersonnelCopyWithImpl<$Res>
    implements _$PersonnelCopyWith<$Res> {
  __$PersonnelCopyWithImpl(_Personnel _value, $Res Function(_Personnel) _then)
      : super(_value, (v) => _then(v as _Personnel));

  @override
  _Personnel get _value => super._value as _Personnel;

  @override
  $Res call({
    Object number = freezed,
    Object totalLevel = freezed,
  }) {
    return _then(_Personnel(
      number: number == freezed ? _value.number : number as int,
      totalLevel: totalLevel == freezed ? _value.totalLevel : totalLevel as int,
    ));
  }
}

@JsonSerializable()
class _$_Personnel with DiagnosticableTreeMixin implements _Personnel {
  const _$_Personnel(
      {this.number, @JsonKey(name: 'total_level') this.totalLevel});

  factory _$_Personnel.fromJson(Map<String, dynamic> json) =>
      _$_$_PersonnelFromJson(json);

  @override
  final int number;
  @override
  @JsonKey(name: 'total_level')
  final int totalLevel;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Personnel(number: $number, totalLevel: $totalLevel)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Personnel'))
      ..add(DiagnosticsProperty('number', number))
      ..add(DiagnosticsProperty('totalLevel', totalLevel));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Personnel &&
            (identical(other.number, number) ||
                const DeepCollectionEquality().equals(other.number, number)) &&
            (identical(other.totalLevel, totalLevel) ||
                const DeepCollectionEquality()
                    .equals(other.totalLevel, totalLevel)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(number) ^
      const DeepCollectionEquality().hash(totalLevel);

  @override
  _$PersonnelCopyWith<_Personnel> get copyWith =>
      __$PersonnelCopyWithImpl<_Personnel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_PersonnelToJson(this);
  }
}

abstract class _Personnel implements Personnel {
  const factory _Personnel(
      {int number,
      @JsonKey(name: 'total_level') int totalLevel}) = _$_Personnel;

  factory _Personnel.fromJson(Map<String, dynamic> json) =
      _$_Personnel.fromJson;

  @override
  int get number;
  @override
  @JsonKey(name: 'total_level')
  int get totalLevel;
  @override
  _$PersonnelCopyWith<_Personnel> get copyWith;
}
