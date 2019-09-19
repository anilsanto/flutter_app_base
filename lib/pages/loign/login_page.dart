import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:game_app/pages/loign/login_form.dart';
import 'package:redux/redux.dart';

import 'package:game_app/models/app_state.dart';
import 'package:game_app/pages/loign/login_view_model.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: StoreConnector<AppState, LoginViewModel>(
          converter: (Store<AppState> store) => LoginViewModel.create(store),
          builder: (BuildContext context, LoginViewModel viewModel) =>
              Container(
                  child: LoginForm(
                viewModel: viewModel,
              )),
        ),
      ),
    );
  }
}
