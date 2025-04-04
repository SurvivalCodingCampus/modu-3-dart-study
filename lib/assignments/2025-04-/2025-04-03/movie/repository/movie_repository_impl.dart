import 'package:modu_3_dart_study/assignments/2025-04-/2025-04-03/movie/data_source/movie_data_source.dart';
import 'package:modu_3_dart_study/assignments/2025-04-/2025-04-03/movie/model/movie.dart';
import 'package:modu_3_dart_study/assignments/2025-04-/2025-04-03/movie/repository/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieDataSource _dataSource;

  MovieRepositoryImpl(this._dataSource);

  @override
  Future<List<Movie>> getMovieInfoList() async {
    final mapList = await _dataSource.getUpcomingMovies();
    final movies = mapList.map((e) => Movie.fromJson(e)).toList();
    return movies;
  }
}
