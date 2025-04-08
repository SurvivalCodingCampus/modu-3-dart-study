import 'package:modu_3_dart_study/PR2025-04-07/core/result_auth.dart';
import 'package:modu_3_dart_study/PR2025-04-07/model/user.dart';

import '../enum/registration_error.dart';

//성공하면 User클래스 반환, 실패시 RegistrationError enum타입 반환
abstract interface class AuthRepository {
  Future<ResultAuth<User, RegistrationError>> registerUser({
    required String email,
    required String password,
  });
}
