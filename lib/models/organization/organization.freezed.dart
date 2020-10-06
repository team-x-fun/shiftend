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
      @JsonKey(name: 'owners')
          List<User> owners = const <User>[],
      @MemberConverter()
      @JsonKey(name: 'members')
          List<Member> members = const <Member>[],
      @JsonKey(name: 'default_holidays')
      @HolidayConverter()
          List<Holiday> defaultHolidays = const <Holiday>[],
      @JsonKey(name: 'default_personnel')
      @PersonnelConverter()
          Personnel defaultPersonnel = const Personnel()}) {
    return _Organization(
      id: id,
      owners: owners,
      members: members,
      defaultHolidays: defaultHolidays,
      defaultPersonnel: defaultPersonnel,
    );
  }
}

// ignore: unused_element
const $Organization = _$OrganizationTearOff();

mixin _$Organization {
  String get id;
  @UserConverter()
  @JsonKey(name: 'owners')
  List<User> get owners;
  @MemberConverter()
  @JsonKey(name: 'members')
  List<Member> get members;
  @JsonKey(name: 'default_holidays')
  @HolidayConverter()
  List<Holiday> get defaultHolidays;
  @JsonKey(name: 'default_personnel')
  @PersonnelConverter()
  Personnel get defaultPersonnel;

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
      @JsonKey(name: 'owners')
          List<User> owners,
      @MemberConverter()
      @JsonKey(name: 'members')
          List<Member> members,
      @JsonKey(name: 'default_holidays')
      @HolidayConverter()
          List<Holiday> defaultHolidays,
      @JsonKey(name: 'default_personnel')
      @PersonnelConverter()
          Personnel defaultPersonnel});

  $PersonnelCopyWith<$Res> get defaultPersonnel;
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
    Object members = freezed,
    Object defaultHolidays = freezed,
    Object defaultPersonnel = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      owners: owners == freezed ? _value.owners : owners as List<User>,
      members: members == freezed ? _value.members : members as List<Member>,
      defaultHolidays: defaultHolidays == freezed
          ? _value.defaultHolidays
          : defaultHolidays as List<Holiday>,
      defaultPersonnel: defaultPersonnel == freezed
          ? _value.defaultPersonnel
          : defaultPersonnel as Personnel,
    ));
  }

  @override
  $PersonnelCopyWith<$Res> get defaultPersonnel {
    if (_value.defaultPersonnel == null) {
      return null;
    }
    return $PersonnelCopyWith<$Res>(_value.defaultPersonnel, (value) {
      return _then(_value.copyWith(defaultPersonnel: value));
    });
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
      @JsonKey(name: 'owners')
          List<User> owners,
      @MemberConverter()
      @JsonKey(name: 'members')
          List<Member> members,
      @JsonKey(name: 'default_holidays')
      @HolidayConverter()
          List<Holiday> defaultHolidays,
      @JsonKey(name: 'default_personnel')
      @PersonnelConverter()
          Personnel defaultPersonnel});

  @override
  $PersonnelCopyWith<$Res> get defaultPersonnel;
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
    Object members = freezed,
    Object defaultHolidays = freezed,
    Object defaultPersonnel = freezed,
  }) {
    return _then(_Organization(
      id: id == freezed ? _value.id : id as String,
      owners: owners == freezed ? _value.owners : owners as List<User>,
      members: members == freezed ? _value.members : members as List<Member>,
      defaultHolidays: defaultHolidays == freezed
          ? _value.defaultHolidays
          : defaultHolidays as List<Holiday>,
      defaultPersonnel: defaultPersonnel == freezed
          ? _value.defaultPersonnel
          : defaultPersonnel as Personnel,
    ));
  }
}

@JsonSerializable()
class _$_Organization with DiagnosticableTreeMixin implements _Organization {
  const _$_Organization(
      {this.id,
      @UserConverter()
      @JsonKey(name: 'owners')
          this.owners = const <User>[],
      @MemberConverter()
      @JsonKey(name: 'members')
          this.members = const <Member>[],
      @JsonKey(name: 'default_holidays')
      @HolidayConverter()
          this.defaultHolidays = const <Holiday>[],
      @JsonKey(name: 'default_personnel')
      @PersonnelConverter()
          this.defaultPersonnel = const Personnel()})
      : assert(owners != null),
        assert(members != null),
        assert(defaultHolidays != null),
        assert(defaultPersonnel != null);

  factory _$_Organization.fromJson(Map<String, dynamic> json) =>
      _$_$_OrganizationFromJson(json);

  @override
  final String id;
  @override
  @UserConverter()
  @JsonKey(name: 'owners')
  final List<User> owners;
  @override
  @MemberConverter()
  @JsonKey(name: 'members')
  final List<Member> members;
  @override
  @JsonKey(name: 'default_holidays')
  @HolidayConverter()
  final List<Holiday> defaultHolidays;
  @override
  @JsonKey(name: 'default_personnel')
  @PersonnelConverter()
  final Personnel defaultPersonnel;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Organization(id: $id, owners: $owners, members: $members, defaultHolidays: $defaultHolidays, defaultPersonnel: $defaultPersonnel)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Organization'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('owners', owners))
      ..add(DiagnosticsProperty('members', members))
      ..add(DiagnosticsProperty('defaultHolidays', defaultHolidays))
      ..add(DiagnosticsProperty('defaultPersonnel', defaultPersonnel));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Organization &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.owners, owners) ||
                const DeepCollectionEquality().equals(other.owners, owners)) &&
            (identical(other.members, members) ||
                const DeepCollectionEquality()
                    .equals(other.members, members)) &&
            (identical(other.defaultHolidays, defaultHolidays) ||
                const DeepCollectionEquality()
                    .equals(other.defaultHolidays, defaultHolidays)) &&
            (identical(other.defaultPersonnel, defaultPersonnel) ||
                const DeepCollectionEquality()
                    .equals(other.defaultPersonnel, defaultPersonnel)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(owners) ^
      const DeepCollectionEquality().hash(members) ^
      const DeepCollectionEquality().hash(defaultHolidays) ^
      const DeepCollectionEquality().hash(defaultPersonnel);

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
      @JsonKey(name: 'owners')
          List<User> owners,
      @MemberConverter()
      @JsonKey(name: 'members')
          List<Member> members,
      @JsonKey(name: 'default_holidays')
      @HolidayConverter()
          List<Holiday> defaultHolidays,
      @JsonKey(name: 'default_personnel')
      @PersonnelConverter()
          Personnel defaultPersonnel}) = _$_Organization;

  factory _Organization.fromJson(Map<String, dynamic> json) =
      _$_Organization.fromJson;

  @override
  String get id;
  @override
  @UserConverter()
  @JsonKey(name: 'owners')
  List<User> get owners;
  @override
  @MemberConverter()
  @JsonKey(name: 'members')
  List<Member> get members;
  @override
  @JsonKey(name: 'default_holidays')
  @HolidayConverter()
  List<Holiday> get defaultHolidays;
  @override
  @JsonKey(name: 'default_personnel')
  @PersonnelConverter()
  Personnel get defaultPersonnel;
  @override
  _$OrganizationCopyWith<_Organization> get copyWith;
}
