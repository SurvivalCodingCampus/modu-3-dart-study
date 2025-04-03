import '../model/movie.dart';
import 'response.dart';

class MovieResponse implements Response<Movie> {
  @override
  final List<Movie> results;

  MovieResponse({required this.results});

  factory MovieResponse.fromJson(Map<String, dynamic> json) {
    final list = json['results'] ?? [];
    return MovieResponse(
      results:
          List<Map<String, dynamic>>.from(
            list,
          ).map((e) => Movie.fromJson(e)).toList(),
    );
  }
}
