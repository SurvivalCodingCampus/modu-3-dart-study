import 'package:modu_3_dart_study/2025-04-07/exam01/core/registration_error.dart';
import 'package:modu_3_dart_study/2025-04-07/exam01/core/result.dart';
import 'package:modu_3_dart_study/2025-04-07/exam01/model/user.dart';

abstract interface class AuthRepository {
  Future<Result<User, RegistrationError>> registerUser({
    required String email,
    required String password,
  });
}
