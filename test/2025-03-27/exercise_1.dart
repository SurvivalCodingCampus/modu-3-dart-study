import 'dart:convert';
import 'dart:math';

import 'package:modu_3_dart_study/2025-03-27/exercise_1.dart';
import 'package:modu_3_dart_study/2025-03-27/movie.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  test('Movie 값 확인', () async {
    Movie data = await getMovieInfo();

    String expectedTitle = 'StarWord';
    String expectedDirector = 'George Lucas';
    String expectedYear = '1977';

    expect(data.title, expectedTitle);
    expect(data.director, expectedDirector);
    expect(data.year, expectedYear);
  });
  test('Decode', (){
    final String jsonString = '''{
      "title" : "StarWord",
      "director": "George Lucas",
      "year"  : "1977"
    }''';

    Map<String, dynamic> json = jsonDecode(jsonString);

    Movie movie = Movie.fromJson(json);
    expect(movie.title, 'StarWord');
    expect(movie.director, 'George Lucas');
    expect(movie.year, '1977');
  });
}
