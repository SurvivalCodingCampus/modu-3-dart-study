import 'package:modu_3_dart_study/apr/w1/2025-04-03/movie/data_source/mock_movie_data_source_impl.dart';
import 'package:modu_3_dart_study/apr/w1/2025-04-03/movie/repository/movie_repository_impl.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  test('movie', () async {
    final mockMovieData = MockMovieDataSourceImpl();
    final repository = MovieRepositoryImpl(mockMovieData);

    final movies = await repository.getMovieInfoList();

    expect(movies[0].id, equals(939243));
    expect(movies[0].title, equals('수퍼 소닉 3'));
    expect(movies[0].releaseDate, equals('2024-12-19'));
  });
}
