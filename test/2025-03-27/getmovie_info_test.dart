import 'package:test/test.dart';
import '../../assignments/2025-03-27/getmovie_info.dart';

void main() {
  test('getMovieInfo returns the correct movie info', () async {
    // getMovieInfo()를 호출하여 Movie 객체를 반환받음
    Movie movie = await getMovieInfo();
    
    // expect를 사용하여 반환된 값이 예상 값과 일치하는지 테스트
    expect(movie.title, 'Star Wars');
    expect(movie.director, 'George Lucas');
    expect(movie.year, 1977);
  });
}