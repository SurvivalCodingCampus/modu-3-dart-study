import 'package:modu_3_dart_study/2025-04-07/data_source/auth_remote_data_source.dart';
import 'package:modu_3_dart_study/2025-04-07/mapper/user_extension.dart';
import 'package:modu_3_dart_study/2025-04-07/repository/auth_repository.dart';
import '../../2025-04-07/model/user.dart';
import '../core/result.dart';
import '../data_source/mock_remote_data_source_impl.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRemoteDataSource _authRemoteDataSource = MockRemoteDataSourceImpl();

  @override
  Future<Result<User, RegistrationError>> registerUser({
    required String email,
    required String password,
  }) async {
    final regExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!regExp.hasMatch(email)) {
      return Result.error(RegistrationError.invalidEmail);
    }
    else if (password.length < 6) {
      return Result.error(RegistrationError.weakPassword);
    }
    try {
      final dto = await _authRemoteDataSource.registerUser(
          email: email, password: password);
      final user = dto.toUser();
      return Result.success(user);
    } catch (e){
      return Result.error(RegistrationError.networkError);
    }
  }
}
