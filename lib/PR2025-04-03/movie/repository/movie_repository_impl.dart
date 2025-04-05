import 'package:modu_3_dart_study/PR2025-04-03/movie/data_source/movie_data_source.dart';
import 'package:modu_3_dart_study/PR2025-04-03/movie/model/movie.dart';

import 'movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  //캡슐화 까먹지 않기
  final MovieDataSource _movieDataSource;

  const MovieRepositoryImpl({required MovieDataSource movieDataSource})
    : _movieDataSource = movieDataSource;

  @override
  Future<List<Movie>> getMovieInfoList() async {
    final movieList = await _movieDataSource.getUpcomingMovies();
    List<Movie> movie = movieList.map((e) => Movie.fromJson(e)).toList();
    return movie;
  }
}
