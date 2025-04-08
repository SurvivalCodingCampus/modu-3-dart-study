import '../core/result_auth.dart';
import '../data_source/auth_remote_data_source.dart';
import '../dto/user_dto.dart';
import '../enum/registration_error.dart';
import '../mapper/user_mapper.dart';
import '../model/user.dart';
import 'auth_repository.dart';

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
