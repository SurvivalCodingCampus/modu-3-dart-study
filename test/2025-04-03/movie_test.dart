import 'package:test/test.dart';

import '../../assignments/2025-04-03/data_source/mock_movie_data_source_impl.dart';
import '../../assignments/2025-04-03/repository/movie_repository_impl.dart';

void main() {
  group('Movie 목록 가져오기', () {
    final mockMovieDataSource = MockMovieDataSourceImpl();
    test('getMovies() - 성공 응답', () async {
      final movieRepository = MovieRepositoryImpl(mockMovieDataSource);

      final movies = await movieRepository.getMovies();

      expect(movies.length, 2);

      expect(movies[0].id, 939243);
      expect(movies[0].title, "수퍼 소닉 3");
      expect(movies[0].overview, "너클즈, 테일즈와 함께 평화로운 일상을 보내던 초특급 히어로 소닉...");
      expect(movies[0].releaseDate, "2024-12-19");

      expect(movies[1].id, 939244);
      expect(movies[1].title, "수퍼 소닉 4");
      expect(movies[1].overview, "너클즈, 테일즈와 함께 평화로운 일상을 보내던 초특급 히어로 소닉4...");
      expect(movies[1].releaseDate, "2025-12-19");
    });
  });
}
