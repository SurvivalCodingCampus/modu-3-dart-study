import 'dart:convert';

import 'package:test/test.dart';

import '../../../assignments/basic/2025-03-27/movie.dart';

void main() {
  test('movie fufure test', () async {
    final movie = await getMovieInfo();

    expect(movie.director, equals('George Lucas'), reason: 'director check');
  });
}

Future<Movie> getMovieInfo() async {
  await Future.delayed(Duration(seconds: 2));

  final String jsonString = '''
{
"title":"Star Ward",
"director":"George Lucas",
"year":1977}
''';
  final movie = Movie.fromJson(jsonDecode(jsonString));
  return movie;
}
