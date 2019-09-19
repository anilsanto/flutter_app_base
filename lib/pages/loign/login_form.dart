


import 'package:flutter/material.dart';
import 'package:game_app/constants/app_constants.dart';
import 'package:game_app/containers/loader/loading.dart';

import 'login_view_model.dart';

class LoginForm extends StatelessWidget {
  final LoginViewModel viewModel;

  final formKey = GlobalKey<FormState>();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginForm({this.viewModel}) {
    _usernameController.text = this.viewModel.email;
    _passwordController.text = this.viewModel.password;
  }

  final FocusNode _usernameNode = FocusNode();
  final FocusNode _passwordNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return LoadingScreen(
      inAsyncCall: viewModel.showLoader,
      child: Center(
        child: Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          child: Form(
            key: formKey,
            autovalidate: false,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _usernameField(context),
                SizedBox(
                  height: 30,
                ),
                _passwordField(context),
                SizedBox(
                  height: 50.0,
                ),
                _signInButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextFormField _usernameField(BuildContext context) {
    return TextFormField(
      controller: _usernameController,
      style: Theme.of(context).textTheme.caption,
      textInputAction: TextInputAction.next,
      focusNode: _usernameNode,
      decoration: _textfieldDecoration(
        context,
        viewModel.usernamePlaceholder,
        viewModel.usernameIcon,
      ),
      validator: (value) {
        return viewModel.validator(TextFieldType.email, value);
      },
      onSaved: (value) {
        viewModel.saveEmail(value);
      },
      onFieldSubmitted: (value) {
        return _fieldFocusChange(context, _usernameNode, _passwordNode);
      },
    );
  }

  TextFormField _passwordField(BuildContext context) {
    return TextFormField(
      controller: _passwordController,
      obscureText: true,
      style: Theme.of(context).textTheme.caption,
      textInputAction: TextInputAction.done,
      focusNode: _passwordNode,
      decoration: _textfieldDecoration(
        context,
        viewModel.passwordPlaceholder,
        viewModel.passwordIcon,
      ),
      validator: (value) {
        return viewModel.validator(TextFieldType.password, value);
      },
      onSaved: (value) {
        viewModel.savePassword(value);
      },
      onFieldSubmitted: (value) {
        _fieldFocusChange(context, _passwordNode, null);
      },
    );
  }

  RaisedButton _signInButton(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          viewModel.attemptLogin();
        }
      },
      child: Container(
        width: 200.0,
        height: 45.0,
        child: Center(
          child: Text(
            viewModel.loginButtonText,
            style: Theme.of(context).textTheme.button,
          ),
        ),
      ),
    );
  }

  InputDecoration _textfieldDecoration(
      BuildContext context, String hint, IconData icon) {
    return InputDecoration(
      suffixIcon: Icon(
        icon,
        color: Theme.of(context).dividerColor,
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Theme.of(context).dividerColor),
      ),
      disabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Theme.of(context).dividerColor),
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Theme.of(context).dividerColor),
      ),
      border: UnderlineInputBorder(
        borderSide: BorderSide(color: Theme.of(context).dividerColor),
      ),
      hintText: hint,
      hintStyle: Theme.of(context).textTheme.caption,
      contentPadding: const EdgeInsets.only(
          top: 20.0, right: 30.0, bottom: 10.0, left: 5.0),
    );
  }

  void _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    if (currentFocus != null) {
      currentFocus.unfocus();
    }
    if (nextFocus != null) {
      FocusScope.of(context).requestFocus(nextFocus);
    }
  }

}
