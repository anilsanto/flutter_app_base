class SaveEmail {
  final String email;
  SaveEmail(this.email);
}

class SavePassword {
  final String password;
  SavePassword(this.password);
}

class LogInAction {
  final String email;
  final String password;
  final bool isLoading;

  LogInAction(
    this.email,
    this.password,
    this.isLoading,
  );
}

class LoginSuccess {
  final bool isLoading;
  LoginSuccess(this.isLoading);
}

class LoginFail {
  final bool isLoading;
  LoginFail(this.isLoading);
}

class ClearLogin {}