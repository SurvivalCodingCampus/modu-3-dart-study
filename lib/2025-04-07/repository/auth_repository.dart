import 'package:modu_3_dart_study/2025-04-07/model/user.dart';
import 'package:modu_3_dart_study/2025-04-07/core/result.dart';

abstract interface class AuthRepository {
  Future<Result<User, RegistrationError>> registerUser ({
    required String email,
    required String password,
  });
}