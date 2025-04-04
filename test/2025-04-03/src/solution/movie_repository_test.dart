import 'package:modu_3_dart_study/assignments/2025-04-03/src/solution/model/movie.dart';
import 'package:modu_3_dart_study/assignments/2025-04-03/src/solution/repository/movie_repository_impl.dart';
import 'package:test/test.dart';

import 'mock/mock_movie_data_source_impl.dart';

void main() {
  group('Movie Repository Test', () {
    test('모든 영화 정보를 가져와야 한다', () async {
      final dataSource = MockMovieDataSourceImpl();
      final repository = MovieRepositoryImpl(movieDataSource: dataSource);

      final movies = await repository.getMovieInfoList();

      final expected = await dataSource.getUpcomingMovies();

      expect(movies, isA<List<Movie>>());
      expect(movies.length, expected.length); // 목데이터의 리스트 크기
      for (int i = 0; i < expected.length; i++) {
        expect(movies[i].id, expected[i]['id']);
        expect(movies[i].title, expected[i]['title']);
        expect(movies[i].overview, expected[i]['overview']);
        expect(movies[i].releaseDate, expected[i]['release_date']);
      }
    });
  });
}
