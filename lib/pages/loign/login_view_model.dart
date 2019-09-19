import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

import 'package:game_app/models/app_state.dart';
import 'package:game_app/actions/login_actions.dart';
import 'package:game_app/constants/app_constants.dart';
import 'package:game_app/constants/string.dart';

class LoginViewModel {
  String usernamePlaceholder;
  String passwordPlaceholder;
  String loginButtonText;
  final IconData usernameIcon;
  final IconData passwordIcon;
  final bool showLoader;
  final String email;
  final String password;
  final Function saveEmail;
  final Function savePassword;
  final Function attemptLogin;

  LoginViewModel({
    this.email,
    this.password,
    this.usernameIcon,
    this.passwordIcon,
    this.showLoader,
    this.saveEmail,
    this.savePassword,
    this.attemptLogin,
  }) {
    this.usernamePlaceholder = AppString.getText('login');
    this.passwordPlaceholder = AppString.getText('password');
    this.loginButtonText = AppString.getText('sign_in');
  }

  factory LoginViewModel.create(Store<AppState> store) {
    return LoginViewModel(
      usernameIcon: Icons.person_outline,
      passwordIcon: Icons.lock_outline,
      showLoader: store.state.isLoading,
      email: store.state.typedEmail,
      password: store.state.typedPassword,
      saveEmail: (val) {
        store.dispatch(SaveEmail(val));
      },
      savePassword: (val) {
        store.dispatch(SavePassword(val));
      },
      attemptLogin: () {
        store.dispatch(LogInAction(
          store.state.typedEmail,
          store.state.typedPassword,
          true,
        ));
      },
    );
  }

  String validator(TextFieldType type, String value) {
    RegExp regExp = new RegExp(type.regEx);
    switch (type) {
      case TextFieldType.email:
        {
          if (value.isEmpty) {
            return AppString.getText('field_empty_email');
          } else if (!regExp.hasMatch(value.trim())) {
            return AppString.getText('invalid_text');
          }
        }
        break;
      case TextFieldType.password:
        {
          if (value.isEmpty) {
            return AppString.getText('field_empty_password');
          } else if (!regExp.hasMatch(value.trim())) {
            return AppString.getText('invalid_text');
          }
        }
        break;
    }
    return null;
  }
}
