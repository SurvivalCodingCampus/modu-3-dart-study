import 'package:modu_3_dart_study/PR2025-04-03/movie/data_source/mock/mock_http_client_impl.dart';
import 'package:modu_3_dart_study/PR2025-04-03/movie/repository/movie_repository.dart';
import 'package:modu_3_dart_study/PR2025-04-03/movie/repository/movie_repository_impl.dart';
import 'package:test/test.dart';

void main() {
  const int id = 939243;
  const String title = '수퍼 소닉 3';
  const String overview = '너클즈, 테일즈와 함께 평화로운 일상을 보내던 초특급 히어로 소닉...';
  const String release_dat = '2024-12-19';

  group('Mock데이터로 Movie Test', () {
    MockHttpClientImpl mockHttpClientImpl = MockHttpClientImpl();
    MovieRepository repository = MovieRepositoryImpl(mockHttpClientImpl);
    test('Mock데이터로 Movie Test', () async {
      final movie = await repository.getMovieInfoList();
      expect(movie.first.id, id);
      expect(movie.first.title, title);
      expect(movie.first.overview, overview);
      expect(movie.first.releaseDate, release_dat);
    });
  });
}
