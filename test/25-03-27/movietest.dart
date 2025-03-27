import 'dart:convert';

import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import '../../assignments/2025-03-27/movie.dart';

void main() {
  group('Movie test', () {
    test('2초동안 기다림', () async {
      Stopwatch stopwatch = Stopwatch()..start();
      await getMovieInfo();
      expect(stopwatch.elapsed.inSeconds, equals(2));
    });

    test('역직렬화', () {
      final String jsonString =
          '''{ "title" : "Star Wars", "director" : "George Lucas", "year" : 1977}''';
      final Map<String, dynamic> data = jsonDecode(jsonString);
      final Movie movie = Movie.fromJson(data);
      expect(movie.title, equals('Star Wars'));
      expect(movie.director, equals('George Lucas'));
      expect(movie.year, equals(1977));
    });
  });
}
