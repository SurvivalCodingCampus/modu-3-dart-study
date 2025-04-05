import 'package:modu_3_dart_study/2025-04-03/exam/exam_01/data_source/dio_movie_data_source_impl.dart';
import 'package:modu_3_dart_study/2025-04-03/exam/exam_01/data_source/http_movie_data_source_impl.dart';
import 'package:modu_3_dart_study/2025-04-03/exam/exam_01/data_source/movie_data_source.dart';
import 'package:modu_3_dart_study/2025-04-03/exam/exam_01/repository/movie_repository.dart';
import 'package:modu_3_dart_study/2025-04-03/exam/exam_01/repository/movie_repository_impl.dart';
import 'package:test/test.dart';

void main() {
  test('Movie Repository', () async {
    final MovieRepository movieRepository = MovieRepositoryImpl(
        movieDataSource: MockMovieDataSourceImpl(),
    );

    final result = await movieRepository.getMovieInfoList();

    expect(result.length, 1);
    expect(result[0].id, 939243);
    expect(result[0].title, '수퍼 소닉 3');

  });
}

class MockMovieDataSourceImpl implements MovieDataSource {
  @override
  Future<List<Map<String, dynamic>>> getUpcomingMovies() async {
    return [
      {
        "id": 939243,
        "title": "수퍼 소닉 3",
        "overview": "너클즈, 테일즈와 함께 평화로운 일상을 보내던 초특급 히어로 소닉...",
        "release_date": "2024-12-19"
      }
    ];
  }

}