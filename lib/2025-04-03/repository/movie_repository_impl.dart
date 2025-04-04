import '../data_source/movie_data_source.dart';
import '../model/movieList.dart';
import 'movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieDataSource _movieDataSource;

  const MovieRepositoryImpl({required MovieDataSource movieDataSource}) : _movieDataSource = movieDataSource;

  @override
  Future<MovieList> getMovieInfoList() async {
    final json = await _movieDataSource.getUpcomingMovies();
    return MovieList.fromJson(json);
  }
}
