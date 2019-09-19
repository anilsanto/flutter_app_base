import 'package:game_app/actions/login_actions.dart';

String saveEmail(String state, action) {
  return action is SaveEmail ? action.email : null;
}

String savePassword(String state, action) {
  return action is SavePassword ? action.password : null;
}
