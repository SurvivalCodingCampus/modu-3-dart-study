import 'dart:convert';

import 'package:test/test.dart';

import '../../assignments/2025-03-27/get_movie_info.dart';

void main() {
  final String jsonString = '''{
"title": "Star Ward",
"director": "George Lucas",
"year": 1977
}''';
  test('Movie 클래스 테스트', () {
    Movie movie = Movie.fromJson(jsonDecode(jsonString));
    expect(movie.title == 'Star Ward', isTrue);
    expect(movie.director == 'George Lucas', isTrue);
    expect(movie.year == 1977, isTrue);
    print('director : ${movie.director}');
  });
}
