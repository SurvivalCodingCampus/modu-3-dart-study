import 'package:modu_3_dart_study/2025-04-07/core/registration_error.dart';
import 'package:modu_3_dart_study/2025-04-07/core/result.dart';
import 'package:modu_3_dart_study/2025-04-07/data_source/auth_remote_data_source.dart';
import 'package:modu_3_dart_study/2025-04-07/data_source/mock_auth_remote_data_source_impl.dart';
import 'package:modu_3_dart_study/2025-04-07/repository/auth_repository.dart';
import 'package:modu_3_dart_study/2025-04-07/repository/auth_repository_impl.dart';
import 'package:test/test.dart';

void main() {
  group('AuthRepositoryImpl', () {
    late AuthRepository authRepository;
    late AuthRemoteDataSource mockDataSource;

    setUp(() {
      mockDataSource = MockAuthRemoteDataSourceImpl();
      authRepository = AuthRepositoryImpl(mockDataSource);
    });

    test('이메일 형식이 잘못된 경우 사용자 등록 실패', () async {
      const String invalidEmail = 'invalid-email';
      const String validPassword = 'password123';
      print('Running test: 이메일 형식이 잘못된 경우 사용자 등록 실패');
      final result = await authRepository.registerUser(
        email: invalidEmail,
        password: validPassword,
      );

      print('Test result: $result');
      expect(result, isA<Error>());
      expect((result as Error).error, RegistrationError.invalidEmail);
    });

    test('비밀번호가 짧은 경우 사용자 등록 실패', () async {
      const String validEmail = 'validemail@example.com';
      const String shortPassword = 'short';
      print('Running test: 비밀번호가 짧은 경우 사용자 등록 실패');
      final result = await authRepository.registerUser(
        email: validEmail,
        password: shortPassword,
      );

      print('Test result: $result');
      expect(result, isA<Error>());
      expect((result as Error).error, RegistrationError.weakPassword);
    });

    test('정상적으로 사용자 등록 성공', () async {
      const String testEmail = 'testuser@gmail.com';
      const String validPassword = 'password123';
      print('Running test: 정상적으로 사용자 등록 성공');
      final result = await authRepository.registerUser(
        email: testEmail,
        password: validPassword,
      );

      print('Test result: $result');
      expect(result, isA<Success>());
      expect((result as Success).data.email, testEmail);
    });

    test('네트워크 오류가 발생한 경우', () async {
      const String networkErrorEmail =
          MockAuthRemoteDataSourceImpl.networkErrorEmail;
      const String validPassword = 'password123';
      print('Running test: 네트워크 오류가 발생한 경우');
      final result = await authRepository.registerUser(
        email: networkErrorEmail,
        password: validPassword,
      );

      print('Test result: $result');
      expect(result, isA<Error>());
      expect((result as Error).error, RegistrationError.networkError);
    });
  });
}
