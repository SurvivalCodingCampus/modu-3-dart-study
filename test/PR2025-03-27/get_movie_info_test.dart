import 'package:modu_3_dart_study/PR2025-03-27/get_movie_info.dart';
import 'package:test/test.dart';

void main() {
  test('getMovieInfo확인', () async {
    //Future이기때문에 await로  실행시켜야함
    Movie movie = await getMovieInfo();
    expect(movie.title, equals("Star Wars"));
    expect(movie.director, equals("George Lucas"));
    expect(movie.openYear, equals(1977));
  });
}
