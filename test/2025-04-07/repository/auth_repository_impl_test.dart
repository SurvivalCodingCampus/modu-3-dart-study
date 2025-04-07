import 'package:modu_3_dart_study/2025-04-07/core/error.dart';
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
      final result = await authRepository.registerUser(
        email: 'invalid-email',
        password: 'password123',
      );

      switch (result) {
        case Success():
          fail('성공하면 안 됨');
        case Error(:final error):
          expect(error, RegistrationError.invalidEmail);
      }
    });

    test('v', () async {
      final result = await authRepository.registerUser(
        email: 'validemail@example.com',
        password: 'short',
      );

      switch (result) {
        case Success():
          fail('성공하면 안 됨');
        case Error(:final error):
          expect(error, RegistrationError.weakPassword);
      }
    });

    test('정상적으로 사용자 등록 성공', () async {
      final result = await authRepository.registerUser(
        email: 'testuser@gmail.com',
        password: 'password123',
      );

      switch (result) {
        case Success(:final data):
          expect(data.email, 'testuser@gmail.com');
        case Error():
          fail('실패하면 안 됨');
      }
    });

    test('네트워크 오류가 발생한 경우', () async {
      final result = await authRepository.registerUser(
        email: MockAuthRemoteDataSourceImpl.networkErrorEmail,
        password: 'password123',
      );

      switch (result) {
        case Success():
          fail('성공하면 안 됨');
        case Error(:final error):
          expect(error, RegistrationError.networkError);
      }
    });
  });
}
