import 'dart:convert';
import 'package:http/testing.dart';
import 'package:http/http.dart' as http;
import 'package:modu_3_dart_study/data_source/25-04-03/movie_data_source/movie_data_source_impl.dart';
import 'package:modu_3_dart_study/repository/25-04-03/movie_repository/movie_repository_impl.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';
import '../../assignments/2025-03-27/movie.dart';

void main() async {
  group('Movie_test', () {
    late MovieRepositoryImpl repository;
    late MovieDataSourceImpl dataSource;
    late MockClient mockClient;
    setUp(() {
      final mockClient = MockClient((request) async {
        if (request.url.toString() ==
            'https://api.themoviedb.org/3/movie/upcoming?api_key=a64533e7ece6c72731da47c9c8bc691f&language=ko-KR&page=1') {
          return http.Response.bytes(
            utf8.encode(
              jsonEncode({
                "results": [
                  {
                    "id": 939243,
                    "title": "수퍼 소닉 3",
                    "overview": "너클즈, 테일즈와 함께 평화로운 일상을 보내던 초특급 히어로 소닉...",
                    "release_date": "2024-12-19",
                  },
                ],
              }),
            ),
            200,
          );
        }
        return http.Response('Not Found', 404);
      });
      dataSource = MovieDataSourceImpl(client: mockClient);
      repository = MovieRepositoryImpl(dataSource: dataSource);
    });

    test('영화 목록 가져오기 성공', () async {
      final movies = await repository.getMovieInfoList();
      print(movies);
      expect(movies.length, 1);
      expect(movies[0].title, '수퍼 소닉 3');
    });
  });
}
