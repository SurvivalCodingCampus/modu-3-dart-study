import '../../../model/25-04-03/movie.dart';

abstract interface class MovieRepository {
  Future<List<Movie>> getMovieInfoList();
}
