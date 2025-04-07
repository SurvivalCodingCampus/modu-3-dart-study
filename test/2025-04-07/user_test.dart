import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:modu_3_dart_study/2025-04-07/data_source/impl/user_data_source_impl.dart';
import 'package:modu_3_dart_study/2025-04-07/data_source/user_data_source.dart';
import 'package:modu_3_dart_study/2025-04-07/dto/user_dto.dart';
import 'package:modu_3_dart_study/2025-04-07/model/user.dart';
import 'package:modu_3_dart_study/2025-04-07/repository/impl/user_repository_impl.dart';
import 'package:modu_3_dart_study/2025-04-07/repository/user_repository.dart';
import 'package:modu_3_dart_study/core/result.dart';
import 'package:modu_3_dart_study/enums/registration_error.dart';
import 'package:test/test.dart';

void main() {
  group('유저 가입 : ', () {
    late UserDto dto;
    late UserDataSource dataSource;
    late http.Client client;
    late UserRepository repository;
    const String userEmail = 'wpghks56@naver.com';
    const String wrongEmail = 'asdf@asdf';
    const String userPassword = '1234567';
    const String wrongPassword = '123';

    setUpAll(() {
      client = MockClient((request) async {
        if (request.url.toString() == UserDataSourceImpl.userApi) {
          return http.Response(
            jsonEncode({
              'id': 'dbwpghks56',
              'email': userEmail,
              'password': userPassword,
              'createdAt': DateTime.now().toIso8601String(),
            }),
            200,
            headers: {
              HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
            },
          );
        } else {
          return http.Response(
            jsonEncode({'message': '네트워크 에러지롱'}),
            400,
            headers: {
              HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
            },
          );
        }
      });

      dto = UserDto.empty();
      dataSource = UserDataSourceImpl(dto, client: client);
      repository = UserRepositoryImpl(dataSource, dto);
    });

    test('제대로 가입', () async {
      // when
      final result = await repository.registerUser(
        email: userEmail,
        password: userPassword,
      );

      switch (result) {
        case Success<User, RegistrationError>():
          expect(result.data, isA<User>());
          expect(result.data.email, userEmail);
          expect(result.data.password, userPassword);
        case Error<User, RegistrationError>():
          expect(result.e, isA<RegistrationError>());
      }
    });
    test('이메일 날려먹기', () async {
      // when
      final result = await repository.registerUser(
        email: wrongEmail,
        password: userPassword,
      );

      switch (result) {
        case Success<User, RegistrationError>():
          print(result.data);
          expect(result.data, isA<User>());
          expect(result.data.email, userEmail);
          expect(result.data.password, userPassword);
        case Error<User, RegistrationError>():
          expect(result.e, isA<RegistrationError>());
          expect(result.e, RegistrationError.invalidEmail);
      }
    });
    test('비밀번호 날려먹기', () async {
      // when
      final result = await repository.registerUser(
        email: userEmail,
        password: wrongPassword,
      );

      switch (result) {
        case Success<User, RegistrationError>():
          print(result.data);
          expect(result.data, isA<User>());
          expect(result.data.email, userEmail);
          expect(result.data.password, userPassword);
        case Error<User, RegistrationError>():
          expect(result.e, isA<RegistrationError>());
          expect(result.e, RegistrationError.weakPassword);
      }
    });
    test('네트워크 날려먹기', () async {
      dataSource = UserDataSourceImpl(url: 'sdf', dto, client: client);
      repository = UserRepositoryImpl(dataSource, dto);

      final result = await repository.registerUser(
        email: userEmail,
        password: userPassword,
      );

      switch (result) {
        case Success<User, RegistrationError>():
          print(result.data);
          expect(result.data, isA<User>());
          expect(result.data.email, userEmail);
          expect(result.data.password, userPassword);
        case Error<User, RegistrationError>():
          expect(result.e, isA<RegistrationError>());
          expect(result.e, RegistrationError.networkError);
      }
    });
  });
}
