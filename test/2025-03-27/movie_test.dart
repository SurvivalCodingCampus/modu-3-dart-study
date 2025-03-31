import 'package:test/test.dart';

import '../../assignments/2025-03-27/movie.dart';

void main() {
  const String movieTitle = 'Star Ward';
  const String movieDirector = 'George Lucas';
  const int movieYear = 1977;
  const String jsonString = '''{
    "title": "Star Ward",
    "director": "George Lucas",
    "year":1977
  ''';
  group('영화 :', () {
    test('getMovieInfo', () async {
      final Movie movie = await getMovieInfo();

      expect(movie.title, equals(movieTitle));
      expect(movie.director, equals(movieDirector));
      expect(movie.year, equals(movieYear));
    });
    test('getMovieInfo Argument Error', () async {
      Movie movie = Movie('', '', 0);

      expect(
        () async => await movie.getMovieInfoInner(jsonString),
        throwsA(isArgumentError),
      );
    });
  });
}
