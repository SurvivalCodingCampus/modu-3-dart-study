import 'dart:convert';

import 'package:http/http.dart' as http;

import 'movie_data_source.dart';

class MovieDataSourceImpl implements MovieDataSource {
  final http.Client httpClient;

  MovieDataSourceImpl({required this.httpClient});

  @override
  Future<Map<String, dynamic>> getUpcomingMovies() async {
    final response = await httpClient.get(
      Uri.parse(
        'https://api.themoviedb.org/3/movie/upcoming?api_key=a64533e7ece6c72731da47c9c8bc691f&language=ko-KR&page=1',
      ),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('영화 데이터를 불러오지 못했습니다');
    }
  }
}
