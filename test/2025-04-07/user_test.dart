import 'package:test/test.dart';
import 'package:modu_3_dart_study/2025-04-07/mock/mock_auth_remote_data_source_impl.dart';
import 'package:modu_3_dart_study/2025-04-07/core/result.dart';
import 'package:modu_3_dart_study/2025-04-07/repository/auth_repository.dart';
import 'package:modu_3_dart_study/2025-04-07/repository/auth_repository_impl.dart';

void main() {
  late AuthRepository repository;

  setUp(() {
    repository = AuthRepositoryImpl(
      dataSource: MockAuthRemoteDataSourceImpl(),
    );
  });

  test('성공: 유효한 이메일과 비밀번호', () async {
    final result = await repository.registerUser(
      email: 'test@example.com',
      password: '12345678',
    );

    switch (result) {
      case Success(:final value):
        expect(value.email, 'test@example.com');
      case Error(:final error):
        fail('에러가 발생했어요: $error');
    }
  });

  test('실패: 잘못된 이메일', () async {
    final result = await repository.registerUser(
      email: 'invalid-email',
      password: '12345678',
    );

    switch (result) {
      case Success(:final value):
        fail('성공하면 안 됩니다. 반환된 유저: $value');
      case Error(:final error):
        expect(error, RegistrationError.invalidEmail);
    }
  });

  test('실패: 약한 비밀번호', () async {
    final result = await repository.registerUser(
      email: 'test@example.com',
      password: '123', // 너무 짧음
    );

    switch (result) {
      case Success(:final value):
        fail('성공하면 안 됩니다. 반환된 유저: $value');
      case Error(:final error):
        expect(error, RegistrationError.weakPassword);
    }
  });
}