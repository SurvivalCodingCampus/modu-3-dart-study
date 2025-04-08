import 'package:modu_3_dart_study/2025-04-07/core/result.dart';
import 'package:modu_3_dart_study/2025-04-07/data_source/auth_remote_data_source.dart';
import 'package:modu_3_dart_study/2025-04-07/mapper/user_mapper.dart';
import 'package:modu_3_dart_study/2025-04-07/model/error/registration_error.dart';
import 'package:modu_3_dart_study/2025-04-07/model/user.dart';
import 'package:modu_3_dart_study/2025-04-07/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;

  const AuthRepositoryImpl({required AuthRemoteDataSource authRemoteDataSource})
    : _authRemoteDataSource = authRemoteDataSource;

  @override
  Future<Result<User, RegistrationError>> registerUser({
    required String email,
    required String password,
  }) async {
    try {
      final userDto = await _authRemoteDataSource.registerUser(
        email: email,
        password: password,
      );

      final user = userDto.toUser();

      if (_checkInvalidEmail(user.email)) {
        return Result.error(RegistrationError.invalidEmail());
      }

      if (_checkWeakPassword(user.password)) {
        return Result.error(RegistrationError.weakPassword());
      }

      if (userDto.message != null && (userDto.message ?? '').isNotEmpty) {
        return Result.error(
          RegistrationError.networkError(message: userDto.message),
        );
      }

      return Result.success(user);
    } catch (_) {
      return Result.error(RegistrationError.networkError());
    }
  }

  bool _checkInvalidEmail(String email) {
    final RegExp regex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    return !regex.hasMatch(email);
  }

  bool _checkWeakPassword(String password) {
    return password.length <= 6;
  }
}
