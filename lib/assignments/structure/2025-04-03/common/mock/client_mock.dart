import 'dart:convert';
import 'package:modu_3_dart_study/assignments/structure/2025-04-03/common/const/api_url.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

class ClientMock {
  static Future<http.Client> mockResp() async {
    final client = MockClient((req) async {
    final todoBaseUrl = ApiUrl.todoBaseUrl;

    if (req.url.toString() == todoBaseUrl) {
      return http.Response(
        jsonEncode([
          {'id': 1, 'title': 'Test Todo 1', 'completed': false},
          {'id': 2, 'title': 'Test Todo 2', 'completed': true},
        ]),
        200,
      );
    } else if (req.url.toString() == todoBaseUrl + '/1') {
      return http.Response(
        jsonEncode({'id': 1, 'title': 'Test Todo 1', 'completed': false}),
        200,
      );
    }
    return http.Response('Not Found', 404);
  });
  return client;
  }
}
