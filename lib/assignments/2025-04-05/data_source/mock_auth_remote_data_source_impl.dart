import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:modu_3_dart_study/assignments/2025-04-05/data_source/auth_data_source.dart';

class MockAuthRemoteDataSourceImpl implements AuthDataSource {
  final http.Client _client;
  final String _url;

  MockAuthRemoteDataSourceImpl({
    required http.Client client,
    required String url,
  }) : _client = client,
       _url = url;
  @override
  Future<String> registerUser(Map<String, dynamic> userMap) async {
    try {
      final response = await _client.post(
        Uri.parse(_url),
        body: jsonEncode(userMap),
        headers: {'Content-Type': 'application/json'},
      );
      if (response.statusCode == 200) {
        return '성공. id : ${userMap["id"]}, email : ${userMap["email"]}';
      } else {
        throw Exception("실패. response를 받았으나 코드가 200이 아님");
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
