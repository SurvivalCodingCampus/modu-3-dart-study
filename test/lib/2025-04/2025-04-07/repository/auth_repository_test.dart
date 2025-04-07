import 'package:http/http.dart' as http;
import 'package:modu_3_dart_study/2025-04/2025-04-07/core/registration_error.dart'
    show RegistrationError;
import 'package:modu_3_dart_study/2025-04/2025-04-07/data_source/auth_remote_data_source.dart';
import 'package:modu_3_dart_study/2025-04/2025-04-07/data_source/mock_auth_remote_data_source_impl.dart';
import 'package:modu_3_dart_study/2025-04/2025-04-07/model/user.dart' show User;
import 'package:modu_3_dart_study/2025-04/2025-04-07/repository/auth_repository.dart';
import 'package:modu_3_dart_study/2025-04/2025-04-07/repository/auth_repository_impl.dart';
import 'package:modu_3_dart_study/2025-04/mock/mock_client.dart';
import 'package:modu_3_dart_study/core/result.dart';
import 'package:test/test.dart';

void main() {
  group('Success - ', () {
    Map<String, dynamic> mock = {
      "id": "1",
      "email": "test@test.com",
      "password": "password",
      "createdAt": "2025-04-07T14:00:00Z",
    };

    final http.Client client = mockClient(true, mock);
    final AuthRemoteDataSource dataSource = MockAuthRemoteDataSourceImpl(
      client,
    );

    final AuthRepository repository = AuthRepositoryImpl(dataSource);
    test('유효한 이메일을 전달하면 User 객체가 반환되어야한다.', () async {
      final Result<User, RegistrationError> result = await repository
          .registerUser(email: mock['email'], password: mock['password']);

      expect(result, isA<Success<User, RegistrationError>>());
    });
  });

  group('Failure - ', () {
    Map<String, dynamic> mock = {
      "id": "1",
      "email": "test@test",
      "password": "abcdef",
      "createdAt": "2025-04-07T14:00:00Z",
    };

    Map<String, dynamic> weakPassword = {
      "id": "1",
      "email": "test@test.com",
      "password": "abcdef",
      "createdAt": "2025-04-07T14:00:00Z",
    };

    Map<String, dynamic> networkError = {
      "id": "1",
      "email": "test@test.com",
      "password": "abcdefa",
      "createdAt": "2025-04-07T14:00:00Z",
    };

    final http.Client client = mockClient(true, mock);

    final AuthRemoteDataSource dataSource = MockAuthRemoteDataSourceImpl(
      client,
    );

    final AuthRepository repository = AuthRepositoryImpl(dataSource);

    test(
      '유효하지 않은 이메일을 전달하면 RegistrationError.invalidEmail이 반환되어야한다.',
      () async {
        final Result<User, RegistrationError> result = await repository
            .registerUser(email: mock['email'], password: mock['password']);

        expect(
          result,
          Result<User, RegistrationError>.failure(
            RegistrationError.invalidEmail,
          ),
        );
      },
    );

    test('6자리 이하의 패스워드는 RegistrationError.weakPassword를 반환해야한다.', () async {
      // GIVEN
      final http.Client client = mockClient(true, weakPassword);
      final AuthRemoteDataSource dataSource = MockAuthRemoteDataSourceImpl(
        client,
      );
      final AuthRepository repository = AuthRepositoryImpl(dataSource);

      // WHEN
      final Result<User, RegistrationError> result = await repository
          .registerUser(email: mock['email'], password: mock['password']);

      // THEN
      expect(
        result,
        Result<User, RegistrationError>.failure(RegistrationError.weakPassword),
      );
    });

    test('통신 에러시 RegistrationError.networkError를 반환해야한다.', () async {
      // GIVEN
      final http.Client client = mockClient(false, networkError);
      final AuthRemoteDataSource dataSource = MockAuthRemoteDataSourceImpl(
        client,
      );
      final AuthRepository repository = AuthRepositoryImpl(dataSource);

      // WHEN
      final Result<User, RegistrationError> result = await repository
          .registerUser(email: mock['email'], password: mock['password']);

      // THEN
      expect(
        result,
        Result<User, RegistrationError>.failure(RegistrationError.networkError),
      );
    });
  });
}
