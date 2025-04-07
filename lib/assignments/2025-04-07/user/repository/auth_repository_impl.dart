import 'package:modu_3_dart_study/assignments/2025-04-07/user/core/result.dart';
import 'package:modu_3_dart_study/assignments/2025-04-07/user/data_source/auth_data_source.dart';
import 'package:modu_3_dart_study/assignments/2025-04-07/user/dto/user_dto.dart';
import 'package:modu_3_dart_study/assignments/2025-04-07/user/model/user.dart';
import 'package:modu_3_dart_study/assignments/2025-04-07/user/repository/auth_repository.dart';
import 'package:modu_3_dart_study/assignments/2025-04-07/user/util/registration_error_enum.dart';

class AuthRepositoryImpl implements AuthRepository {
  static final emailRegex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
  final AuthDataSource _dataSource;
  AuthRepositoryImpl({required AuthDataSource dataSource})
    : _dataSource = dataSource;
  @override
  Future<Result<User, RegistrationError>> registerUser({
    required String email,
    required String password,
  }) async {
    if (!emailRegex.hasMatch(email)) {
      return Result.error(RegistrationError.invalidEmail);
    } else if (password.length < 6) {
      return Result.error(RegistrationError.weakPassword);
    }
    final now = DateTime.now();
    final user = User(
      id: '0',
      email: email,
      password: password,
      createdAt: DateTime(now.year, now.month, now.day, now.hour),
    );
    try {
      final userMap = user.toJson();
      final userRegisterResult = await _dataSource.registerUser(userMap);

      if (userRegisterResult.errorMessage.isEmpty) {
        return Result.success(user);
      } else {
        return Result.error(RegistrationError.networkError);
      }
    } catch (e) {
      return Result.error(RegistrationError.networkError);
    }
  }
}
