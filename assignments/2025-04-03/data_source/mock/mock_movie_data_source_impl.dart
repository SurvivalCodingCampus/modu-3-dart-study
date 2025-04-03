import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

import '../movie_data_source.dart';

class MockMovieDataSourceImpl implements MovieDataSource {
  @override
  Future<List<Map<String, dynamic>>> getMovies() async {
    final client = MockClient((request) async {
      if (request.url.toString() ==
          'https://api.themoviedb.org/3/movie/upcoming?api_key=a64533e7ece6c72731da47c9c8bc691f&language=ko-KR&page=1') {
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
                {
                  "id": 939244,
                  "title": "수퍼 소닉 4",
                  "overview": "너클즈, 테일즈와 함께 평화로운 일상을 보내던 초특급 히어로 소닉4...",
                  "release_date": "2025-12-19",
                },
              ],
            }),
          ),
          200,
        );
      }
      return http.Response('Not Found', 404);
    });

    final response = await client.get(
      Uri.parse(
        'https://api.themoviedb.org/3/movie/upcoming?api_key=a64533e7ece6c72731da47c9c8bc691f&language=ko-KR&page=1',
      ),
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(utf8.decode(response.bodyBytes));
      return (jsonData['results'] as List).cast<Map<String, dynamic>>();
    } else {
      throw Exception('Mock API 요청 실패: ${response.statusCode}');
    }
  }
}
