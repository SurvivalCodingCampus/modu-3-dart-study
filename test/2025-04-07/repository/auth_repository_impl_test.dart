import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:modu_3_dart_study/2025-04-07/core/result.dart';
import 'package:modu_3_dart_study/2025-04-07/data_source/auth_remote_data_source.dart';
import 'package:modu_3_dart_study/2025-04-07/data_source/auth_remote_data_source_impl.dart';
import 'package:modu_3_dart_study/2025-04-07/model/user.dart';
import 'package:modu_3_dart_study/2025-04-07/repository/auth_repository.dart';
import 'package:modu_3_dart_study/2025-04-07/repository/auth_repository_impl.dart';
import 'package:test/test.dart';

void main() {
  final mockClient = MockClient((request) async {
    if (request.url.toString() == 'example.com') {
      Map<String, dynamic> json = jsonDecode(request.body);
      return http.Response(
        jsonEncode({
          'id': (json['email'] as String).split('@').first,
          'email': json['email'],
          'password': json['password'],
          'createAt': DateTime.now().toString(),
        }),
        200,
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
        },
      );
    } else {
      return http.Response(
        jsonEncode({'errorMessage': '네트워크 오류가 발생했습니다.'}),
        400,
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
        },
      );
    }
  });

  test('유효하지 않은 이메일일 때', () async {
    final AuthRemoteDataSource authRemoteDataSource = AuthRemoteDataSourceImpl(
      client: mockClient,
      url: 'example.com',
    );
    final AuthRepository authRepository = AuthRepositoryImpl(
      authRemoteDataSource: authRemoteDataSource,
    );

    final result = await authRepository.registerUser(
      email: 'testexample.com',
      password: '12345678',
    );

    expect(
      result,
      Result<User, RegistrationError>.error(RegistrationError.invalidEmail),
    );
  });
  test('6자리 이하의 약한 패스워드일 때', () async {
    final AuthRemoteDataSource authRemoteDataSource = AuthRemoteDataSourceImpl(
      client: mockClient,
      url: 'example.com',
    );
    final AuthRepository authRepository = AuthRepositoryImpl(
      authRemoteDataSource: authRemoteDataSource,
    );

    final result = await authRepository.registerUser(
      email: 'test@example.com',
      password: '123456',
    );

    expect(
      result,
      Result<User, RegistrationError>.error(RegistrationError.weakPassword),
    );
  });
  test('잘못된 url로 인한 네트워크 오류', () async {
    final AuthRemoteDataSource authRemoteDataSource = AuthRemoteDataSourceImpl(
      client: mockClient,
      url: '',
    );
    final AuthRepository authRepository = AuthRepositoryImpl(
      authRemoteDataSource: authRemoteDataSource,
    );

    final result = await authRepository.registerUser(
      email: 'test@example.com',
      password: '12345678',
    );
    final successResult = result as Success<User, RegistrationError>;

    expect(result, isA<Success<User, RegistrationError>>());
    expect(successResult.data.id, '');
    expect(successResult.data.email, '');
    expect(successResult.data.password, '');
    expect(successResult.data.createAt, DateTime(1970, 1, 1));
    expect(successResult.data.errorMessage, '네트워크 오류가 발생했습니다.');
  });
  test('정상 사용자 등록', () async {
    final AuthRemoteDataSource authRemoteDataSource = AuthRemoteDataSourceImpl(
      client: mockClient,
      url: 'example.com',
    );
    final AuthRepository authRepository = AuthRepositoryImpl(
      authRemoteDataSource: authRemoteDataSource,
    );

    final result = await authRepository.registerUser(
      email: 'test@example.com',
      password: '12345678',
    );
    final successResult = result as Success<User, RegistrationError>;

    expect(result, isA<Success<User, RegistrationError>>());
    expect(successResult.data.email, 'test@example.com');
    expect(successResult.data.password, '12345678');
    expect(successResult.data.id, 'test');
    expect(successResult.data.createAt, isNotNull);
  });
}
