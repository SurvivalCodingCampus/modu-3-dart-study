import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:test/test.dart';

import '../../assignments/2025-04-03/movie/data_source/movie_data_source.dart';
import '../../assignments/2025-04-03/movie/data_source/movie_data_source_impl.dart';
import '../../assignments/2025-04-03/movie/repository/movie_repository.dart';
import '../../assignments/2025-04-03/movie/repository/movie_repository_impl.dart';

void main() {
  test('Movie test', () async {
    final String url =
        'https://api.themoviedb.org/3/movie/upcoming?api_key=a64533e7ece6c72731da47c9c8bc691f&language=ko-KR&page=1';
    MovieDataSource movieDataSource = MovieDataSourceImpl(url: url);
    MovieRepository movieRepository = MovieRepositoryImpl(
      dataSource: movieDataSource,
    );
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
    final result = await mockMovieRepository.getMovieInfoList();
    print(result);
    expect(result.first.id, 939243);
    expect(result.first.title, '수퍼 소닉 3');
  });
}
