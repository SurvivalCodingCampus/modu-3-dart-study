import 'package:modu_3_dart_study/assignments/2025-04-07/src/solution/core/result.dart';
import 'package:modu_3_dart_study/assignments/2025-04-07/src/solution/data_source/auth_remote_data_source.dart';
import 'package:modu_3_dart_study/assignments/2025-04-07/src/solution/data_source/auth_remote_data_source_impl.dart';
import 'package:modu_3_dart_study/assignments/2025-04-07/src/solution/enum/registration_error.dart';
import 'package:modu_3_dart_study/assignments/2025-04-07/src/solution/mapper/user_mapper.dart';
import 'package:modu_3_dart_study/assignments/2025-04-07/src/solution/model/user.dart';
import 'package:modu_3_dart_study/assignments/2025-04-07/src/solution/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;

  AuthRepositoryImpl({required AuthRemoteDataSource authRemoteDataSource})
    : _authRemoteDataSource = authRemoteDataSource;

  @override
  Future<Result<User, RegistrationError>> registerUser({
    required String email,
    required String password,
  }) async {
    bool isValidEmail(String email) {
      final regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
      return regex.hasMatch(email);
    }

    try {
      if (!isValidEmail(email)) {
        return Future.value(Result.failure(RegistrationError.invalidEmail));
      } else if (password.length <= 6) {
        return Future.value(Result.failure(RegistrationError.weakPassword));
      }
      final userDto = await _authRemoteDataSource.registerUser(
        email: email,
        password: password,
      );
      return Result.success(userDto.toUser());
    } catch (e) {
      return Future.value(Result.failure(RegistrationError.networkError));
    }
  }
}

void main() async {
  final AuthRepository authRepository = AuthRepositoryImpl(
    authRemoteDataSource: AuthRemoteDataSourceImpl(),
  );

  final result = await authRepository.registerUser(
    email: 'test@example.com',
    password: '12345678',
  );

  switch (result) {
    case Success<User, RegistrationError>():
      print('사용자 등록 성공: ${result.value}');
    case Failure<User, RegistrationError>():
      switch (result.error) {
        case RegistrationError.invalidEmail:
          print('유효하지 않은 이메일 주소입니다.');
          break;
        case RegistrationError.weakPassword:
          print('비밀번호는 6자리 이상이어야 합니다.');
          break;
        case RegistrationError.networkError:
          print('네트워크 오류가 발생했습니다.');
          break;
      }
  }
}
