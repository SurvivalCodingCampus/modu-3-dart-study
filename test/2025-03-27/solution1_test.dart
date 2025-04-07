import 'package:test/test.dart';

import 'package:modu_3_dart_study/assignments/2025-03-27/solution1.dart';

void main() async {
  // 예측되는 값을 여기서 미리 상수로 선언 할 수 있음
  const String movieTitle = 'Star Ward';
  const String movieDirector = 'George Lucas';
  const int movieYear = 1977;

  group('Movie', () {
    test('getMovieInfo 함수테스트', () async {
      final Movie movie = await getMovieInfo();
      print(movie.runtimeType);
      expect(movie.runtimeType, Movie);
      // expect(movie, isA<Movie>);
      expect(movie.title, equals(movieTitle));
      expect(movie.director, equals(movieDirector));
      expect(movie.year, equals(movieYear));
    });
  });
}
