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
    final userDto = await _authRemoteDataSource.registerUser(
      email: email,
      password: password,
    );
    final user = userDto.toUser();

    try {
      if (!_checkValidEmail(user.email)) {
        return Result.error(RegistrationError.invalidEmail);
      } else if (!_checkPassword(user.password)) {
        return Result.error(RegistrationError.weakPassword);
      } else {
        return Result.success(user);
      }
    } catch (_) {
      return Result.error(RegistrationError.networkError);
    }
  }

  bool _checkValidEmail(String email) {
    final RegExp regex = RegExp(r'^[\w-\\.]+@([\w-]+\\.)+[\w-]{2,4}$');
    return regex.hasMatch(email);
  }

  bool _checkPassword(String password) {
    return password.length >= 6;
  }
}
