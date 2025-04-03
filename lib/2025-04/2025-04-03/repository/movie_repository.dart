import 'package:modu_3_dart_study/2025-04/2025-04-03/movie.dart';

abstract interface class MovieRepository {
  Future<List<Movie>> getMovieInfoList();
}
