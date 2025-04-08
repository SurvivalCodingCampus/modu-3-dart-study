import '../../core/25-04-07/registration_error.dart';
import '../../core/25-04-07/user_result.dart';
import '../../model/25-04-07/user.dart';

abstract interface class AuthRepository {
  // 성공 시 user 리턴 실패시 registrationError 리턴
  Future<Result<User, RegistrationError>> registerUser({
    required String email,
    required String password,
  });
}
