import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

Map<String, dynamic> movies = {
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

final http.Client mockClient = MockClient((request) async {
  String url = request.url.toString();

  if (url == 'https://jsonplaceholder.typicode.com/todos') {
    return http.Response(
      jsonEncode([
        {'id': 1, 'title': 'Test Todo 1', 'completed': false},
        {'id': 2, 'title': 'Test Todo 2', 'completed': true},
      ]),
      200,
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
      },
    );
  } else if (url == 'https://jsonplaceholder.typicode.com/todos/1') {
    return http.Response(
      jsonEncode({'id': 1, 'title': 'Test Todo 1', 'completed': false}),
      200,
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
      },
    );
  } else if (url ==
      'https://api.themoviedb.org/3/movie/upcoming?api_key=a64533e7ece6c72731da47c9c8bc691f&language=ko-KR&page=1') {
    return http.Response(
      jsonEncode(movies),
      200,
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
      },
    );
  } else {
    return http.Response('Not Found', 404);
  }
});
