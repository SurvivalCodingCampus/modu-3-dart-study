import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:modu_3_dart_study/assignments/2025-04-07/src/solution/data_source/auth_remote_data_source.dart';
import 'package:modu_3_dart_study/assignments/2025-04-07/src/solution/user_dto.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final http.Client? _client;

  AuthRemoteDataSourceImpl({http.Client? client}) : _client = client;

  @override
  Future<UserDto> registerUser({
    required String email,
    required String password,
  }) async {
    if (_client == null) {
      return UserDto(
        id: '0',
        email: email,
        password: password,
        createdAt: DateTime.now().toIso8601String(),
      );
    }

    final response = await _client.post(
      Uri.parse('https://heojunho.com'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );
    if (response.statusCode == 200) {
      return UserDto(
        id: '0',
        email: email,
        password: password,
        createdAt: DateTime.now().toIso8601String(),
      );
    } else {
      throw Exception('Network error');
    }
  }
}
