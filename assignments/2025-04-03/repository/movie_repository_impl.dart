import '../data_source/movie_data_source.dart';
import '../model/movie.dart';
import 'movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieDataSource movieDataSource;

  MovieRepositoryImpl(this.movieDataSource);

  @override
  Future<List<Movie>> getMovieInfoList() async {
    final movie = await movieDataSource.getUpcomingMovies();
    List<Movie> moviesList = movie.map((e) => Movie.fromJson(e)).toList();
    return moviesList;
  }
}
