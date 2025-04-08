import 'dart:convert';
import 'package:modu_3_dart_study/assignments/2025-04-/2025-04-07/core/costants/api/api_urls.dart';
import 'package:modu_3_dart_study/assignments/2025-04-/2025-04-07/auth/data_source/auth_data_source.dart';
import 'package:modu_3_dart_study/assignments/2025-04-/2025-04-07/auth/dto/user_dto.dart';
import 'package:http/http.dart' as http;

class AuthDataSourceImpl implements AuthDataSource {
  final String _path = ApiUrls.userBaseUrl;
  final http.Client _client;

  AuthDataSourceImpl(this._client);

  @override
  Future<UserDto> registerUser({
    required String email,
    required String password,
  }) async {
    final resp = await _client.post(
      Uri.parse(_path),
      body: jsonEncode({'email': email, 'password': password}),
    );
    return UserDto.fromJson(jsonDecode(resp.body));
  }
}
