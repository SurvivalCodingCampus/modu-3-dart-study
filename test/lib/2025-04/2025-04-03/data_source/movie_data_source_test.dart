import 'package:modu_3_dart_study/2025-04/2025-04-03/data_source/movie_data_source.dart';
import 'package:modu_3_dart_study/2025-04/2025-04-03/data_source/movie_data_source_impl.dart';
import 'package:test/test.dart';

import '../mock/mock_http_client.dart' show mockClient;

void main() {
  const String url =
      'https://api.themoviedb.org/3/movie/upcoming?api_key=a64533e7ece6c72731da47c9c8bc691f&language=ko-KR&page=1';
  final MovieDataSource source = MovieDataSourceImpl(mockClient);

  test(
    'API 호출을 통해 영화 정보를 List<Map<String, dynamic>> 형태로 가져올 수 있어야한다.',
    () async {
      final List<Map<String, dynamic>> movies = await source.getUpcomingMovies(
        url,
      );

      expect(movies, isA<List<Map<String, dynamic>>>());
      expect(movies.length, 2);
    },
  );
}
