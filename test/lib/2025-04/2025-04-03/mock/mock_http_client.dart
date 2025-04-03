import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

Map<String, dynamic> data = {
  "results": [
    {
      "id": 939243,
      "title": "수퍼 소닉 3",
      "overview": "너클즈, 테일즈와 함께 평화로운 일상을 보내던 초특급 히어로 소닉...",
      "release_date": "2024-12-19",
    },
    {
      "id": 939244,
      "title": "수퍼 소닉 3",
      "overview": "너클즈, 테일즈와 함께 평화로운 일상을 보내던 초특급 히어로 소닉...",
      "release_date": "2024-12-19",
    },
  ],
};

final http.Client mockClient = MockClient(
  (request) => Future.value(
    http.Response(
      jsonEncode(data),
      200,
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
      },
    ),
  ),
);
