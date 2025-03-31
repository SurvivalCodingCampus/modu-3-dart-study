import 'package:modu_3_dart_study/2025-03-27/movie.dart';
import 'package:test/test.dart';

const String expectedDirector = 'George Lucas'; // 감독 이름 상수

void main() {
  group('Movie 클래스 테스트', () {
    test('getMovieInfo()가 올바른 감독 이름을 출력하는지 확인', () async {
      // 비동기 함수 호출
      Movie movie = await getMovieInfo();

      // 감독 이름 출력
      print('Movie Director: ${movie.director}');

      // 감독 이름이 예상한 값과 일치하는지 확인
      expect(movie.director, expectedDirector);
    });
  });
}