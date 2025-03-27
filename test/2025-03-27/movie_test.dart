import 'dart:convert';

import 'package:modu_3_dart_study/2025-03-27/movie.dart';
import 'package:modu_3_dart_study/modu_3_dart_study.dart';
import 'package:test/test.dart';

void main() {
  final String jsonString = '''{
    "title": "Star Ward",
    "director": "George Lucas",
    "year": 1977
  }''';

  test('역직렬화 테스트', () async {
    String originalJson = jsonEncode(
      jsonDecode(jsonString),
    ); // 공백없이 일자로 정리한 String

    final Movie movie = await getMovieInfo();
    String futureJson = jsonEncode(movie.toJson()); // 역직렬화 후 직렬화 한 String

    expect(
      originalJson,
      futureJson,
      reason: '역직렬화 & 직렬화 한 것과 원래 String이 같으면 통과.',
    );
  });
  test('director 출력 테스트', () async {
    final Movie movie = await getMovieInfo();
    print(movie.director);

    expect(movie, isA<Movie>());
    expect(
      movie.director,
      jsonDecode(jsonString)['director'],
      reason: 'json의 director와 Movie 클래스의 director가 같으면 통과',
    );
  });
}
