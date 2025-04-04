import 'dart:convert';

import 'package:test/test.dart';

import 'package:modu_3_dart_study/2025-03-25/default_file_operations.dart';
import 'package:modu_3_dart_study/2025-03-27/movie.dart';

void main() {
  group('Movie 테스트', () {
    final defaultFileOperations = DefaultFileOperations();
    const sourcePath = 'lib/2025-03-27/movie.json';
    test('직렬화, 역직렬화가 정상적으로 이뤄지고 필드가 같아야 한다.', () {
      // 역직렬화
      final jsonString = defaultFileOperations.read(sourcePath);
      final json = jsonDecode(jsonString);
      final movie = Movie.fromJson(json);

      // 테스트 위한 다시 직렬화
      final serializationJson = movie.toJson();
      final serializationJsonString = jsonEncode(serializationJson);

      // 테스트 위한 다시 역직렬화
      final deserializationJson = jsonDecode(serializationJsonString);
      final deserializationMovie = Movie.fromJson(deserializationJson);

      // 비교
      expect(movie, deserializationMovie);
    });

    test('getMovieInfo() 실행 시 딜레이가 2초 이상 걸려야 합니다.', () async {
      final stopwatch = Stopwatch()..start();
      const delay = 2;

      final _ = await getMovieInfo();
      final timerTime = stopwatch.elapsed.inSeconds;

      expect(timerTime, greaterThanOrEqualTo(delay));
    });
  });
}
