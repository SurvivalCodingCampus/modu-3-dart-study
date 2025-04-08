import 'dart:convert';

import '../data_source/movie_data_source.dart';
import '../data_source/movie_data_source_impl.dart';
import '../model/movie.dart';
import 'movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieDataSource _movieDataSource;

  const MovieRepositoryImpl(this._movieDataSource);

  @override
  Future<List<Movie>> getMovies() async {
    final results = await _movieDataSource.getMovies();

    final List<Movie> movies =
        results.map<Movie>((json) => Movie.fromJson(json)).toList();

    return movies;
  }

  // @override
  // Future<List<Movie>> getMovies() async {
  //   final response = await _movieDataSource.get();

  //   final List<dynamic>? results = response['results']; // null 일수 있음,,;;;
  //   if (results == null) {
  //     throw FormatException('JSON 파싱 실패: "results" 필드가 존재하지 않음');
  //   }

  //   final List<Movie> movies =
  //       results
  //           .map<Movie>((json) => Movie.fromJson(json as Map<String, dynamic>))
  //           .toList();

  //   return movies;
  // }
}

// void main() async {
//   MovieRepository movieRepo = MovieRepositoryImpl(MovieDataSourceImpl());
//   List<Movie> movies = await movieRepo.getMovies();

//   print(movies);
// }
