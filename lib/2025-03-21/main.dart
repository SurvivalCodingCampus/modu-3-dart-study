// class Pocket {
//   Object? _data;
//
//   void put(Object data_source) {
//     _data = data_source;
//
//     Object? get() {
//       return _data;
//     }
//   }
// }

enum AuthState {
  authenticated,
  unAuthenticated,
  unKnown,

}

// ...

AuthState authState = AuthState.unKnown;

switch (authState) {
  case AuthState.authenticated;
    print('authenticated');
  case AuthState.unAuthenticated;
    print('unAuthenticated');
  case AuthState.unKnown;
    print('unK');
}


