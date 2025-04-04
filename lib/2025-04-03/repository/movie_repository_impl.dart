import '../data_source/movie_data_source.dart';
import '../model/movie.dart';
import '../response/movie_response.dart';
import 'movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieDataSource _dataSource;

  MovieRepositoryImpl({required MovieDataSource dataSource})
    : _dataSource = dataSource;

  @override
  Future<List<Movie>> getMovieInfoList() async {
    final json = await _dataSource.getUpcomingMovies();
    final response = MovieResponse.fromJson(json);
    return response.results;
  }
}
