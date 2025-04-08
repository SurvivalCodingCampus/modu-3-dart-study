import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:modu_3_dart_study/data_source/25-04-07/auth_remote_data_source.dart';
import 'package:modu_3_dart_study/dto/25-04-07/user_dto.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final http.Client client;
  AuthRemoteDataSourceImpl({http.Client? client})
    : client = client ?? http.Client();
  @override
  Future<UserDto> registerUser({
    required String email,
    required String password,
  }) async {
    final response = await client.get(
      Uri.parse('http:// iron.httpneunubseo.com'),
    );
    if (response.statusCode == 200) {
      return UserDto.fromJson(jsonDecode(response.body));
    } else {
      throw ('서버 에러');
    }
  }
}
