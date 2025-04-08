import 'package:modu_3_dart_study/apr/w1/2025-04-07/auth/core/result_auth.dart';
import 'package:modu_3_dart_study/apr/w1/2025-04-07/auth/data_source/auth_remote_data_source.dart';
import 'package:modu_3_dart_study/apr/w1/2025-04-07/auth/mapper/user_mapper.dart';
import 'package:modu_3_dart_study/apr/w1/2025-04-07/auth/model/enum_auth.dart';
import 'package:modu_3_dart_study/apr/w1/2025-04-07/auth/model/user.dart';
import 'package:modu_3_dart_study/apr/w1/2025-04-07/auth/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;

  AuthRepositoryImpl(this._authRemoteDataSource);

  @override
  Future<Result<User, RegistrationError>> registerUser({
    required String email,
    required String password,
  }) async {
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$',
    );
    if (!emailRegex.hasMatch(email)) {
      return Result.error(RegistrationError.invalidEmail);
    }
    if (password.length < 6) {
      return Result.error(RegistrationError.weakPassword);
    }
    try {
      final authRemote = await _authRemoteDataSource.registerUser(
        email: email,
        password: password,
      );
      if (authRemote.errorMessage != null) {
        print('에메프${authRemote.errorMessage}');
        return Result.error(RegistrationError.networkError);
      }
      final user = authRemote.toUser();
      return Result.success(user);
    } catch (e) {
      return Result.error(RegistrationError.networkError);
    }
  }
}
