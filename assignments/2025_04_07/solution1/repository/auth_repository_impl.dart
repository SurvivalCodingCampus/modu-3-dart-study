import '../core/enum/registration_error.dart';
import '../core/result.dart';

import '../data_source/auth_retmote_data_source.dart';
import '../mapper/user_mapper.dart';
import '../model/user.dart';
import 'auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRetmoteDataSource _authRetmoteDataSource;

  AuthRepositoryImpl({required AuthRetmoteDataSource authRetmoteDataSource})
    : _authRetmoteDataSource = authRetmoteDataSource;

  @override
  Future<Result<User, RegistrationError>> registerUser({
    required String email,
    required String password,
  }) async {
    if (!RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(email)) {
      return Result.error(RegistrationError.invaildEmail);
    }
    if (password.length < 6) {
      return Result.error(RegistrationError.weakPassword);
    }

    try {
      final result = await _authRetmoteDataSource.registerUser(
        email: email,
        password: password,
      );
      if (result.errorMessage != null) {
        return Result.error(RegistrationError.networkError);
      }
      return Result.success(result.toUser());
    } catch (e) {
      return Result.error(RegistrationError.networkError);
    }
  }
}
