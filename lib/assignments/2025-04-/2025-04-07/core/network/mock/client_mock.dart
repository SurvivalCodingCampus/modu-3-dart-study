import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:modu_3_dart_study/assignments/2025-04-/2025-04-07/core/costants/api/api_urls.dart';

class ClientMock {
  static Future<http.Client> mockClient() async {
    final client = MockClient((req) async {
      final baseUrl = ApiUrls.userBaseUrl;

      if (req.url.toString() == baseUrl) {
        final json = jsonDecode(req.body);
        final email = json['email'];
        final password = json['password'];
        if(password == '123456'){
          return http.Response('Network Error', 500);
        }
        return http.Response(
          jsonEncode(
            {
              'id': '1',
              'email': email,
              'password': password,
              'created_at': DateTime.now().toString(),
            },
          ),
          200,
        );
      }
      return http.Response('Not Found', 404);
    });
    return client;
  }
}
