void main() {
  AuthState state = AuthState.authenticated;

  switch (state) {
    case AuthState.authenticated:
      throw UnimplementedError();
    case AuthState.unauthenticated:
      throw UnimplementedError();
    case AuthState.unknown:
      throw UnimplementedError();
  }
}

enum AuthState {
  authenticated,
  unauthenticated,
  unknown,
}