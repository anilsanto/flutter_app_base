import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:game_app/constants/routes.dart';
import 'package:game_app/constants/string.dart';
import 'package:game_app/middlewares/app_middlewares.dart';
import 'package:game_app/models/app_state.dart';
import 'package:game_app/pages/loign/login_page.dart';
import 'package:game_app/reducers/app_reducer.dart';
import 'package:redux/redux.dart';

final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

class MyApp {
  static Widget launchApp() {
    final store = Store<AppState>(
      appReducer,
      initialState: AppState(),
      middleware: createAppMiddleware(),
    );

    return StoreProvider(
      store: store,
      child: MaterialApp(
        navigatorKey: navigatorKey,
        onGenerateRoute: Routes.router.generator,
        title: AppString.getText('app_title'),
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.blue,
          accentColor: Colors.blue,
          primarySwatch: Colors.blue,
          dividerColor: Colors.grey,
          hintColor: Colors.grey,
          buttonColor: const Color.fromRGBO(247, 64, 106, 1.0),
          textTheme: setThemeDate(),
        ),
        home: LoginPage(),
      ),
    );
  }

  static TextTheme setThemeDate() {
    return TextTheme(
      headline: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 25.0,
        color: Colors.white,
      ),
      title: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
      button: TextStyle(
        fontStyle: FontStyle.normal,
        fontSize: 18.0,
        color: Colors.white,
      ),
      caption: TextStyle(
        color: Colors.black,
        fontSize: 15.0,
        fontStyle: FontStyle.normal,
      ),
      overline: TextStyle(
        color: Colors.black,
        fontSize: 10.0,
        fontStyle: FontStyle.italic,
      ),
      subtitle: TextStyle(
        color: Colors.black,
        fontSize: 15.0,
        fontStyle: FontStyle.normal,
      ),
      subhead: TextStyle(
        color: Colors.black,
        fontSize: 15.0,
        fontStyle: FontStyle.normal,
      ),
    );
  }
}
