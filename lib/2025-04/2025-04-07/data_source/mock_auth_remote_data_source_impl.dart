import 'dart:convert';

import 'package:modu_3_dart_study/2025-04/2025-04-07/data_source/auth_remote_data_source.dart';
import 'package:modu_3_dart_study/2025-04/2025-04-07/dto/user_dto.dart';
import 'package:http/http.dart' as http;

class MockAuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final http.Client _client;

  const MockAuthRemoteDataSourceImpl(this._client);

  @override
  Future<UserDto> registerUser({
    required String email,
    required String password,
  }) async {
    final http.Response data = await _client.get(Uri.parse(''));

    if (data.statusCode == 200) {
      return UserDto.fromJson(jsonDecode(data.body));
    }

    throw Exception('network error');
  }
}
