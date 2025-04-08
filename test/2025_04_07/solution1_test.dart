import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:test/test.dart';

import '../../assignments/2025_04_07/solution1/core/enum/registration_error.dart';
import '../../assignments/2025_04_07/solution1/core/result.dart';

import '../../assignments/2025_04_07/solution1/mock/mock_user_data_source_impl.dart';
import '../../assignments/2025_04_07/solution1/model/user.dart';
import '../../assignments/2025_04_07/solution1/repository/auth_repository.dart';
import '../../assignments/2025_04_07/solution1/repository/auth_repository_impl.dart';

void main() {
  final mockClient = MockClient((request) async {
    return Response('', 200);
  });
  final AuthRepository authRepository = AuthRepositoryImpl(
    authRetmoteDataSource: MockUserDataSourceImpl(client: mockClient),
  );
  group('1번 과제', () {
    test('Success : User 객체 반환', () async {
      final result = await authRepository.registerUser(
        email: 'hihi@example.com',
        password: '7452574',
      );

      expect(result, Result<User, RegistrationError>);
    });
    test('Error : 이메일이 유효하지 않음', () async {
      final result = await authRepository.registerUser(
        email: 'invaild-email',
        password: '7452574',
      );
      expect(
        result,
        Result<User, RegistrationError>.error(RegistrationError.invaildEmail),
      );
    });
    test('Error : 비밀번호는 6자리 이상이어야 함', () async {
      final result = await authRepository.registerUser(
        email: 'hihi@example.com',
        password: '4555',
      );
      expect(
        result,
        Result<User, RegistrationError>.error(RegistrationError.weakPassword),
      );
    });
    test('Error : 네트워크 에러', () async {
      final result = await authRepository.registerUser(
        email: 'hihi24@example.com',
        password: '1231313',
      );

      expect(
        result,
        Result<User, RegistrationError>.error(RegistrationError.networkError),
      );
    });
  });
}
