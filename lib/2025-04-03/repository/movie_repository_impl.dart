import 'package:modu_3_dart_study/2025-04-03/data_source/movie_data_source.dart';
import 'package:modu_3_dart_study/2025-04-03/model/movie.dart';
import 'package:modu_3_dart_study/2025-04-03/repository/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieDataSource dataSource;

  MovieRepositoryImpl({required this.dataSource});

  @override
  Future<List<Movie>> fetchUpcomingMovies() {
    return dataSource.getUpcomingMovies();
  }
}