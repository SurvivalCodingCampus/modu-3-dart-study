import 'package:modu_3_dart_study/assignments/2025-04-/2025-04-03/movie/data_source/impl/movie_data_source_impl.dart';
import 'package:modu_3_dart_study/assignments/2025-04-/2025-04-03/movie/data_source/mock/mock_movie_data_source_impl.dart';
import 'package:modu_3_dart_study/assignments/2025-04-/2025-04-03/movie/data_source/movie_data_source.dart';
import 'package:modu_3_dart_study/assignments/2025-04-/2025-04-03/movie/model/movie.dart';
import 'package:modu_3_dart_study/assignments/2025-04-/2025-04-03/movie/repository/movie_repository.dart';
import 'package:modu_3_dart_study/assignments/2025-04-/2025-04-03/movie/repository/movie_repository_impl.dart';
import 'package:test/test.dart';

void main() {
  group('movie test', (){
    test('mock 데이터로 무비 데이터 가져오기 확인', () async {
      final MovieDataSource dataSource = MockMovieDataSourceImpl();
      final MovieRepository repo = MovieRepositoryImpl(dataSource);
      final mockData = {
        "id": 939243,
        "title": "수퍼 소닉 3",
        "overview": "너클즈, 테일즈와 함께 평화로운 일상을 보내던 초특급 히어로 소닉...",
        "release_date": "2024-12-19",
      };

      final movies = await repo.getMovieInfoList();
      
      // mock 데이터는 하나이다.
      expect(movies.length, equals(1));
      expect(movies[0].toJson(), equals(mockData));
      expect(movies[0], equals(Movie.fromJson(mockData)));
    });

    test('api에서 무비 데이터 가져오기 확인', () async {
      final MovieDataSource dataSource = MovieDataSourceImpl();
      final MovieRepository repo = MovieRepositoryImpl(dataSource);

      final movies = await repo.getMovieInfoList();
      
      // mock 데이터는 하나이다.
      expect(movies, isA<List<Movie>>());
    });
  });
}