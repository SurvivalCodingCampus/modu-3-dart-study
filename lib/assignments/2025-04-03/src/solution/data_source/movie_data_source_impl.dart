import 'dart:convert';

import 'package:http/http.dart' as http;

import 'movie_data_source.dart';

class MovieDataSourceImpl implements MovieDataSource {
  @override
  Future<List<Map<String, dynamic>>> getUpcomingMovies() async {
    final response = await http.get(
      Uri.parse(
        'https://api.themoviedb.org/3/movie/upcoming?api_key=a64533e7ece6c72731da47c9c8bc691f&language=ko-KR&page=1',
      ),
    );

    if (response.statusCode == 200) {
      final List resultsData = jsonDecode(response.body)['results'];
      return List<Map<String, dynamic>>.from(resultsData);
    }

    return [];
  }
}
