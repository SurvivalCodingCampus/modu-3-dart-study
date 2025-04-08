import 'package:modu_3_dart_study/core/25-04-07/registration_error.dart';
import 'package:modu_3_dart_study/core/25-04-07/user_result.dart';
import 'package:modu_3_dart_study/data_source/25-04-07/auth_remote_data_source.dart';
import 'package:modu_3_dart_study/data_source/25-04-07/mock_auth_remote_data_source_impl.dart';
import 'package:modu_3_dart_study/model/25-04-07/user.dart';
import 'package:modu_3_dart_study/repository/25-04-07/user_repository.dart';
import 'package:modu_3_dart_study/repository/25-04-07/user_repository_impl.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() async {
  group('AuthRepository test', () {
    final AuthRemoteDataSource authRemoteDataSource =
        MockAuthRemoteDataSource();
    final AuthRepository authRepository = AuthRepositoryImpl(
      authRemoteDataSource,
    );

    test('이메일이 유효하지 않음', () async {
      final result = await authRepository.registerUser(
        email: 'invalid_email',
        password: 'password',
      );
      expect(result, isA<Error<User, RegistrationError>>());
      expect((result as Error).error, RegistrationError.invalidEmail);
    });
    test('비밀번호가 약함', () async {
      final result = await authRepository.registerUser(
        email: '1234@naver.com',
        password: '1234',
      );
      expect(result, isA<Error<User, RegistrationError>>());
      expect((result as Error).error, RegistrationError.weakPassword);
    });
    test('네트워크 에러', () async {
      final mockDataSource = MockAuthRemoteDataSource(
        errorMessage: 'Network Error',
      );
      final authRepository = AuthRepositoryImpl(mockDataSource);
      final result = await authRepository.registerUser(
        email: '1234@naver.com',
        password: '123456',
      );
      expect(result, isA<Error<User, RegistrationError>>());
    });
    test('성공', () async {
      final result = await authRepository.registerUser(
        email: '1234@naver.com',
        password: '123456',
      );
      expect(result, isA<Success<User, RegistrationError>>());
      expect((result as Success).data.email, '1234@naver.com');
    });
  });
}
