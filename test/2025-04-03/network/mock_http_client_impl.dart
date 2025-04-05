import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

class MockHttpClientImpl {
  final String urlString;
  final dynamic body;

  MockHttpClientImpl({required this.urlString, required this.body});

  MockClient get mockClient {
    return MockClient((request) async {
      if (request.url.toString() == urlString) {
        return http.Response.bytes(utf8.encode(jsonEncode(body)), 200);
      } else {
        return http.Response('Not Found', 404);
      }
    });
  }
}

