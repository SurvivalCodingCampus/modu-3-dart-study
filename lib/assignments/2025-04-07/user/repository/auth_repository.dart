import 'package:modu_3_dart_study/assignments/2025-04-07/user/core/result.dart';
import 'package:modu_3_dart_study/assignments/2025-04-07/user/model/user.dart';
import 'package:modu_3_dart_study/assignments/2025-04-07/user/util/registration_error_enum.dart';

abstract interface class AuthRepository {
  Future<Result<User, RegistrationError>> registerUser({
    required String email,
    required String password,
  });
}
