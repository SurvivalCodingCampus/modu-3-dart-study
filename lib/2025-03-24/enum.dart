void main() {
  AuthState state = AuthState.authenticated;

  switch (state) {
    case AuthState.authenticated:
      print('인증됨');
    case AuthState.unauthenticated:
      print('인증 안됨');
    case AuthState.unknown:
      print('모름');
    case AuthState.serverError:
      throw UnimplementedError();
  }
}

enum AuthState { authenticated, unauthenticated, unknown, serverError }
