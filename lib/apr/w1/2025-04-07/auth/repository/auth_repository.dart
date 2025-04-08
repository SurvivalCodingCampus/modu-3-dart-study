import 'package:modu_3_dart_study/apr/w1/2025-04-07/auth/model/enum_auth.dart';

import '../core/result_auth.dart';
import '../model/user.dart';

abstract interface class AuthRepository {
  Future<Result<User, RegistrationError>> registerUser({
    required String email,
    required String password,
  });
}
