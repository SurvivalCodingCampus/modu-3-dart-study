import 'package:modu_3_dart_study/2025-04-03/model/movie.dart';

abstract class MovieRepository {
  Future<List<Movie>> fetchUpcomingMovies();
}