import '../data_source/movie_data_source.dart';
import '../model/movie.dart';
import 'movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieDataSource _movieDataSource;

  MovieRepositoryImpl(this._movieDataSource);

  @override
  Future<List<Movie>> getMovieInfoList() async {
    final resultMovieList = await _movieDataSource.getUpcomingMovies();
    List<Movie> movieList = [];

    for (var movie in resultMovieList) {
      movieList.add(Movie.fromJson(movie));
    }
    return movieList;
  }
}
