import 'package:modu_3_dart_study/2025-04/2025-04-03/data_source/movie_data_source.dart';
import 'package:modu_3_dart_study/2025-04/2025-04-03/movie.dart';
import 'package:modu_3_dart_study/2025-04/2025-04-03/repository/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieDataSource _dataSource;

  MovieRepositoryImpl(this._dataSource);

  @override
  Future<List<Movie>> getMovieInfoList() async {
    List<Map<String, dynamic>> movies = await _dataSource.getUpcomingMovies(
      'https://api.themoviedb.org/3/movie/upcoming?api_key=a64533e7ece6c72731da47c9c8bc691f&language=ko-KR&page=1',
    );

    return movies.map((e) => Movie.fromJson(e)).toList();
  }
}
