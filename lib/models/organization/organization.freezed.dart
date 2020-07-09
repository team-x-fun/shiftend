// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'organization.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
Organization _$OrganizationFromJson(Map<String, dynamic> json) {
  return _Organization.fromJson(json);
}

class _$OrganizationTearOff {
  const _$OrganizationTearOff();

  _Organization call(
      {String id,
      @JsonKey(name: 'owner_ids')
          List<String> ownerIds,
      @JsonKey(name: 'member_ids')
          List<String> memberIds,
      @JsonKey(name: 'default_holidays')
      @HolidayConverter()
          List<Holiday> defaultHolidays}) {
    return _Organization(
      id: id,
      ownerIds: ownerIds,
      memberIds: memberIds,
      defaultHolidays: defaultHolidays,
    );
  }
}

// ignore: unused_element
const $Organization = _$OrganizationTearOff();

mixin _$Organization {
  String get id;
  @JsonKey(name: 'owner_ids')
  List<String> get ownerIds;
  @JsonKey(name: 'member_ids')
  List<String> get memberIds;
  @JsonKey(name: 'default_holidays')
  @HolidayConverter()
  List<Holiday> get defaultHolidays;

  Map<String, dynamic> toJson();
  $OrganizationCopyWith<Organization> get copyWith;
}

abstract class $OrganizationCopyWith<$Res> {
  factory $OrganizationCopyWith(
          Organization value, $Res Function(Organization) then) =
      _$OrganizationCopyWithImpl<$Res>;
  $Res call(
      {String id,
      @JsonKey(name: 'owner_ids')
          List<String> ownerIds,
      @JsonKey(name: 'member_ids')
          List<String> memberIds,
      @JsonKey(name: 'default_holidays')
      @HolidayConverter()
          List<Holiday> defaultHolidays});
}

class _$OrganizationCopyWithImpl<$Res> implements $OrganizationCopyWith<$Res> {
  _$OrganizationCopyWithImpl(this._value, this._then);

  final Organization _value;
  // ignore: unused_field
  final $Res Function(Organization) _then;

  @override
  $Res call({
    Object id = freezed,
    Object ownerIds = freezed,
    Object memberIds = freezed,
    Object defaultHolidays = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      ownerIds:
          ownerIds == freezed ? _value.ownerIds : ownerIds as List<String>,
      memberIds:
          memberIds == freezed ? _value.memberIds : memberIds as List<String>,
      defaultHolidays: defaultHolidays == freezed
          ? _value.defaultHolidays
          : defaultHolidays as List<Holiday>,
    ));
  }
}

abstract class _$OrganizationCopyWith<$Res>
    implements $OrganizationCopyWith<$Res> {
  factory _$OrganizationCopyWith(
          _Organization value, $Res Function(_Organization) then) =
      __$OrganizationCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      @JsonKey(name: 'owner_ids')
          List<String> ownerIds,
      @JsonKey(name: 'member_ids')
          List<String> memberIds,
      @JsonKey(name: 'default_holidays')
      @HolidayConverter()
          List<Holiday> defaultHolidays});
}

class __$OrganizationCopyWithImpl<$Res> extends _$OrganizationCopyWithImpl<$Res>
    implements _$OrganizationCopyWith<$Res> {
  __$OrganizationCopyWithImpl(
      _Organization _value, $Res Function(_Organization) _then)
      : super(_value, (v) => _then(v as _Organization));

  @override
  _Organization get _value => super._value as _Organization;

  @override
  $Res call({
    Object id = freezed,
    Object ownerIds = freezed,
    Object memberIds = freezed,
    Object defaultHolidays = freezed,
  }) {
    return _then(_Organization(
      id: id == freezed ? _value.id : id as String,
      ownerIds:
          ownerIds == freezed ? _value.ownerIds : ownerIds as List<String>,
      memberIds:
          memberIds == freezed ? _value.memberIds : memberIds as List<String>,
      defaultHolidays: defaultHolidays == freezed
          ? _value.defaultHolidays
          : defaultHolidays as List<Holiday>,
    ));
  }
}

@JsonSerializable()
class _$_Organization with DiagnosticableTreeMixin implements _Organization {
  const _$_Organization(
      {this.id,
      @JsonKey(name: 'owner_ids')
          this.ownerIds,
      @JsonKey(name: 'member_ids')
          this.memberIds,
      @JsonKey(name: 'default_holidays')
      @HolidayConverter()
          this.defaultHolidays});

  factory _$_Organization.fromJson(Map<String, dynamic> json) =>
      _$_$_OrganizationFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'owner_ids')
  final List<String> ownerIds;
  @override
  @JsonKey(name: 'member_ids')
  final List<String> memberIds;
  @override
  @JsonKey(name: 'default_holidays')
  @HolidayConverter()
  final List<Holiday> defaultHolidays;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Organization(id: $id, ownerIds: $ownerIds, memberIds: $memberIds, defaultHolidays: $defaultHolidays)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Organization'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('ownerIds', ownerIds))
      ..add(DiagnosticsProperty('memberIds', memberIds))
      ..add(DiagnosticsProperty('defaultHolidays', defaultHolidays));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Organization &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.ownerIds, ownerIds) ||
                const DeepCollectionEquality()
                    .equals(other.ownerIds, ownerIds)) &&
            (identical(other.memberIds, memberIds) ||
                const DeepCollectionEquality()
                    .equals(other.memberIds, memberIds)) &&
            (identical(other.defaultHolidays, defaultHolidays) ||
                const DeepCollectionEquality()
                    .equals(other.defaultHolidays, defaultHolidays)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(ownerIds) ^
      const DeepCollectionEquality().hash(memberIds) ^
      const DeepCollectionEquality().hash(defaultHolidays);

  @override
  _$OrganizationCopyWith<_Organization> get copyWith =>
      __$OrganizationCopyWithImpl<_Organization>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_OrganizationToJson(this);
  }
}

abstract class _Organization implements Organization {
  const factory _Organization(
      {String id,
      @JsonKey(name: 'owner_ids')
          List<String> ownerIds,
      @JsonKey(name: 'member_ids')
          List<String> memberIds,
      @JsonKey(name: 'default_holidays')
      @HolidayConverter()
          List<Holiday> defaultHolidays}) = _$_Organization;

  factory _Organization.fromJson(Map<String, dynamic> json) =
      _$_Organization.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'owner_ids')
  List<String> get ownerIds;
  @override
  @JsonKey(name: 'member_ids')
  List<String> get memberIds;
  @override
  @JsonKey(name: 'default_holidays')
  @HolidayConverter()
  List<Holiday> get defaultHolidays;
  @override
  _$OrganizationCopyWith<_Organization> get copyWith;
}
