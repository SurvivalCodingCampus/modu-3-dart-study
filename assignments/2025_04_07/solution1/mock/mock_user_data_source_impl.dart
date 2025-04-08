import 'dart:convert';
import 'dart:io';

import '../data_source/auth_retmote_data_source.dart';
import '../dto/user_dto.dart';
import 'package:http/http.dart' as http;

class MockUserDataSourceImpl implements AuthRetmoteDataSource {
  final http.Client _client;

  MockUserDataSourceImpl({required http.Client client}) : _client = client;

  @override
  Future<UserDto> registerUser({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _client.post(
        Uri.parse(''),
        body: jsonEncode({'email': email, 'password': password}),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
        },
      );
      if (response.statusCode != 200) {
        return UserDto(errorMessage: '');
      }
      return UserDto(errorMessage: '');
    } catch (e) {
      return UserDto(errorMessage: '');
    }
  }
}
