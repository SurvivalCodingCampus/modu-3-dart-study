import 'package:modu_3_dart_study/2025-04-02/data_source/movie_data_source.dart';
import 'package:modu_3_dart_study/2025-04-02/model/movie.dart';
import 'package:modu_3_dart_study/2025-04-02/repository/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieDataSource movieDataSource;

  const MovieRepositoryImpl({required this.movieDataSource});

  @override
  Future<List<Movie>> getMovieInfoList() async {
    final movieList = await movieDataSource.getUpcomingMovie();

    List<Movie> movies = movieList.map((e) => Movie.fromJson(e)).toList();
    return movies;
  }
}
