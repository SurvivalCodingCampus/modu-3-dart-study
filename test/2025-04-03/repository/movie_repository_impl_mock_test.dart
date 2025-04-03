import 'package:modu_3_dart_study/2025-04-03/data_source/mock_movie_data_source_impl.dart';
import 'package:modu_3_dart_study/2025-04-03/repository/movie_repository_impl.dart';
import 'package:test/test.dart';

void main() {
  test('🧪 Mock 기반 MovieRepositoryImpl 단위 테스트', () async {
    final mockDataSource = MockMovieDataSourceImpl();
    final repository = MovieRepositoryImpl(dataSource: mockDataSource);

    try {
      final movies = await repository.getMovieInfoList();

      final safeMovies =
          movies
              .where(
                (m) =>
                    m.title.isNotEmpty &&
                    m.overview.isNotEmpty &&
                    m.releaseDate.isNotEmpty,
              )
              .toList();

      print('🧾 전체 파싱된 영화 수: ${movies.length}');
      print('✅ 유효한 영화 수 (비어있지 않은 필드 기준): ${safeMovies.length}');
      print('---');

      for (var i = 0; i < safeMovies.length && i < 3; i++) {
        final m = safeMovies[i];
        print('🎬 #$i → ${m.title} | 개봉일: ${m.releaseDate}');
      }

      expect(safeMovies.length, equals(4));
    } catch (e) {
      fail('❌ 테스트 실패: ${e.toString()}');
    }
  });
}
