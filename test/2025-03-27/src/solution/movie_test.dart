import 'dart:convert';

import 'package:modu_3_dart_study/assignments/2025-03-27/src/solution/movie.dart';
import 'package:test/test.dart';

void main() {
  final String jsonString = '''
      { 
        "title": "Star Ward",
        "director": "George Lucas",
        "year": 1977
      }
    ''';

  test('Movie', () async {
    Future<Movie> getMovieInfo() async {
      await Future.delayed(Duration(seconds: 2));

      return Movie.fromJson(jsonDecode(jsonString));
    }

    Movie movie = await getMovieInfo();

    expect(getMovieInfo(), isA<Future<Movie>>());
    expect(movie, isA<Movie>());
    expect(movie.title, "Star Ward");
    expect(movie.director, "George Lucas");
    expect(movie.year, 1977);
  });
}
