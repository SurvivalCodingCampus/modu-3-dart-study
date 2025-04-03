import 'dart:convert';

import 'movie_data_source.dart';
import 'package:http/http.dart' as http;

class MovieDataSourceImpl implements MovieDataSource {
  final apiUrl =
      'https://api.themoviedb.org/3/movie/upcoming?api_key=a64533e7ece6c72731da47c9c8bc691f&language=ko-KR&page=1';
  @override
  Future<List<Map<String, dynamic>>> getUpcomingMovies() async {
    final response = await http.get(Uri.parse(apiUrl));

    final Map<String, dynamic> movies = jsonDecode(response.body);
    final List<dynamic> resultMovieList = movies['results'];

    return resultMovieList.map((e) => e as Map<String, dynamic>).toList();
  }
}
