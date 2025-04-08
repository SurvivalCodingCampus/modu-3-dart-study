import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:modu_3_dart_study/apr/w1/2025-04-07/auth/data_source/auth_remote_data_source.dart';
import 'package:modu_3_dart_study/apr/w1/2025-04-07/auth/dto/auth_dto.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final http.Client _client;

  AuthRemoteDataSourceImpl(this._client);

  @override
  Future<AuthDto> registerUser({
    required String email,
    required String password,
  }) async {
    final Uri url = Uri.http('example.com', 'auth');
    final response = await _client.post(
      url,
      body: jsonEncode({'email': email, 'password': password}),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return AuthDto.fromJson(json);
    } else {
      return AuthDto(
        id: '',
        email: '',
        password: '',
        createdAt: '',
        errorMessage: 'Error : ${response.statusCode}',
      );
    }
  }
}
