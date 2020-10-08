// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'login_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$LoginStateTearOff {
  const _$LoginStateTearOff();

// ignore: unused_element
  _LoginState call(
      {bool isLogin = false,
      User currentUser,
      List<Organization> orgs = const <Organization>[],
      Organization selectedOrg = const Organization()}) {
    return _LoginState(
      isLogin: isLogin,
      currentUser: currentUser,
      orgs: orgs,
      selectedOrg: selectedOrg,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $LoginState = _$LoginStateTearOff();

/// @nodoc
mixin _$LoginState {
  bool get isLogin;
  User get currentUser;
  List<Organization> get orgs;
  Organization get selectedOrg;

  $LoginStateCopyWith<LoginState> get copyWith;
}

/// @nodoc
abstract class $LoginStateCopyWith<$Res> {
  factory $LoginStateCopyWith(
          LoginState value, $Res Function(LoginState) then) =
      _$LoginStateCopyWithImpl<$Res>;
  $Res call(
      {bool isLogin,
      User currentUser,
      List<Organization> orgs,
      Organization selectedOrg});

  $UserCopyWith<$Res> get currentUser;
  $OrganizationCopyWith<$Res> get selectedOrg;
}

/// @nodoc
class _$LoginStateCopyWithImpl<$Res> implements $LoginStateCopyWith<$Res> {
  _$LoginStateCopyWithImpl(this._value, this._then);

  final LoginState _value;
  // ignore: unused_field
  final $Res Function(LoginState) _then;

  @override
  $Res call({
    Object isLogin = freezed,
    Object currentUser = freezed,
    Object orgs = freezed,
    Object selectedOrg = freezed,
  }) {
    return _then(_value.copyWith(
      isLogin: isLogin == freezed ? _value.isLogin : isLogin as bool,
      currentUser:
          currentUser == freezed ? _value.currentUser : currentUser as User,
      orgs: orgs == freezed ? _value.orgs : orgs as List<Organization>,
      selectedOrg: selectedOrg == freezed
          ? _value.selectedOrg
          : selectedOrg as Organization,
    ));
  }

  @override
  $UserCopyWith<$Res> get currentUser {
    if (_value.currentUser == null) {
      return null;
    }
    return $UserCopyWith<$Res>(_value.currentUser, (value) {
      return _then(_value.copyWith(currentUser: value));
    });
  }

  @override
  $OrganizationCopyWith<$Res> get selectedOrg {
    if (_value.selectedOrg == null) {
      return null;
    }
    return $OrganizationCopyWith<$Res>(_value.selectedOrg, (value) {
      return _then(_value.copyWith(selectedOrg: value));
    });
  }
}

/// @nodoc
abstract class _$LoginStateCopyWith<$Res> implements $LoginStateCopyWith<$Res> {
  factory _$LoginStateCopyWith(
          _LoginState value, $Res Function(_LoginState) then) =
      __$LoginStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isLogin,
      User currentUser,
      List<Organization> orgs,
      Organization selectedOrg});

  @override
  $UserCopyWith<$Res> get currentUser;
  @override
  $OrganizationCopyWith<$Res> get selectedOrg;
}

/// @nodoc
class __$LoginStateCopyWithImpl<$Res> extends _$LoginStateCopyWithImpl<$Res>
    implements _$LoginStateCopyWith<$Res> {
  __$LoginStateCopyWithImpl(
      _LoginState _value, $Res Function(_LoginState) _then)
      : super(_value, (v) => _then(v as _LoginState));

  @override
  _LoginState get _value => super._value as _LoginState;

  @override
  $Res call({
    Object isLogin = freezed,
    Object currentUser = freezed,
    Object orgs = freezed,
    Object selectedOrg = freezed,
  }) {
    return _then(_LoginState(
      isLogin: isLogin == freezed ? _value.isLogin : isLogin as bool,
      currentUser:
          currentUser == freezed ? _value.currentUser : currentUser as User,
      orgs: orgs == freezed ? _value.orgs : orgs as List<Organization>,
      selectedOrg: selectedOrg == freezed
          ? _value.selectedOrg
          : selectedOrg as Organization,
    ));
  }
}

/// @nodoc
class _$_LoginState with DiagnosticableTreeMixin implements _LoginState {
  const _$_LoginState(
      {this.isLogin = false,
      this.currentUser,
      this.orgs = const <Organization>[],
      this.selectedOrg = const Organization()})
      : assert(isLogin != null),
        assert(orgs != null),
        assert(selectedOrg != null);

  @JsonKey(defaultValue: false)
  @override
  final bool isLogin;
  @override
  final User currentUser;
  @JsonKey(defaultValue: const <Organization>[])
  @override
  final List<Organization> orgs;
  @JsonKey(defaultValue: const Organization())
  @override
  final Organization selectedOrg;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LoginState(isLogin: $isLogin, currentUser: $currentUser, orgs: $orgs, selectedOrg: $selectedOrg)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LoginState'))
      ..add(DiagnosticsProperty('isLogin', isLogin))
      ..add(DiagnosticsProperty('currentUser', currentUser))
      ..add(DiagnosticsProperty('orgs', orgs))
      ..add(DiagnosticsProperty('selectedOrg', selectedOrg));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LoginState &&
            (identical(other.isLogin, isLogin) ||
                const DeepCollectionEquality()
                    .equals(other.isLogin, isLogin)) &&
            (identical(other.currentUser, currentUser) ||
                const DeepCollectionEquality()
                    .equals(other.currentUser, currentUser)) &&
            (identical(other.orgs, orgs) ||
                const DeepCollectionEquality().equals(other.orgs, orgs)) &&
            (identical(other.selectedOrg, selectedOrg) ||
                const DeepCollectionEquality()
                    .equals(other.selectedOrg, selectedOrg)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(isLogin) ^
      const DeepCollectionEquality().hash(currentUser) ^
      const DeepCollectionEquality().hash(orgs) ^
      const DeepCollectionEquality().hash(selectedOrg);

  @override
  _$LoginStateCopyWith<_LoginState> get copyWith =>
      __$LoginStateCopyWithImpl<_LoginState>(this, _$identity);
}

abstract class _LoginState implements LoginState {
  const factory _LoginState(
      {bool isLogin,
      User currentUser,
      List<Organization> orgs,
      Organization selectedOrg}) = _$_LoginState;

  @override
  bool get isLogin;
  @override
  User get currentUser;
  @override
  List<Organization> get orgs;
  @override
  Organization get selectedOrg;
  @override
  _$LoginStateCopyWith<_LoginState> get copyWith;
}
