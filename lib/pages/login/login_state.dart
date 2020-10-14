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
    // TODO: streamに完全対応できたら削除
    @Default(Organization()) Organization selectedOrg,
    @Default(null) @nullable Stream<Organization> selectedOrgStream,
  }) = _LoginState;
}
