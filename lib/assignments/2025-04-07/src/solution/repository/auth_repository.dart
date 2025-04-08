import 'package:modu_3_dart_study/assignments/2025-04-07/src/solution/core/result.dart';
import 'package:modu_3_dart_study/assignments/2025-04-07/src/solution/enum/registration_error.dart';
import 'package:modu_3_dart_study/assignments/2025-04-07/src/solution/model/user.dart';

abstract interface class AuthRepository {
  Future<Result<User, RegistrationError>> registerUser({
    required String email,
    required String password,
  });
}
