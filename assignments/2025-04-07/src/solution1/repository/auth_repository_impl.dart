import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:modu_3_dart_study/2025-04-07/core/result.dart';
import 'package:modu_3_dart_study/2025-04-07/data_source/auth_remote_data_source.dart';
import 'package:modu_3_dart_study/2025-04-07/data_source/auth_remote_data_source_impl.dart';
import 'package:modu_3_dart_study/2025-04-07/mapper/user_mapper.dart';
import 'package:modu_3_dart_study/2025-04-07/model/user.dart';
import 'package:modu_3_dart_study/2025-04-07/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;

  const AuthRepositoryImpl({required AuthRemoteDataSource authRemoteDataSource})
    : _authRemoteDataSource = authRemoteDataSource;

  @override
  Future<Result<User, RegistrationError>> registerUser({
    required String email,
    required String password,
  }) async {
    try {
      final Result<User, RegistrationError> result =
          await checkEmailAndPassword(
            email: email,
            password: password,
          ).timeout(Duration(seconds: 10)); // 안드로이드 기준 10초 안에 안되면 오류

      return result;
    } catch (e) {
      return Result.error(RegistrationError.networkError);
    }
  }

  Future<Result<User, RegistrationError>> checkEmailAndPassword({
    required String email,
    required String password,
  }) async {
    //await Future.delayed(Duration(seconds: 11));

    //{영어 & 숫자}@{영어 & 숫자}.{영어 & 숫자}
    final regex = RegExp(r'^[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z0-9]+$');

    if (!regex.hasMatch(email)) {
      return Result.error(RegistrationError.invalidEmail);
    } else if (password.length <= 6) {
      return Result.error(RegistrationError.weakPassword);
    } else {
      final userDto = await _authRemoteDataSource.registerUser(
        email: email,
        password: password,
      );
      return Result.success(userDto.toUser());
    }
  }
}

void main() async {
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

  switch (result) {
    case Success<User, RegistrationError>():
      print('사용자 등록 성공: ${result.data.email}');
    case Error<User, RegistrationError>():
      switch (result.error) {
        case RegistrationError.invalidEmail:
          print('유효하지 않은 이메일 주소입니다.');
        case RegistrationError.weakPassword:
          print('비밀번호는 6자 이상이어야 합니다.');
        case RegistrationError.networkError:
          print('네트워크 오류가 발생했습니다.');
      }
  }
}
