import 'package:game_app/models/app_state.dart';
import 'package:game_app/reducers/loading_reducer.dart';
import 'package:game_app/reducers/login_reducer.dart';
import 'package:game_app/reducers/navigation_reducer.dart';

AppState appReducer(AppState state, action) {
  return state.copyWith(
    isLoading: loadingReducer(state.isLoading, action),
    typedEmail: saveEmail(state.typedEmail, action),
    typedPassword: savePassword(state.typedPassword, action),
    route: navigationReducer(state.route, action),
  );
}
