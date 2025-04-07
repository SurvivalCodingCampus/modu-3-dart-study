import 'package:modu_3_dart_study/2025-04-03/solution1/data_source/movie_data_source.dart';
import 'package:modu_3_dart_study/2025-04-03/solution1/model/movie.dart';
import 'package:modu_3_dart_study/2025-04-03/solution1/repository/movie_repository.dart';

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
