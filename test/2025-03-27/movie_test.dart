import 'dart:convert';

import 'package:test/test.dart';

import '../../assignments/2025-03-27/movie.dart';

void main() {
  test('movie fufure test', () async {
    final stopWatch = Stopwatch()..start();
    final movie = await getMovieInfo();
    print(movie.toString());
    
    expect(stopWatch.elapsed.inSeconds == 1, isTrue);
  });
}

Future<Movie> getMovieInfo() async {
  await Future.delayed(Duration(seconds: 1));

  final String jsonString = '''
{
"title":"Star Ward",
"director":"George Lucas",
"year":1977}
''';
final movie = Movie.fromJson(jsonDecode(jsonString));
return movie;
}
