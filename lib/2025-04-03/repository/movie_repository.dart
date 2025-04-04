import '../model/movieList.dart';

abstract interface class MovieRepository {
  Future<MovieList> getMovieInfoList();
}