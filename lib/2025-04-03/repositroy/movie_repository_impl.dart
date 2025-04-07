import 'dart:convert';

import 'package:modu_3_dart_study/2025-04-03/data_source/movie_data_source.dart';
import 'package:modu_3_dart_study/2025-04-03/repositroy/movie_repository.dart';

import '../model/movie.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieDataSource dataSource;

  MovieRepositoryImpl(this.dataSource);

  @override
  Future<List<Movie>> getMovieInfoList() async {
    List<Map<String,dynamic>> movieSource = await dataSource.getUpcomingMovies();
    List<Movie> movies = movieSource.map((e) => Movie.fromJson(e)).toList();
    return movies;
  }
}