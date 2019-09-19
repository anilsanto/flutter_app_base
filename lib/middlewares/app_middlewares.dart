import 'package:redux/redux.dart';

import 'package:game_app/actions/login_actions.dart';
import 'package:game_app/models/app_state.dart';
import 'package:game_app/repository/repository.dart';
import '../MyApp.dart';
import '../navigation_action.dart';

List<Middleware<AppState>> createAppMiddleware() {
  Repository repository = Repository();
  final loginAction = _loginRequest(repository);

  return [
    TypedMiddleware<AppState, LogInAction>(loginAction),
    TypedMiddleware<AppState, NavigateReplaceAction>(_navigateReplace),
    TypedMiddleware<AppState, NavigatePushAction>(_navigate),
    TypedMiddleware<AppState, NavigatePopAction>(_navigatePop),
  ];
}

Middleware<AppState> _loginRequest(Repository repository) {
  return (Store<AppState> store, action, NextDispatcher next) async {
    Future.delayed(const Duration(milliseconds: 1000), () {
      store.dispatch(LoginSuccess(false));
      store.dispatch(NavigatePushAction('/home'));
    });
    next(action);
  };
}

Middleware<AppState> _navigateToLogin(Repository repository) {
  return (Store<AppState> store, action, NextDispatcher next) async {
    Future.delayed(const Duration(milliseconds: 1000), () {
      store.dispatch(LoginSuccess(false));
      // store.dispatch(NavigatePushAction('/home'));
    });
    next(action);
  };
}

Middleware<AppState> _navigateReplace(
    Store<AppState> store, action, NextDispatcher next) {
  final routeName = (action as NavigateReplaceAction).routeName;
  if (store.state.route.last != routeName) {
    navigatorKey.currentState.pushReplacementNamed(routeName);
  }
  next(action); //This need to be after name checks
}

Middleware<AppState> _navigate(
    Store<AppState> store, action, NextDispatcher next) {
  final routeName = (action as NavigatePushAction).routeName;
  if (store.state.route.last != routeName) {
    navigatorKey.currentState.pushNamed(routeName);
  }
  next(action); //This need to be after name checks
}

Middleware<AppState> _navigatePop(
    Store<AppState> store, action, NextDispatcher next) {
  navigatorKey.currentState.pop();
  next(action); //This need to be after name checks
}
