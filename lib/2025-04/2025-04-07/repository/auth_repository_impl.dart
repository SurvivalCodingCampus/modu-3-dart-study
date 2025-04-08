import 'package:modu_3_dart_study/2025-04/2025-04-07/core/registration_error.dart';
import 'package:modu_3_dart_study/2025-04/2025-04-07/data_source/auth_remote_data_source.dart';
import 'package:modu_3_dart_study/2025-04/2025-04-07/dto/user_dto.dart';
import 'package:modu_3_dart_study/2025-04/2025-04-07/mapper/user_mapper.dart';
import 'package:modu_3_dart_study/2025-04/2025-04-07/model/user.dart';
import 'package:modu_3_dart_study/2025-04/2025-04-07/repository/auth_repository.dart';
import 'package:modu_3_dart_study/core/result.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _dataSource;

  const AuthRepositoryImpl(this._dataSource);

  @override
  Future<Result<User, RegistrationError>> registerUser({
    required String email,
    required String password,
  }) async {
    try {
      UserDto dto = await _dataSource.registerUser(
        email: email,
        password: password,
      );

      return validateRegistration(dto.toModel());
    } catch (e) {
      return Result.failure(RegistrationError.networkError);
    }
  }

  Result<User, RegistrationError> validateRegistration(User user) {
    if (!user.isEmailValid) {
      return Result.failure(RegistrationError.invalidEmail);
    }

    if (!user.isPasswordValid) {
      return Result.failure(RegistrationError.weakPassword);
    }

    return Result.success(user);
  }
}
