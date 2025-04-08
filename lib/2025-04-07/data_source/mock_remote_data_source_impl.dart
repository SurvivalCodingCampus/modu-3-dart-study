import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

import '../dto/user_dto.dart';
import 'auth_remote_data_source.dart';

class MockRemoteDataSourceImpl implements AuthRemoteDataSource {
  final mockClient = MockClient((request) async {
    if (request.url.toString() == '') {
      return http.Response(
        jsonEncode({"email": 'test@example.com', "password": '12345678'}),
        200,
      );
    } else {
      return http.Response('Not Found', 404);
    }
  });

  @override
  Future<UserDto> registerUser({
    required String email,
    required String password,
  }) async {
    await Future.delayed(const Duration(milliseconds: 1000));

    if (email == 'fail') {
      throw Exception('네트워크 오류');
    }

    return UserDto(
      id: 'mock_id_1',
      email: email,
      password: password,
      createdAt: DateTime.now().toIso8601String(),
      errorMessage: '',
    );
  }
}
