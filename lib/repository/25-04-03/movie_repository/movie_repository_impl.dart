import 'package:modu_3_dart_study/model/25-04-03/movie.dart';

import '../../../data_source/25-04-03/movie_data_source/movie_data_source.dart';
import '../../../data_source/25-04-03/movie_data_source/movie_data_source_impl.dart';
import 'movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieDataSource dataSource;

  MovieRepositoryImpl({required this.dataSource});

  @override
  Future<List<Movie>> getMovieInfoList() async {
    final List<Map<String, dynamic>> movieList =
        await dataSource.getUpcomingMovies();

    final List<Movie> movies = movieList.map((e) => Movie.fromJson(e)).toList();
    return movies;
  }
}

void main() async {
  final repository = MovieRepositoryImpl(dataSource: MovieDataSourceImpl());
  final results = await repository.getMovieInfoList();
}
