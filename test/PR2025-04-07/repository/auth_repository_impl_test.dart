import 'package:modu_3_dart_study/PR2025-04-07/core/result_auth.dart';
import 'package:modu_3_dart_study/PR2025-04-07/enum/registration_error.dart';
import 'package:modu_3_dart_study/PR2025-04-07/mock/mock_auth_remote_data_source_impl.dart';
import 'package:modu_3_dart_study/PR2025-04-07/repository/auth_repository.dart';
import 'package:modu_3_dart_study/PR2025-04-07/repository/auth_repository_impl.dart';
import 'package:test/test.dart';

void main() async {
  MockUserDataSourceImpl mockUserDataSourceImpl = MockUserDataSourceImpl();
  AuthRepository authRepository = AuthRepositoryImpl(
    authRemoteDataSource: mockUserDataSourceImpl,
  );

  group('result 확인 test', () {
    test('정상적인 이메일 비밀번호 입력했을 경우 test', () async {
      final result = await authRepository.registerUser(
        email: 'fd2s@naver.com',
        password: 'password',
      );
      expect(result, isA<Success>());
    });
    test('비정상적인 이메일, 정상적인 비밀번호 입력했을 경우 test', () async {
      final result = await authRepository.registerUser(
        email: 'fd2snaver.com',
        password: 'password',
      );
      expect(result, isA<Error>());
      expect((result as Error).error, RegistrationError.invalidEmail);
    });
    test('정상적인 이메일, 비정상적인 비밀번호 입력했을 경우 test', () async {
      final result = await authRepository.registerUser(
        email: 'fd2s@naver.com',
        password: '123',
      );
      expect(result, isA<Error>());
      expect((result as Error).error, RegistrationError.weakPassword);
    });
  });
}
