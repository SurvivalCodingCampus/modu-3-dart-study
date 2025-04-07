import '../core/result_auth.dart';
import '../enum/registration_error.dart';
import '../model/user.dart';

abstract interface class AuthRepository {
  Future<ResultAuth<User, RegistrationError>> registerUser({
    required String email,
    required String password,
  });
}
