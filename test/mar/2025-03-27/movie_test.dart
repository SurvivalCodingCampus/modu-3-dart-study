import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import '../../../playground/mar/2025-03-27/movie.dart';

void main() {
  test('movie', () async {
    Stopwatch stopwatch = Stopwatch()..start();

    Movie movie = await getMovieInfo();

    stopwatch.stop();
    final time = stopwatch.elapsed;

    expect(movie.director, equals('George Lucas'));
    expect(time, greaterThanOrEqualTo(Duration(seconds: 2)));
  });
}
