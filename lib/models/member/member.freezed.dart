// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'member.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
Member _$MemberFromJson(Map<String, dynamic> json) {
  return _Member.fromJson(json);
}

class _$MemberTearOff {
  const _$MemberTearOff();

  _Member call({double level, String role, @UserConverter() User user}) {
    return _Member(
      level: level,
      role: role,
      user: user,
    );
  }
}

// ignore: unused_element
const $Member = _$MemberTearOff();

mixin _$Member {
  double get level;
  String get role;
  @UserConverter()
  User get user;

  Map<String, dynamic> toJson();
  $MemberCopyWith<Member> get copyWith;
}

abstract class $MemberCopyWith<$Res> {
  factory $MemberCopyWith(Member value, $Res Function(Member) then) =
      _$MemberCopyWithImpl<$Res>;
  $Res call({double level, String role, @UserConverter() User user});

  $UserCopyWith<$Res> get user;
}

class _$MemberCopyWithImpl<$Res> implements $MemberCopyWith<$Res> {
  _$MemberCopyWithImpl(this._value, this._then);

  final Member _value;
  // ignore: unused_field
  final $Res Function(Member) _then;

  @override
  $Res call({
    Object level = freezed,
    Object role = freezed,
    Object user = freezed,
  }) {
    return _then(_value.copyWith(
      level: level == freezed ? _value.level : level as double,
      role: role == freezed ? _value.role : role as String,
      user: user == freezed ? _value.user : user as User,
    ));
  }

  @override
  $UserCopyWith<$Res> get user {
    if (_value.user == null) {
      return null;
    }
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

abstract class _$MemberCopyWith<$Res> implements $MemberCopyWith<$Res> {
  factory _$MemberCopyWith(_Member value, $Res Function(_Member) then) =
      __$MemberCopyWithImpl<$Res>;
  @override
  $Res call({double level, String role, @UserConverter() User user});

  @override
  $UserCopyWith<$Res> get user;
}

class __$MemberCopyWithImpl<$Res> extends _$MemberCopyWithImpl<$Res>
    implements _$MemberCopyWith<$Res> {
  __$MemberCopyWithImpl(_Member _value, $Res Function(_Member) _then)
      : super(_value, (v) => _then(v as _Member));

  @override
  _Member get _value => super._value as _Member;

  @override
  $Res call({
    Object level = freezed,
    Object role = freezed,
    Object user = freezed,
  }) {
    return _then(_Member(
      level: level == freezed ? _value.level : level as double,
      role: role == freezed ? _value.role : role as String,
      user: user == freezed ? _value.user : user as User,
    ));
  }
}

@JsonSerializable()
class _$_Member with DiagnosticableTreeMixin implements _Member {
  const _$_Member({this.level, this.role, @UserConverter() this.user});

  factory _$_Member.fromJson(Map<String, dynamic> json) =>
      _$_$_MemberFromJson(json);

  @override
  final double level;
  @override
  final String role;
  @override
  @UserConverter()
  final User user;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Member(level: $level, role: $role, user: $user)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Member'))
      ..add(DiagnosticsProperty('level', level))
      ..add(DiagnosticsProperty('role', role))
      ..add(DiagnosticsProperty('user', user));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Member &&
            (identical(other.level, level) ||
                const DeepCollectionEquality().equals(other.level, level)) &&
            (identical(other.role, role) ||
                const DeepCollectionEquality().equals(other.role, role)) &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(level) ^
      const DeepCollectionEquality().hash(role) ^
      const DeepCollectionEquality().hash(user);

  @override
  _$MemberCopyWith<_Member> get copyWith =>
      __$MemberCopyWithImpl<_Member>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_MemberToJson(this);
  }
}

abstract class _Member implements Member {
  const factory _Member(
      {double level, String role, @UserConverter() User user}) = _$_Member;

  factory _Member.fromJson(Map<String, dynamic> json) = _$_Member.fromJson;

  @override
  double get level;
  @override
  String get role;
  @override
  @UserConverter()
  User get user;
  @override
  _$MemberCopyWith<_Member> get copyWith;
}
