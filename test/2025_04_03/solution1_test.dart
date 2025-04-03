import 'package:test/test.dart';

import '../../assignments/2025_04_03/solution1/data_source/movie_data_source.dart';
import '../../assignments/2025_04_03/solution1/mock/mock_movie_data_source_impl.dart';

void main() {
  group('getUpcomingMovies() Test', () {
    final MovieDataSource movieDataSource = MockMovieDataSourceImpl();
    test('정상적으로 데이터 가져오는지 확인', () async {
      print(await movieDataSource.getUpcomingMovies());
    });
    test('올바른 Json 이 아닐 경우', () {});
    test('200이 아닌 값을 반환하는 경우', () {});
  });
}
