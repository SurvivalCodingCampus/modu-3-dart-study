import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:modu_3_dart_study/2025-04-03/movie/data_source/impl/movie_data_source_impl.dart';
import 'package:modu_3_dart_study/2025-04-03/movie/model/movie.dart';
import 'package:modu_3_dart_study/2025-04-03/movie/repository/impl/movie_respository_impl.dart';
import 'package:modu_3_dart_study/2025-04-03/movie/repository/movie_respository.dart';
import 'package:test/test.dart';

import '../mock/mock_movie_data_source.dart';

void main() {
  late MockClient client;
  late MovieRespository movieRespository;

  group('영화 : ', () {
    setUp(() {
      client = MockClient((request) async {
        if (request.url.toString() == MovieDataSourceImpl.apiUrl) {
          return http.Response.bytes(
            utf8.encode(
              jsonEncode({
                'results': [
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
        } else {
          return http.Response(jsonEncode([]), 404);
        }
      });

      movieRespository = MovieRespositoryImpl(
        MockMovieDataSource(client),
        Movie(),
      );
    });
    test('조회', () async {
      final List<Movie> movies = await movieRespository.getItems();

      expect(movies.length, 1);
      expect(movies[0].id, 939243);
      expect(movies[0].title, '수퍼 소닉 3');
    });
  });
}
