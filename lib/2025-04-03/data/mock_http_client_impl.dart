import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

import '../data_source/movie_data_source.dart';
import '../data_source/todo_data_source_impl.dart';

class MockHttpClientImpl implements MovieDataSource {
  @override
  Future<List<Map<String, dynamic>>> getUpcomingMovies() async {
    final client = MockClient((request) async {
      if (request.url.toString().contains(
        'api.themoviedb.org/3/movie/upcoming',
      )) {
        return http.Response(
          json.encode([
            {
              'id': 1,
              'title': '테스트 영화 1',
              'overview': '테스트 영화 설명',
              'release_date': '2025-05-01',
            },
            {
              'id': 2,
              'title': '테스트 영화 2',
              'overview': '두 번째 테스트 영화 설명',
              'release_date': '2025-05-15',
            },
          ]),
          200,
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
          },
        );
      }
      return http.Response('Not Found', 404);
    });

    // 영화 데이터 목업 응답 반환
    Map<String, dynamic> jsonMap = {
      'results': [
        {
          'id': 1,
          'title': '테스트 영화 1',
          'overview': '테스트 영화 설명',
          'release_date': '2025-05-01',
        },
        {
          'id': 2,
          'title': '테스트 영화 2',
          'overview': '두 번째 테스트 영화 설명',
          'release_date': '2025-05-15',
        },
      ],
    };
    List<dynamic> jsonList = jsonMap['result'];
    return jsonList.map((e) => e as Map<String, dynamic>).toList();
  }
}
