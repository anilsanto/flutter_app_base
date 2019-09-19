import 'package:game_app/actions/loading_action.dart';
import 'package:game_app/actions/login_actions.dart';
import 'package:redux/redux.dart';

final loadingReducer = combineReducers<bool>([
  TypedReducer<bool, LogInAction>(_setLoaded),
  TypedReducer<bool, StartLoading>(_setLoaded),
  TypedReducer<bool, StopLoading>(_setLoaded),
  TypedReducer<bool, LoginSuccess>(_setLoaded),
  TypedReducer<bool, LoginFail>(_setLoaded),
]);

bool _setLoaded(bool state, action) {
  return action.isLoading ?? false;
}
