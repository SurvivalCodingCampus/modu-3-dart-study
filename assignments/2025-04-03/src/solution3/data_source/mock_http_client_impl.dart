import 'dart:convert';

import 'package:http/testing.dart';
import 'package:http/http.dart' as http;
import 'package:modu_3_dart_study/2025-04-03/data_source/mock_http_client.dart';

class MockHttpClientImpl implements MockHttpClient {
  @override
  MockClient createMovieMockClient(String url) {
    return MockClient((request) async {
      if (request.url.toString() == url) {
        return http.Response.bytes(
          utf8.encode(
            jsonEncode({
              "results": [
                {
                  "id": 939243,
                  "title": "수퍼 소닉 3",
                  "overview": "너클즈, 테일즈와 함께 평화로운 일상을 보내던 초특급 히어로 소닉...",
                  "release_date": "2024-12-19",
                },
              ],
            }),
          ),
          200,
        );
      }
      return http.Response('Not Found', 404);
    });
  }

  @override
  MockClient createTodoMockClient(String url) {
    return MockClient((request) async {
      if (request.url.toString() == url) {
        return http.Response.bytes(
          utf8.encode(
            jsonEncode([
              {'id': 1, 'title': 'Test Todo 1', 'completed': false},
              {'id': 2, 'title': 'Test Todo 2', 'completed': true},
            ]),
          ),
          200,
        );
      }
      return http.Response('Not Found', 404);
    });
  }
}
