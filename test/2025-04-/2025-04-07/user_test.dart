import 'package:modu_3_dart_study/assignments/2025-04-/2025-04-07/auth/data_source/auth_data_source.dart';
import 'package:modu_3_dart_study/assignments/2025-04-/2025-04-07/auth/data_source/impl/auth_data_source_impl.dart';
import 'package:modu_3_dart_study/assignments/2025-04-/2025-04-07/auth/model/user.dart';
import 'package:modu_3_dart_study/assignments/2025-04-/2025-04-07/auth/repository/auth_repository.dart';
import 'package:modu_3_dart_study/assignments/2025-04-/2025-04-07/auth/repository/impl/auth_repository_impl.dart';
import 'package:modu_3_dart_study/assignments/2025-04-/2025-04-07/core/modules/error_handling/result.dart';
import 'package:modu_3_dart_study/assignments/2025-04-/2025-04-07/core/modules/exception/custom_exception.dart';
import 'package:modu_3_dart_study/assignments/2025-04-/2025-04-07/core/network/mock/client_mock.dart';
import 'package:test/test.dart';

void respHandler(Result<User, RegistrationError> resp) {
  switch (resp) {
    case Success<User, RegistrationError>():
      print((resp as Success).data.toString());
      break;
    case Error<User, RegistrationError>():
      switch (resp.error) {
        case InvalidEmail():
          print(resp.error.toString());
          break;
        case WeakPassword():
          print(resp.error.toString());
          break;
        case NetworkError():
          print(resp.error.toString());
          break;
      }
      break;
  }
}

void main() async {
  final email = 'test@example.com';
  final password = '1234567';
  final wrongPassword = '1234';
  final wrongEmail = 'test';
  final networkErrorPassword = '123456';
  final mockClient = await ClientMock.mockClient();
  final AuthDataSource dataSource = AuthDataSourceImpl(mockClient);
  final AuthRepository repo = AuthRepositoryImpl(dataSource);
  group('auth repo test', () {
    test('이메일은 유효한가?', () async {
      final resp = await repo.registerUser(
        email: wrongEmail,
        password: password,
      );
      respHandler(resp);
      expect(resp, equals(isA<Error<User, RegistrationError>>()));
    });

    test('비밀번호는 6자 이상', () async {
      final resp = await repo.registerUser(
        email: email,
        password: wrongPassword,
      );
      respHandler(resp);
      expect(resp, equals(isA<Error<User, RegistrationError>>()));
    });

    test('네트워크 에러', () async {
      final resp = await repo.registerUser(
        email: email,
        password: networkErrorPassword,
      );
      respHandler(resp);
      expect(resp, equals(isA<Error<User, RegistrationError>>()));
    });

    test('요청 성공 테스트', () async {
      final resp = await repo.registerUser(
        email: email,
        password: password,
      );
      respHandler(resp);
      final user = (resp as Success<User, RegistrationError>).data;
      expect(resp, equals(isA<Success<User, RegistrationError>>()));
      expect(user.id, equals('1'));
      expect(user.email, equals(email));
      expect(user.password, equals(password));
    });
  });
}
