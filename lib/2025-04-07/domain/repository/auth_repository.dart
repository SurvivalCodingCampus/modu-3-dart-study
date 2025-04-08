import '../../core/result.dart';
import '../model/user.dart';

enum RegistrationError {
  invalidEmail,
  weakPassword,
  networkError,
  emailAlreadyInUse,
}

abstract interface class AuthRepository {
  Future<Result<User, RegistrationError>> registerUser({
    required String email,
    required String password,
  });
}
