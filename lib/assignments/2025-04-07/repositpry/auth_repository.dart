import 'package:modu_3_dart_study/assignments/2025-04-07/core/result.dart';
import 'package:modu_3_dart_study/assignments/2025-04-07/model/user.dart';
import '../core/registration_error.dart';

abstract interface class AuthRepository {
  Future<Result<User, RegistrationError>> registerUser({
    required String email,
    required String password,
  });
}
