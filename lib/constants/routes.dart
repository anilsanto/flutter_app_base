import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:game_app/pages/loign/login_page.dart';

class Routes {
  static final Router router = configureRoutes(Router());

  static Router configureRoutes(Router router) {
    router.define(
      '/',
      handler: Handler(
        handlerFunc: (BuildContext context, Map<String, dynamic> params) {
          return LoginPage();
        },
      ),
    );

    return router;
  }
}
