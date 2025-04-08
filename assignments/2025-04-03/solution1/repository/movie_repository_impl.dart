import '../data_source/movie_data_source.dart';
import '../model/movie.dart';
import 'movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieDataSource dataSource;

  @override
  Future<List<Movie>> getMovieInfoList() async {
    final List<Map<String, dynamic>> data =
        await dataSource.getUpcomingMovies();

    return data.map((e) => Movie.fromJson(e)).toList();
  }

  const MovieRepositoryImpl({required this.dataSource});
}
