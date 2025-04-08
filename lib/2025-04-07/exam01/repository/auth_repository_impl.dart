import 'package:modu_3_dart_study/2025-04-07/exam01/core/registration_error.dart';
import 'package:modu_3_dart_study/2025-04-07/exam01/core/result.dart';
import 'package:modu_3_dart_study/2025-04-07/exam01/data_source/auth_remote_data_source.dart';
import 'package:modu_3_dart_study/2025-04-07/exam01/dto/user_dto.dart';
import 'package:modu_3_dart_study/2025-04-07/exam01/mapper/user_mapper.dart';
import 'package:modu_3_dart_study/2025-04-07/exam01/model/user.dart';
import 'package:modu_3_dart_study/2025-04-07/exam01/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource? _dataSource;

  const AuthRepositoryImpl({AuthRemoteDataSource? dataSource})
    : _dataSource = dataSource;

  @override
  Future<Result<User, RegistrationError>> registerUser({
    required String email,
    required String password,
  }) async {
    if (_dataSource == null) {
      return Result<User, RegistrationError>.error(
        RegistrationError.networkError,
      );
    }

    final UserDto userDto = await _dataSource.registerUser(
      email: email,
      password: password,
    );

    if (userDto.errorMessage != null) {
      if (userDto.errorMessage == RegistrationError.weakPassword.toString()) {
        return Result<User, RegistrationError>.error(
          RegistrationError.weakPassword,
        );
      }

      if (userDto.errorMessage == RegistrationError.invalidEmail.toString()) {
        return Result<User, RegistrationError>.error(
          RegistrationError.invalidEmail,
        );
      }
    }
    return userDto.toUser() as Result<User, RegistrationError>;
  }
}
