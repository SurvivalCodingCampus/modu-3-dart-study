import 'package:modu_3_dart_study/assignments/2025-04-05/core/result.dart';
import 'package:modu_3_dart_study/assignments/2025-04-05/model/user.dart';
import 'package:modu_3_dart_study/assignments/2025-04-05/util/registration_error_enum.dart';

abstract interface class AuthRepository {
  Future<Result<User, RegistrationError>> registerUser({
    required String email,
    required String password,
  });
}
