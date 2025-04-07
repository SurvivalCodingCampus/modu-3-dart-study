import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

MockClient mockClient(bool success, Map<String, dynamic> json) {
  return MockClient((request) async {
    if (success) {
      return http.Response(
        jsonEncode(json),
        200,
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
        },
      );
    } else {
      return http.Response(
        'Internal Server Error',
        500,
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
        },
      );
    }
  });
}
