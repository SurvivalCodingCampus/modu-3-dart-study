import 'package:modu_3_dart_study/assignments/2025-04-/2025-04-07/auth/data_source/auth_data_source.dart';
import 'package:modu_3_dart_study/assignments/2025-04-/2025-04-07/auth/mapper/user_mapper.dart';
import 'package:modu_3_dart_study/assignments/2025-04-/2025-04-07/auth/model/user.dart';
import 'package:modu_3_dart_study/assignments/2025-04-/2025-04-07/auth/repository/auth_repository.dart';
import 'package:modu_3_dart_study/assignments/2025-04-/2025-04-07/core/modules/exception/custom_exception.dart';
import 'package:modu_3_dart_study/assignments/2025-04-/2025-04-07/core/modules/error_handling/result.dart';
import 'package:modu_3_dart_study/assignments/2025-04-/2025-04-07/core/modules/validate/app_validate.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource _dataSource;

  AuthRepositoryImpl(this._dataSource);

  @override
  Future<Result<User, RegistrationError>> registerUser({
    required String email,
    required String password,
  }) async {
    try {
      if (password.length < 6) {
        return Result.error(WeakPassword());
      }
      if (!AppValidate.email(email)) {
        return Result.error(InvalidEmail());
      }
      final resp = await _dataSource.registerUser(
        email: email,
        password: password,
      );
      final user = resp.toUser();
      return Result.success(user);
    } catch (e) {
      final error = e.toString();
      return Result.error(NetworkError(error));
    }
  }
}
