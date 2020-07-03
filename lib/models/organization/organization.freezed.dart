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
      @UserConverter()
          List<User> owners,
      @UserConverter()
          List<User> users,
      @JsonKey(name: 'default_holidays')
      @HolidayConverter()
          List<Holiday> defaltHolidays}) {
    return _Organization(
      id: id,
      owners: owners,
      users: users,
      defaltHolidays: defaltHolidays,
    );
  }
}

// ignore: unused_element
const $Organization = _$OrganizationTearOff();

mixin _$Organization {
  String get id;
  @UserConverter()
  List<User> get owners;
  @UserConverter()
  List<User> get users;
  @JsonKey(name: 'default_holidays')
  @HolidayConverter()
  List<Holiday> get defaltHolidays;

  Map<String, dynamic> toJson();
  $OrganizationCopyWith<Organization> get copyWith;
}

abstract class $OrganizationCopyWith<$Res> {
  factory $OrganizationCopyWith(
          Organization value, $Res Function(Organization) then) =
      _$OrganizationCopyWithImpl<$Res>;
  $Res call(
      {String id,
      @UserConverter()
          List<User> owners,
      @UserConverter()
          List<User> users,
      @JsonKey(name: 'default_holidays')
      @HolidayConverter()
          List<Holiday> defaltHolidays});
}

class _$OrganizationCopyWithImpl<$Res> implements $OrganizationCopyWith<$Res> {
  _$OrganizationCopyWithImpl(this._value, this._then);

  final Organization _value;
  // ignore: unused_field
  final $Res Function(Organization) _then;

  @override
  $Res call({
    Object id = freezed,
    Object owners = freezed,
    Object users = freezed,
    Object defaltHolidays = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      owners: owners == freezed ? _value.owners : owners as List<User>,
      users: users == freezed ? _value.users : users as List<User>,
      defaltHolidays: defaltHolidays == freezed
          ? _value.defaltHolidays
          : defaltHolidays as List<Holiday>,
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
      @UserConverter()
          List<User> owners,
      @UserConverter()
          List<User> users,
      @JsonKey(name: 'default_holidays')
      @HolidayConverter()
          List<Holiday> defaltHolidays});
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
    Object owners = freezed,
    Object users = freezed,
    Object defaltHolidays = freezed,
  }) {
    return _then(_Organization(
      id: id == freezed ? _value.id : id as String,
      owners: owners == freezed ? _value.owners : owners as List<User>,
      users: users == freezed ? _value.users : users as List<User>,
      defaltHolidays: defaltHolidays == freezed
          ? _value.defaltHolidays
          : defaltHolidays as List<Holiday>,
    ));
  }
}

@JsonSerializable()
class _$_Organization with DiagnosticableTreeMixin implements _Organization {
  const _$_Organization(
      {this.id,
      @UserConverter()
          this.owners,
      @UserConverter()
          this.users,
      @JsonKey(name: 'default_holidays')
      @HolidayConverter()
          this.defaltHolidays});

  factory _$_Organization.fromJson(Map<String, dynamic> json) =>
      _$_$_OrganizationFromJson(json);

  @override
  final String id;
  @override
  @UserConverter()
  final List<User> owners;
  @override
  @UserConverter()
  final List<User> users;
  @override
  @JsonKey(name: 'default_holidays')
  @HolidayConverter()
  final List<Holiday> defaltHolidays;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Organization(id: $id, owners: $owners, users: $users, defaltHolidays: $defaltHolidays)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Organization'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('owners', owners))
      ..add(DiagnosticsProperty('users', users))
      ..add(DiagnosticsProperty('defaltHolidays', defaltHolidays));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Organization &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.owners, owners) ||
                const DeepCollectionEquality().equals(other.owners, owners)) &&
            (identical(other.users, users) ||
                const DeepCollectionEquality().equals(other.users, users)) &&
            (identical(other.defaltHolidays, defaltHolidays) ||
                const DeepCollectionEquality()
                    .equals(other.defaltHolidays, defaltHolidays)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(owners) ^
      const DeepCollectionEquality().hash(users) ^
      const DeepCollectionEquality().hash(defaltHolidays);

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
      @UserConverter()
          List<User> owners,
      @UserConverter()
          List<User> users,
      @JsonKey(name: 'default_holidays')
      @HolidayConverter()
          List<Holiday> defaltHolidays}) = _$_Organization;

  factory _Organization.fromJson(Map<String, dynamic> json) =
      _$_Organization.fromJson;

  @override
  String get id;
  @override
  @UserConverter()
  List<User> get owners;
  @override
  @UserConverter()
  List<User> get users;
  @override
  @JsonKey(name: 'default_holidays')
  @HolidayConverter()
  List<Holiday> get defaltHolidays;
  @override
  _$OrganizationCopyWith<_Organization> get copyWith;
}
