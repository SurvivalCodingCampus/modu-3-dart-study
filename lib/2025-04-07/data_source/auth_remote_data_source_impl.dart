import 'dart:convert';
import 'dart:io';

import 'package:modu_3_dart_study/2025-04-07/data_source/auth_remote_data_source.dart';
import 'package:modu_3_dart_study/2025-04-07/dto/user_dto.dart';
import 'package:http/http.dart' as http;

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final http.Client _client;
  final String _url;

  AuthRemoteDataSourceImpl({http.Client? client, required String url})
    : _client = client ?? http.Client(),
      _url = url;

  @override
  Future<UserDto> registerUser({
    required String email,
    required String password,
  }) async {

    final response = await _client.post(
      Uri.parse(_url),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
      },
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );

    final json = await jsonDecode(response.body);
    return UserDto.fromJson(json);
  }
}
