import 'package:modu_3_dart_study/assignments/2025-04-/2025-04-07/auth/model/user.dart';
import 'package:modu_3_dart_study/assignments/2025-04-/2025-04-07/core/modules/exception/custom_exception.dart';
import 'package:modu_3_dart_study/assignments/2025-04-/2025-04-07/core/modules/error_handling/result.dart';

abstract interface class AuthRepository {
  Future<Result<User, RegistrationError>> registerUser({
    required String email,
    required String password,
  });
}