// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'shiftend_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
ShiftendUser _$ShiftendUserFromJson(Map<String, dynamic> json) {
  return _ShiftendUser.fromJson(json);
}

class _$ShiftendUserTearOff {
  const _$ShiftendUserTearOff();

  _ShiftendUser call(
      {String id,
      String email,
      String name,
      String role,
      String level,
      @JsonKey(name: 'icon_url') String iconUrl}) {
    return _ShiftendUser(
      id: id,
      email: email,
      name: name,
      role: role,
      level: level,
      iconUrl: iconUrl,
    );
  }
}

// ignore: unused_element
const $ShiftendUser = _$ShiftendUserTearOff();

mixin _$ShiftendUser {
  String get id;
  String get email;
  String get name;
  String get role;
  String get level;
  @JsonKey(name: 'icon_url')
  String get iconUrl;

  Map<String, dynamic> toJson();
  $ShiftendUserCopyWith<ShiftendUser> get copyWith;
}

abstract class $ShiftendUserCopyWith<$Res> {
  factory $ShiftendUserCopyWith(
          ShiftendUser value, $Res Function(ShiftendUser) then) =
      _$ShiftendUserCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String email,
      String name,
      String role,
      String level,
      @JsonKey(name: 'icon_url') String iconUrl});
}

class _$ShiftendUserCopyWithImpl<$Res> implements $ShiftendUserCopyWith<$Res> {
  _$ShiftendUserCopyWithImpl(this._value, this._then);

  final ShiftendUser _value;
  // ignore: unused_field
  final $Res Function(ShiftendUser) _then;

  @override
  $Res call({
    Object id = freezed,
    Object email = freezed,
    Object name = freezed,
    Object role = freezed,
    Object level = freezed,
    Object iconUrl = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      email: email == freezed ? _value.email : email as String,
      name: name == freezed ? _value.name : name as String,
      role: role == freezed ? _value.role : role as String,
      level: level == freezed ? _value.level : level as String,
      iconUrl: iconUrl == freezed ? _value.iconUrl : iconUrl as String,
    ));
  }
}

abstract class _$ShiftendUserCopyWith<$Res>
    implements $ShiftendUserCopyWith<$Res> {
  factory _$ShiftendUserCopyWith(
          _ShiftendUser value, $Res Function(_ShiftendUser) then) =
      __$ShiftendUserCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String email,
      String name,
      String role,
      String level,
      @JsonKey(name: 'icon_url') String iconUrl});
}

class __$ShiftendUserCopyWithImpl<$Res> extends _$ShiftendUserCopyWithImpl<$Res>
    implements _$ShiftendUserCopyWith<$Res> {
  __$ShiftendUserCopyWithImpl(
      _ShiftendUser _value, $Res Function(_ShiftendUser) _then)
      : super(_value, (v) => _then(v as _ShiftendUser));

  @override
  _ShiftendUser get _value => super._value as _ShiftendUser;

  @override
  $Res call({
    Object id = freezed,
    Object email = freezed,
    Object name = freezed,
    Object role = freezed,
    Object level = freezed,
    Object iconUrl = freezed,
  }) {
    return _then(_ShiftendUser(
      id: id == freezed ? _value.id : id as String,
      email: email == freezed ? _value.email : email as String,
      name: name == freezed ? _value.name : name as String,
      role: role == freezed ? _value.role : role as String,
      level: level == freezed ? _value.level : level as String,
      iconUrl: iconUrl == freezed ? _value.iconUrl : iconUrl as String,
    ));
  }
}

@JsonSerializable()
class _$_ShiftendUser with DiagnosticableTreeMixin implements _ShiftendUser {
  const _$_ShiftendUser(
      {this.id,
      this.email,
      this.name,
      this.role,
      this.level,
      @JsonKey(name: 'icon_url') this.iconUrl});

  factory _$_ShiftendUser.fromJson(Map<String, dynamic> json) =>
      _$_$_ShiftendUserFromJson(json);

  @override
  final String id;
  @override
  final String email;
  @override
  final String name;
  @override
  final String role;
  @override
  final String level;
  @override
  @JsonKey(name: 'icon_url')
  final String iconUrl;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ShiftendUser(id: $id, email: $email, name: $name, role: $role, level: $level, iconUrl: $iconUrl)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ShiftendUser'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('role', role))
      ..add(DiagnosticsProperty('level', level))
      ..add(DiagnosticsProperty('iconUrl', iconUrl));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ShiftendUser &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.role, role) ||
                const DeepCollectionEquality().equals(other.role, role)) &&
            (identical(other.level, level) ||
                const DeepCollectionEquality().equals(other.level, level)) &&
            (identical(other.iconUrl, iconUrl) ||
                const DeepCollectionEquality().equals(other.iconUrl, iconUrl)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(role) ^
      const DeepCollectionEquality().hash(level) ^
      const DeepCollectionEquality().hash(iconUrl);

  @override
  _$ShiftendUserCopyWith<_ShiftendUser> get copyWith =>
      __$ShiftendUserCopyWithImpl<_ShiftendUser>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ShiftendUserToJson(this);
  }
}

abstract class _ShiftendUser implements ShiftendUser {
  const factory _ShiftendUser(
      {String id,
      String email,
      String name,
      String role,
      String level,
      @JsonKey(name: 'icon_url') String iconUrl}) = _$_ShiftendUser;

  factory _ShiftendUser.fromJson(Map<String, dynamic> json) =
      _$_ShiftendUser.fromJson;

  @override
  String get id;
  @override
  String get email;
  @override
  String get name;
  @override
  String get role;
  @override
  String get level;
  @override
  @JsonKey(name: 'icon_url')
  String get iconUrl;
  @override
  _$ShiftendUserCopyWith<_ShiftendUser> get copyWith;
}
