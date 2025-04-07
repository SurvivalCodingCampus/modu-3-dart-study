import '../core/registration_error.dart';
import '../core/result.dart';
import '../dto/user_dto.dart';
import '../mapper/user_mapper.dart';
import '../model/user.dart';
import 'auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final _dataSource;

  AuthRepositoryImpl(this._dataSource);

  @override
  Future<Result<User, RegistrationError>> registerUser({
    required String email,
    required String password,
  }) async {
    if (!RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+'
      r'\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z'
      r'\-0-9]+\.)+[a-zA-Z]{2,}))$',
    ).hasMatch(email)) {
      return Result.error(RegistrationError.invalidEmail);
    }

    if (password.length < 6) {
      return Result.error(RegistrationError.weakPassword);
    }

    try {
      final UserDto userRegister = await _dataSource.registerUser(
        email: email,
        password: password,
      );
      return Result.success(userRegister.toUser());
    } catch (e) {
      return Result.error(RegistrationError.networkError);
    }
  }
}
