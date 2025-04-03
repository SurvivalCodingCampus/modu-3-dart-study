import '../data_source/movie_data_source.dart';
import '../model/movie.dart';
import 'movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieDataSource _dataSource;

  const MovieRepositoryImpl({required MovieDataSource dataSource})
    : _dataSource = dataSource;

  @override
  Future<List<Movie>> getMovieInfoList() async {
    final List<Map<String, dynamic>> jsonMap =
        await _dataSource.getUpcomingMovies();
    return jsonMap.map((e) {
      final newElement = {
        'id': e['id'],
        'title': e['title'],
        'overview': e['overview'],
        'release_date': e['release_date'],
      };
      return Movie.fromJson(newElement);
    }).toList();
  }
}
