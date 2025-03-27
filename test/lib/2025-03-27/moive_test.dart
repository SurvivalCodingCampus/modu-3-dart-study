import 'dart:convert';

import 'package:modu_3_dart_study/2025-03-27/movie.dart';
import 'package:test/test.dart';

Future<Movie> getMovieInfo(String json) async {
  await Future.delayed(Duration(seconds: 2));
  return Movie.fromJson(jsonDecode(json));
}

void main() {
  test('getMovieInfo() 함수를 완성하고 director를 출력하라', () async {
    // GIVEN
    final String json = '''{
      "title": "Star Wars",
      "director": "George Lucas",
      "year": 1977
    }''';

    // WHEN
    Movie movie = await getMovieInfo(json);

    // THEN
    expect(movie.director, 'George Lucas');
  });
}
