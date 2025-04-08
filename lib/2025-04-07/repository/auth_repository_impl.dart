import 'package:modu_3_dart_study/2025-04-07/core/error.dart';
import 'package:modu_3_dart_study/2025-04-07/core/result.dart';
import 'package:modu_3_dart_study/2025-04-07/data_source/auth_remote_data_source.dart';
import 'package:modu_3_dart_study/2025-04-07/mapper/user_mapper.dart';

import '../model/user.dart';
import 'auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _dataSource;

  AuthRepositoryImpl(this._dataSource);

  @override
  Future<Result<User, RegistrationError>> registerUser({
    required String email,
    required String password,
  }) async {
    final emailRegExp = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    if (!emailRegExp.hasMatch(email)) {
      return Result.error(RegistrationError.invalidEmail);
    }
    if (password.length < 6) {
      return Result.error(RegistrationError.weakPassword);
    }

    try {
      final userDto = await _dataSource.registerUser(
        email: email,
        password: password,
      );
      return Result.success(userDto.toUser());
    } catch (e) {
      return Result.error(RegistrationError.networkError);
    }
  }
}
