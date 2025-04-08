import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:modu_3_dart_study/apr/w1/2025-04-07/auth/core/result_auth.dart'
    as res;
import 'package:modu_3_dart_study/apr/w1/2025-04-07/auth/data_source/auth_remote_data_source_impl.dart';
import 'package:modu_3_dart_study/apr/w1/2025-04-07/auth/model/enum_auth.dart';
import 'package:modu_3_dart_study/apr/w1/2025-04-07/auth/model/user.dart';
import 'package:modu_3_dart_study/apr/w1/2025-04-07/auth/repository/auth_repository_impl.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  test('회원가입', () async {
    final mockClient = MockClient((request) async {
      return http.Response(
        jsonEncode({
          'id': '1',
          'email': 'kamagwi@google.com',
          'password': '123123',
          'createdAt': DateTime.now().toIso8601String(),
          'errorMessage': null,
        }),
        200,
      );
    });

    final repository = AuthRepositoryImpl(AuthRemoteDataSourceImpl(mockClient));
    final result = await repository.registerUser(
      email: 'kamagwi@google.com',
      password: '123123',
    );
    switch (result) {
      case res.Success<User, RegistrationError>():
        expect(result.data, isA<User>());
        expect(result.data.email, 'kamagwi@google.com');
        expect(result.data.password, '123123');
      case res.Error<User, RegistrationError>():
        expect(result.e, isA<RegistrationError>());
    }
  });

  test('email 오류', () async {
    final mockClient = MockClient((request) async {
      return http.Response(
        jsonEncode({
          'id': '1',
          'email': 'kamagwi@google',
          'password': '123123',
          'createdAt': DateTime.now(),
          'errorMessage': null,
        }),
        200,
      );
    });

    final repository = AuthRepositoryImpl(AuthRemoteDataSourceImpl(mockClient));
    final result = await repository.registerUser(
      email: 'kamagwi@google',
      password: '123123',
    );
    switch (result) {
      case res.Success<User, RegistrationError>():
        fail('email');
      case res.Error<User, RegistrationError>():
        expect(result.e, isA<RegistrationError>());
        expect(result.e, RegistrationError.invalidEmail);
    }
  });

  test('password 오류', () async {
    final mockClient = MockClient((request) async {
      return http.Response(
        jsonEncode({
          'id': '1',
          'email': 'kamagwi@google.com',
          'password': '123',
          'createdAt': DateTime.now(),
          'errorMessage': null,
        }),
        200,
      );
    });

    final repository = AuthRepositoryImpl(AuthRemoteDataSourceImpl(mockClient));
    final result = await repository.registerUser(
      email: 'kamagwi@google.com',
      password: '123',
    );
    switch (result) {
      case res.Success<User, RegistrationError>():
        fail('weakPassword');
      case res.Error<User, RegistrationError>():
        expect(result.e, isA<RegistrationError>());
        expect(result.e, RegistrationError.weakPassword);
    }
  });
}
