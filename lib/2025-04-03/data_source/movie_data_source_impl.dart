import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:modu_3_dart_study/2025-04-03/data_source/movie_data_source.dart';
import 'package:modu_3_dart_study/2025-04-03/model/movie.dart';

class MovieDataSourceImpl implements MovieDataSource {
  final String baseUrl;
  final String apiKey;
  final String language;
  
  MovieDataSourceImpl({
    this.baseUrl = 'https://api.themoviedb.org/3/movie/upcoming',
    this.apiKey = 'a64533e7ece6c72731da47c9c8bc691f',
    this.language = 'ko-KR',
  });

  @override
  Future<List<Movie>> getUpcomingMovies() async {
    final uri = Uri.parse("$baseUrl?api_key=$apiKey&language=$language&page=1");

    try {
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List<dynamic> results = data["results"];

        return results.map((movie) => Movie.fromJson(movie)).toList();
      } else {
        throw Exception("Failed to fetch upcoming movies. Status Code: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error fetching movies: $e");
    }
  }
}