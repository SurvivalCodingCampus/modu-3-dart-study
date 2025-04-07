import 'package:modu_3_dart_study/PR2025-04-07/core/result_auth.dart';
import 'package:modu_3_dart_study/PR2025-04-07/data_source/auth_remote_data_source.dart';
import 'package:modu_3_dart_study/PR2025-04-07/enum/registration_error.dart';
import 'package:modu_3_dart_study/PR2025-04-07/mapper/user_mapper.dart';
import 'package:modu_3_dart_study/PR2025-04-07/model/user.dart';
import 'package:modu_3_dart_study/PR2025-04-07/repository/auth_repository.dart';

import '../dto/user_dto.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRemoteDataSource _authRemoteDataSource;

  AuthRepositoryImpl({required AuthRemoteDataSource authRemoteDataSource})
    : _authRemoteDataSource = authRemoteDataSource;

  @override
  Future<ResultAuth<User, RegistrationError>> registerUser({
    required String email,
    required String password,
  }) async {
    try {
      RegExp emailReg = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
      );
      if (!emailReg.hasMatch(email)) {
        return ResultAuth.error(RegistrationError.invalidEmail);
      }
      if (password.length <= 6) {
        return ResultAuth.error(RegistrationError.weakPassword);
      }
      final UserDto userInfo = await _authRemoteDataSource.registerUser(
        email: email,
        password: password,
      );
      return ResultAuth.success(userInfo.toUser());
    } catch (e) {
      return ResultAuth.error(RegistrationError.networkError);
    }
  }
}
