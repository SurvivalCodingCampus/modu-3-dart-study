import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:modu_3_dart_study/2025-04-07/core/result.dart';
import 'package:modu_3_dart_study/2025-04-07/model/user.dart';
import 'package:modu_3_dart_study/2025-04-07/repository/auth_repository.dart';
import 'package:modu_3_dart_study/2025-04-07/repository/auth_repository_impl.dart';
import 'package:test/test.dart';

import 'mock_auth_remote_data_source_impl.dart';

void main() {
  final AuthRepository authRepository = AuthRepositoryImpl(authRemoteDataSource: MockAuthRemoteDataSourceImpl());
  test('유효하지 않은 이메일일 때', () async {
    final result = await authRepository.registerUser(
      email: 'testexample.com',
      password: '12345678',
    );
    expect(result, Result<User, RegistrationError>.error(RegistrationError.invalidEmail));
  });
  test('6자리 이하의 약한 패스워드일 때', () async {
    final result = await authRepository.registerUser(
      email: 'test@example.com',
      password: '123456',
    );
    expect(result, Result<User, RegistrationError>.error(RegistrationError.weakPassword));
  });
  test('정상 사용자 등록', () async {
    final result = await authRepository.registerUser(
      email: 'test@example.com',
      password: '12345678',
    );
    
    expect(result, isA<Success>());
    expect((result as Success).data.email, 'test@example.com');
    expect((result as Success).data.password, '12345678');
  });
}
