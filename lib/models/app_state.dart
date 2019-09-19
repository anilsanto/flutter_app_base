class AppState {
  final bool isLoading;
  final String typedEmail;
  final String typedPassword;

  final List<String> route;

  AppState({
    this.isLoading = false,
    this.typedEmail = '',
    this.typedPassword = '',
    this.route = const ['/'],
  });

  AppState copyWith({
    bool isLoading,
    String typedEmail,
    String typedPassword,
    List<String> route,
  }) {
    return new AppState(
      isLoading: isLoading ?? this.isLoading,
      typedEmail: typedEmail ?? this.typedEmail,
      typedPassword: typedPassword ?? this.typedPassword,
      route: route ?? this.route,
    );
  }

  @override
  String toString() {
    return 'AppState';
  }
}
