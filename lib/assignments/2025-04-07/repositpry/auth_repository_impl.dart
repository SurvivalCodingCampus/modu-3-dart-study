import 'package:modu_3_dart_study/assignments/2025-04-07/data_source/auth_remote_data_source.dart';
import 'package:modu_3_dart_study/assignments/2025-04-07/mapper/user_mapper.dart';
import 'package:modu_3_dart_study/assignments/2025-04-07/model/user.dart';
import 'package:modu_3_dart_study/assignments/2025-04-07/repositpry/auth_repository.dart';

import '../core/registration_error.dart';
import '../core/result.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _dataSource;

  AuthRepositoryImpl(this._dataSource);

  @override
  Future<Result<User, RegistrationError>> registerUser({
    required String email,
    required String password,
  }) async {
    if (!isValidEmail(email)) {
      return Result.error(RegistrationError.invalidEmail);
    }

    if (isWeakPassword(password)) {
      return Result.error(RegistrationError.weakPassword);
    }

    try {
      final userDto = await _dataSource.registerUser(
        email: email,
        password: password,
      );

      if (userDto.errorMessage != null) {
        print(userDto.errorMessage);
        return Result.error(RegistrationError.networkError);
      }

      return Result.success(userDto.toUser());
    } catch (e) {
      return Result.error(RegistrationError.networkError);
    }
  }

  bool isValidEmail(String email) {
    return RegExp(
      r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}",
    ).hasMatch(email);
  }

  bool isWeakPassword(String password) {
    return password.length < 6;
  }
}
