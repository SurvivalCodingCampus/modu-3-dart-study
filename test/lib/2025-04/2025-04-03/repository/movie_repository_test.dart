import 'package:modu_3_dart_study/2025-04/2025-04-03/data_source/movie_data_source.dart';
import 'package:modu_3_dart_study/2025-04/2025-04-03/data_source/movie_data_source_impl.dart';
import 'package:modu_3_dart_study/2025-04/2025-04-03/model/movie.dart'
    show Movie;
import 'package:modu_3_dart_study/2025-04/2025-04-03/repository/movie_repository.dart';
import 'package:modu_3_dart_study/2025-04/2025-04-03/repository/movie_repository_impl.dart';
import 'package:test/test.dart';

import '../mock/mock_http_client.dart' show mockClient;

void main() {
  final MovieDataSource source = MovieDataSourceImpl(mockClient);
  final MovieRepository repository = MovieRepositoryImpl(source);

  test('영화 정보를 Movie 객체 형태로 가져올 수 있어야한다.', () async {
    List<Movie> movies = await repository.getMovieInfoList();

    expect(movies, isA<List<Movie>>());
    expect(movies.first.title, equals('수퍼 소닉 3'));
  });
}
