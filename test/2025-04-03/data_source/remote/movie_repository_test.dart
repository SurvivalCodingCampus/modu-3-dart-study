import 'package:modu_3_dart_study/2025-04-03/config/api_config.dart';
import 'package:modu_3_dart_study/2025-04-03/data_source/movie_data_source.dart';
import 'package:modu_3_dart_study/2025-04-03/data_source/remote/movie_data_source_impl.dart';
import 'package:modu_3_dart_study/2025-04-03/model/movieList.dart';
import 'package:modu_3_dart_study/2025-04-03/repository/movie_repository.dart';
import 'package:modu_3_dart_study/2025-04-03/repository/movie_repository_impl.dart';
import 'package:test/test.dart';

import '../../network/mock_http_client_impl.dart';

void main() {
  group('Mock을 활용한 MovieRepository 테스트', () {
    const body = {
      "results": [
        {
          "id": 939243,
          "title": "수퍼 소닉 3",
          "overview": "너클즈, 테일즈와 함께 평화로운 일상을 보내던 초특급 히어로 소닉...",
          "release_date": "2024-12-19",
        },
      ],
    };
    final urlString = ApiConfig.movieUrlString();

    final mockHttpClient = MockHttpClientImpl(urlString: urlString, body: body);
    final MovieDataSource movieDataSource = MovieDataSourceImpl(client: mockHttpClient.mockClient);
    final MovieRepository repository = MovieRepositoryImpl(movieDataSource: movieDataSource);

    test('MovieList가 정상적으로 반환되어야 한다.', () async {
      final movieList = await repository.getMovieInfoList();

      final json = body;
      final anotherMovieList = MovieList.fromJson(json);

      expect(movieList.results.length, equals(anotherMovieList.results.length));

      if (movieList.results.isNotEmpty) {
        expect(movieList.results.first.id, anotherMovieList.results.first.id);
      }
    });
  });
}