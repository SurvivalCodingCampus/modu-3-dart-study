import 'package:modu_3_dart_study/assignments/2025-04-03/src/solution/model/movie.dart';
import 'package:modu_3_dart_study/assignments/2025-04-03/src/solution/repository/movie_repository_impl.dart';
import 'package:test/test.dart';

import 'mock/mock_movie_data_source_impl.dart';

void main() {
  group('Movie Repository Test', () {
    test('모든 영화 정보를 가져와야 한다', () async {
      final repository = MovieRepositoryImpl(
        movieDataSource: MockMovieDataSourceImpl(),
      );

      final movies = await repository.getMovieInfoList();

      expect(movies, isA<List<Movie>>());
      expect(movies.length, 10);
    });
  });
}
