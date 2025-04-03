import 'dart:convert';

import 'package:http/http.dart' as http;

import 'movie/data_source/movie_data_source.dart';
import 'movie/data_source/movie_data_source_impl.dart';
import 'movie/repository/movie_repository.dart';
import 'movie/repository/movie_repository_impl.dart';

import 'package:http/testing.dart';

void main(List<String> args) async {
  final String url =
      'https://api.themoviedb.org/3/movie/upcoming?api_key=a64533e7ece6c72731da47c9c8bc691f&language=ko-KR&page=1';
  MovieDataSource movieDataSource = MovieDataSourceImpl(url: url);
  MovieRepository movieRepository = MovieRepositoryImpl(
    dataSource: movieDataSource,
  );
  // final temp = await movieDataSource.getUpcomingMovies();
  // print(temp);
  // final temp2 = await movieRepository.getMovieInfoList();
  // print(temp2);
  // print(temp2.length);

  // print(jsonEncode(MovieDataSourceImpl.testData));

  // print(utf8.encode(jsonEncode(MovieDataSourceImpl.testData)));
  // print(utf8.decode(utf8.encode(jsonEncode(MovieDataSourceImpl.testData))));

  final mockClient = MockClient((request) async {
    if (request.url.toString() ==
        'https://api.themoviedb.org/3/movie/upcoming?api_key=a64533e7ece6c72731da47c9c8bc691f&language=ko-KR&page=1') {
      final response = http.Response.bytes(
        utf8.encode(MovieDataSourceImpl.testData),
        200,
        // headers: {'Content-Type': 'application/json; charset=utf-8'},
      );

      return response;
    }
    return http.Response('Not Found', 404);
  });

  MovieDataSource mockMovieDataSource = MovieDataSourceImpl(
    url: url,
    client: mockClient,
  );
  MovieRepository mockMovieRepository = MovieRepositoryImpl(
    dataSource: mockMovieDataSource,
  );
  try {
    final temp3 = await mockMovieRepository.getMovieInfoList();
    print(temp3);
  } catch (e) {
    throw Exception(e);
  }
}
