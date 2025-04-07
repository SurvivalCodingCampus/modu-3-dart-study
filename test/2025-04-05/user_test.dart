import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:modu_3_dart_study/assignments/2025-04-05/core/result.dart';
import 'package:modu_3_dart_study/assignments/2025-04-05/data_source/auth_data_source.dart';
import 'package:modu_3_dart_study/assignments/2025-04-05/data_source/mock_auth_remote_data_source_impl.dart';
import 'package:modu_3_dart_study/assignments/2025-04-05/model/user.dart';
import 'package:modu_3_dart_study/assignments/2025-04-05/repository/auth_repository.dart';
import 'package:modu_3_dart_study/assignments/2025-04-05/repository/auth_repository_impl.dart';
import 'package:modu_3_dart_study/assignments/2025-04-05/util/registration_error_enum.dart';
import 'package:test/test.dart';

void main() {
  final successUrl = "https://test.com";
  final failUrl = "https://testfail.com";
  final mockClient = MockClient((request) async {
    if (request.url.toString() == failUrl) {
      return http.Response('네트워크 에러날 url', 200);
    }
    return http.Response('success', 200);
  });

  final AuthDataSource successMockAuthDataSource = MockAuthRemoteDataSourceImpl(
    client: mockClient,
    url: successUrl,
  );
  final AuthDataSource failMockAuthDataSource = MockAuthRemoteDataSourceImpl(
    client: mockClient,
    url: failUrl,
  );
  final AuthRepository successAuthRepository = AuthRepositoryImpl(
    dataSource: successMockAuthDataSource,
  );
  final AuthRepository failAuthRepository = AuthRepositoryImpl(
    dataSource: failMockAuthDataSource,
  );
  group('User 테스트', () {
    test('이메일, 비밀번호 유효 테스트', () async {
      final now = DateTime.now();
      final result = await successAuthRepository.registerUser(
        email: 'test@example.com',
        password: '12345678',
      );
      expect(
        result,
        Result<User, RegistrationError>.success(
          User(
            id: '0',
            email: 'test@example.com',
            password: '12345678',
            createdAt: DateTime(now.year, now.month, now.day, now.hour),
          ),
        ),
      );
    });
    test('이메일 유효하지 않음 테스트', () async {
      final result = await successAuthRepository.registerUser(
        email: 'testexample.com',
        password: '12345678',
      );
      expect(
        result,
        Result<User, RegistrationError>.error(RegistrationError.invalidEmail),
      );
    });
    test('비밀번호 짧음 테스트', () async {
      final result = await successAuthRepository.registerUser(
        email: 'test@example.com',
        password: '12345',
      );
      expect(
        result,
        Result<User, RegistrationError>.error(RegistrationError.weakPassword),
      );
    });
    test('네트워크 에러 테스트', () async {
      final result = await failAuthRepository.registerUser(
        email: 'test@example.com',
        password: '12345678',
      );
      expect(
        result,
        Result<User, RegistrationError>.error(RegistrationError.networkError),
      );
    });
  });
}
