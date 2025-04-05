import 'package:modu_3_dart_study/2025-04-03/exam/exam_01/data_source/movie_data_source.dart';
import 'package:modu_3_dart_study/2025-04-03/exam/exam_01/model/movie.dart';
import 'package:modu_3_dart_study/2025-04-03/exam/exam_01/repository/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieDataSource _movieDataSource;

  const MovieRepositoryImpl({required MovieDataSource movieDataSource})
    : _movieDataSource = movieDataSource;

  @override
  Future<List<Movie>> getMovieInfoList() async {
    final movieJsonList = await _movieDataSource.getUpcomingMovies();
    return movieJsonList.map((e) => Movie.fromJson(e)).toList();
  }
}
