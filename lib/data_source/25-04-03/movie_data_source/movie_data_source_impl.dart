import 'dart:convert';

import 'package:http/http.dart' as http;

import 'movie_data_source.dart';

class MovieDataSourceImpl implements MovieDataSource {
  final http.Client client;
  MovieDataSourceImpl({http.Client? client}) : client = client ?? http.Client();
  @override
  Future<List<Map<String, dynamic>>> getUpcomingMovies() async {
    final response = await client.get(
      Uri.parse(
        'https://api.themoviedb.org/3/movie/upcoming?api_key=a64533e7ece6c72731da47c9c8bc691f&language=ko-KR&page=1',
      ),
    );

    if (response.statusCode == 200) {
      final decoded = utf8.decode(response.bodyBytes);
      return List<Map<String, dynamic>>.from(json.decode(decoded)['results']);
    } else {
      throw ('로드 실패');
    }
  }
}
