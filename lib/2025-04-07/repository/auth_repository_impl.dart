import 'package:modu_3_dart_study/2025-04-07/mock/mock_auth_remote_data_source_impl.dart';

import '../core/result.dart';
import '../dto/user_dto.dart';
import '../data_source/user_data_source.dart';
import '../mapper/user_mapper.dart';
import '../model/user.dart';
import 'auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final UserDataSource dataSource;

  AuthRepositoryImpl({required this.dataSource});

  @override
  Future<Result<User, RegistrationError>> registerUser({
    required String email,
    required String password,
  }) async {
    try {
      final dto = UserDto(email: email, password: password);
      final responseDto = await dataSource.registerUser(dto);

      if (responseDto.errorMessage != null) {
        switch (responseDto.errorMessage) {
          case 'invalid_email':
            return const Result.error(RegistrationError.invalidEmail);
          case 'weak_password':
            return const Result.error(RegistrationError.weakPassword);
          case 'network_error':
          default:
            return const Result.error(RegistrationError.networkError);
        }
      }

      return Result.success(responseDto.toModel());
    } catch (_) {
      return const Result.error(RegistrationError.networkError);
    }
  }
}

void main() async {
  final AuthRepository authRepository = AuthRepositoryImpl(
    dataSource: MockAuthRemoteDataSourceImpl(),
  );

  final result = await authRepository.registerUser(
    email: 'test@example.com',
    password: '12345678',
  );

  switch (result) {
    case Success(:final value):
      print('사용자 등록 성공: ${value.email}');
    case Error(:final error):
      switch (error) {
        case RegistrationError.invalidEmail:
          print('유효하지 않은 이메일 주소입니다.');
          break;
        case RegistrationError.weakPassword:
          print('비밀번호는 6자 이상이어야 합니다.');
          break;
        case RegistrationError.networkError:
          print('네트워크 오류가 발생했습니다.');
          break;
      }
  }
}