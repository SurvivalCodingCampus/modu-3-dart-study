import 'package:modu_3_dart_study/PR2025-04-03/movie/data_source/movie_data_source.dart';
import 'package:modu_3_dart_study/PR2025-04-03/movie/model/movie.dart';
import 'movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieDataSource movieDataSource;

  MovieRepositoryImpl(this.movieDataSource);

  @override
  Future<List<Movie>> getMovieInfoList() async {
    final movies = await movieDataSource.getUpcomingMovies();
    List<Movie> moviesList = movies.map((e) => Movie.fromJson(e)).toList();
    return moviesList;
  }
}
