import 'package:modu_3_dart_study/2025-04-07/repository/auth_repository_impl.dart';

import '../../2025-04-07/model/user.dart';
import '../core/result.dart';

abstract interface class AuthRepository {

  Future<Result<User, RegistrationError>> registerUser({
    required String email,
    required String password,
  });
}

enum RegistrationError{
  invalidEmail,
  weakPassword,
  networkError,
}
