import 'dart:convert';
import 'dart:io';
import 'package:test/test.dart';
import '../../assignments/2025-03-31/data_source/todo_data_source_impl.dart';

void main() {
  group('TodoDataSourceImpl', () {
    late File testFile;
    late TodoDataSourceImpl dataSource;

    setUp(() async {
      // 테스트용 JSON 파일 생성
      testFile = File('test/data/todo_test.json');
      await testFile.create(recursive: true);
      await testFile.writeAsString(jsonEncode({
        "userId": 1,
        "id": 1,
        "title": "delectus aut autem",
        "completed": false
      }));

      // 테스트용 데이터 소스 초기화
      dataSource = TodoDataSourceImpl();
    });

    tearDown(() async {
      // 테스트가 끝나면 파일 삭제
      if (await testFile.exists()) {
        await testFile.delete();
      }
    });

    test('getTodo should return correct Todo object', () async {
      // 실제 JSON 파일 경로를 사용하도록 수정
      final file = File('/Users/roychoi/Documents/GitHub/flutter-study/assignments/2025-03-31/data_source/todo.json');
      await file.writeAsString(jsonEncode({
        "userId": 1,
        "id": 1,
        "title": "delectus aut autem",
        "completed": false
      }));

      // getTodo 실행
      final todo = await dataSource.getTodo();

      // 기대 결과와 비교
      expect(todo.userId, equals(1));
      expect(todo.id, equals(1));
      expect(todo.title, equals("delectus aut autem"));
      expect(todo.completed, isFalse);
    });
  });
}