import '../data_source/movie_data_source.dart';
import '../data_source/movie_data_source_impl.dart';
import '../model/movie.dart';
import 'movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieDataSource _movieDataSource;

  MovieRepositoryImpl({required MovieDataSource movieDataSource})
    : _movieDataSource = movieDataSource;

  @override
  Future<List<Movie>> getMovieInfoList() async {
    final res = await _movieDataSource.getUpcomingMovies();

    return res.map((e) => Movie.fromJson(e)).toList();
  }
}

void main() async {
  final repository = MovieRepositoryImpl(
    movieDataSource: MovieDataSourceImpl(),
  );

  final movies = await repository.getMovieInfoList();

  print(movies);
}
