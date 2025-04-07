import 'package:test/test.dart';

import '../../../assignments/2025-04-07/exam01/core/registration_error.dart';
import '../../../assignments/2025-04-07/exam01/core/result.dart';
import '../../../assignments/2025-04-07/exam01/data_source/auth_remote_data_source.dart';
import '../../../assignments/2025-04-07/exam01/data_source/auth_remote_data_source_impl.dart';
import '../../../assignments/2025-04-07/exam01/data_source/mock_auth_remote_data_source_impl.dart';
import '../../../assignments/2025-04-07/exam01/model/user.dart';
import '../../../assignments/2025-04-07/exam01/repository/auth_repository.dart';
import '../../../assignments/2025-04-07/exam01/repository/auth_repository_impl.dart';

void main() async {
  final AuthRemoteDataSource _dataSource = AuthRemoteDataSourceImpl();
  final MockAuthRemoteDataSource _fakeSource = MockAuthRemoteDataSourceImpl();
  final AuthRepository authRepository = AuthRepositoryImpl(_dataSource);
  final AuthRepository fakeAuthRepository = AuthRepositoryImpl(_fakeSource);

  group("auth_repository_impl_test", () {
    test("이메일이 유효하지 않은지 정규식을 사용해서 판단", () async {
      final result = await authRepository.registerUser(
        email: 'test',
        password: '12345678',
      );

      expect(
        result,
        Result<User, RegistrationError>.error(RegistrationError.invalidEmail),
      );
    });

    test("6자리 이하의 패스워드는 약한 패스워드", () async {
      final result = await authRepository.registerUser(
        email: 'test@naver.com',
        password: '12345',
      );

      expect(
        result,
        Result<User, RegistrationError>.error(RegistrationError.weakPassword),
      );
    });

    test("예외시 네트워크 에러", () async {
      final result = await fakeAuthRepository.registerUser(
        email: 'test@naver.com',
        password: '12345456146',
      );

      expect(
        result,
        Result<User, RegistrationError>.error(RegistrationError.networkError),
      );
    });
  });
}
