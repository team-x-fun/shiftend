import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shiftend/models/models.dart';
part 'login_state.freezed.dart';

@freezed
abstract class LoginState with _$LoginState {
  const factory LoginState({
    @Default(false) bool isLogin,
    User currentUser,
    @Default(<Organization>[]) List<Organization> orgs,
    @Default(Organization()) Organization selectedOrg,
  }) = _LoginState;
}
