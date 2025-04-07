import 'package:modu_3_dart_study/assignments/2025-04-05/core/result.dart';
import 'package:modu_3_dart_study/assignments/2025-04-05/data_source/auth_data_source.dart';
import 'package:modu_3_dart_study/assignments/2025-04-05/model/user.dart';
import 'package:modu_3_dart_study/assignments/2025-04-05/repository/auth_repository.dart';
import 'package:modu_3_dart_study/assignments/2025-04-05/util/registration_error_enum.dart';

class AuthRepositoryImpl implements AuthRepository {
  static final emailRegex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
  final AuthDataSource _dataSource;
  AuthRepositoryImpl({dataSource}) : _dataSource = dataSource;
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
      print('유저 데이터베이스에 등록 $userRegisterResult');
    } catch (e) {
      return Result.error(RegistrationError.networkError);
    }
    return Result.success(user);
  }
}
