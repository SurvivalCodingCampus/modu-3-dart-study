import 'dart:convert';

import 'package:http/http.dart' as http;

import 'movie_data_source.dart';

class MovieDataSourceImpl implements MovieDataSource {
  final String _path;

  MovieDataSourceImpl({
    String path =
        'https://api.themoviedb.org/3/movie/upcoming?api_key=a64533e7ece6c72731da47c9c8bc691f&language=ko-KR&page=1',
  }) : _path = path;

  @override
  Future<Map<String, dynamic>> getUpcomingMovies() async {
    final client = http.Client();
    try {
      final response = await client.get(Uri.parse(_path));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('영화 데이터를 불러오지 못했습니다');
      }
    } finally {
      client.close();
    }
  }
}
