import 'package:http/http.dart' as http;
import 'package:modu_3_dart_study/assignments/2025-04-07/core/registration_error.dart';
import 'package:modu_3_dart_study/assignments/2025-04-07/core/result.dart';
import 'package:modu_3_dart_study/assignments/2025-04-07/data_source/mock/mock_auth_remote_data_source_impl.dart';
import 'package:modu_3_dart_study/assignments/2025-04-07/model/user.dart';
import 'package:modu_3_dart_study/assignments/2025-04-07/repositpry/auth_repository_impl.dart';
import 'package:test/test.dart';

void main() {
  group('User회원가입 테스트', () {
    final client = http.Client();
    final dataSource = MockAuthRemoteDataSourceImpl(client);
    final repository = AuthRepositoryImpl(dataSource);

    final unValidEmail = 'jilong';
    final unValidPassword = '1234';
    final validEmail = 'jilong@asd.com';
    final validPassword = '123456';

    test('이메일이 유효하지 않은지 정규식을 사용해서 판단', () async {
      final result = await repository.registerUser(
        email: unValidEmail,
        password: validPassword,
      );
      switch (result) {
        case Success<User, RegistrationError>():
          print('사용자 등록 성공: ${result.data.email}');
        case Error<User, RegistrationError>():
          print(RegistrationError.getMessage(result.error));
      }
      expect(
        result,
        isA<Error<User, RegistrationError>>().having(
          (e) => e.error,
          'error',
          RegistrationError.invalidEmail,
        ),
      );
    });

    test('6자리 이하의 패스워드는 약한 패스워드', () async {
      final result = await repository.registerUser(
        email: validEmail,
        password: unValidPassword,
      );
      switch (result) {
        case Success<User, RegistrationError>():
          print('사용자 등록 성공: ${result.data.email}');
        case Error<User, RegistrationError>():
          print(RegistrationError.getMessage(result.error));
      }
      expect(
        result,
        isA<Error<User, RegistrationError>>().having(
          (e) => e.error,
          'error',
          RegistrationError.weakPassword,
        ),
      );
    });
    test('예외 발생시 네트워크 에러', () async {
      final result = await repository.registerUser(
        email: 'network@error.com',
        password: 'error123',
      );
      switch (result) {
        case Success<User, RegistrationError>():
          print('사용자 등록 성공: ${result.data.email}');
        case Error<User, RegistrationError>():
          print(RegistrationError.getMessage(result.error));
      }
      expect(
        result,
        isA<Error<User, RegistrationError>>().having(
          (e) => e.error,
          'error',
          RegistrationError.networkError,
        ),
      );
    });
    test('동일한 아이디', () async {
      final result = await repository.registerUser(
        email: 'user4@fultter.com',
        password: validPassword,
      );

      switch (result) {
        case Success<User, RegistrationError>():
          expect(result.data.email, 'user4@fultter.com');
          expect(result.data.id, isNotEmpty);
          print('사용자 등록 성공: ${result.data.email}');
        case Error<User, RegistrationError>():
          fail('사용자 등록에 실패했습니다: ${RegistrationError.getMessage(result.error)}');
      }
    });

    test('사용자 등록 성공', () async {
      final result = await repository.registerUser(
        email: validEmail,
        password: validPassword,
      );
      print(result);

      switch (result) {
        case Success<User, RegistrationError>():
          expect(result.data.email, validEmail);
          expect(result.data.id, isNotEmpty);
          print('사용자 등록 성공: ${result.data.email}');
        case Error<User, RegistrationError>():
          fail('사용자 등록에 실패했습니다: ${RegistrationError.getMessage(result.error)}');
      }
    });
  });
}
