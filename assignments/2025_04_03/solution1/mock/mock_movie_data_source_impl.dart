import 'dart:convert';
import 'dart:io';

import '../data_source/movie_data_source.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

class MockMovieDataSourceImpl implements MovieDataSource {
  @override
  Future<List<Map<String, dynamic>>> getUpcomingMovies() async {
    final client = MockClient((request) async {
      if (request.url.toString() ==
          'https://jsonplaceholder.typicode.com/movies') {
        return http.Response(
          jsonEncode([
            {
              'id': 944644,
              'title': '말 할 수 없는 비밀',
              'overview': '피아노 잘침',
              'release_date': '2025-04-03',
            },
            {
              'id': 846531,
              'title': '소방관',
              'overview': '감동적임',
              'release_date': '2025-04-02',
            },
            {
              'id': 455613,
              'title': '서브스턴스',
              'overview': '기괴함',
              'release_date': '2025-04-01',
            },
            {
              'id': 764311,
              'title': '늘봄가든',
              'overview': '무서움',
              'release_date': '2025-04-04',
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

    final response = await client.get(
      Uri.parse('https://jsonplaceholder.typicode.com/movies'),
    );
    if (response.statusCode == 200) {
      return (jsonDecode(response.body) as List)
          .map((e) => e as Map<String, dynamic>)
          .toList();
    } else {
      throw Exception('Failed to load todos');
    }
  }
}
