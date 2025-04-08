import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:modu_3_dart_study/assignments/2025-04-07/user/data_source/auth_data_source.dart';
import 'package:modu_3_dart_study/assignments/2025-04-07/user/dto/user_dto.dart';

class MockAuthRemoteDataSourceImpl implements AuthDataSource {
  final http.Client _client;
  final String _url;

  MockAuthRemoteDataSourceImpl({
    required http.Client client,
    required String url,
  }) : _client = client,
       _url = url;
  @override
  Future<UserDto> registerUser(Map<String, dynamic> userMap) async {
    try {
      final response = await _client.post(
        Uri.parse(_url),
        body: jsonEncode(userMap),
        headers: {'Content-Type': 'application/json'},
      );
      if (response.statusCode == 200) {
        return UserDto(id: '0', password: '123456', email: 'test@test.com');
      } else if (response.statusCode == 201) {
        return UserDto(
          id: '0',
          password: '123456',
          email: 'test@test.com',
          errorMessage: '201',
        );
      } else {
        throw Exception("HTTP 오류: ${response.statusCode} - ${response.body}");
      }
    } catch (e) {
      if (e is http.ClientException) {
        throw Exception("네트워크 오류: ${e.message}");
      } else if (e is FormatException) {
        throw Exception("응답 형식 오류: ${e.message}");
      } else {
        throw Exception("사용자 등록 중 오류 발생: $e");
      }
    }
  }
}
