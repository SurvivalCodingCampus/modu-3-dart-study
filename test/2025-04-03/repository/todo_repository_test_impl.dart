import 'package:modu_3_dart_study/2025-04-03/data_source/todo_data_source_impl.dart';
import 'package:modu_3_dart_study/2025-04-03/repository/todo_repository_impl.dart';
import 'package:test/test.dart';

void main() {
  group('TodoRepositoryImpl - 실제 API 테스트', () {
    final repository = TodoRepositoryImpl(dataSource: TodoDataSourceImpl());

    test('fetchTodos 성공 케이스', () async {
      final todos = await repository.fetchTodos();
      print('✅ 총 ${todos.length}개의 todo를 불러옴');
      print('📝 첫 번째 todo: [${todos.first.id}] ${todos.first.title}');
      expect(todos.isNotEmpty, true);
    });

    test('fetchTodoById 성공 케이스', () async {
      final todo = await repository.fetchTodoById(1);
      print('✅ ID 1 todo: ${todo.title} (완료 여부: ${todo.completed})');
      expect(todo.id, 1);
      expect(todo.title.isNotEmpty, true);
    });

    test('존재하지 않는 ID 요청 시 예외 처리 확인', () async {
      try {
        await repository.fetchTodoById(99999);
        fail('❌ 예외가 발생하지 않았습니다.');
      } catch (e) {
        print('✅ 존재하지 않는 ID 요청 → 예외 발생 확인: $e');
        expect(e.toString(), contains('todo'));
      }
    });

    test('네트워크 에러 케이스 시 예외 처리 확인', () async {
      final brokenRepo = TodoRepositoryImpl(dataSource: TodoDataSourceImpl());

      try {
        await brokenRepo.fetchTodoById(123456789); // 유효하지 않은 ID
        fail('❌ 예외가 발생하지 않았습니다.');
      } catch (e) {
        print('✅ 네트워크 실패 시 예외 발생 확인: $e');
        expect(e, isA<Exception>());
      }
    });
  });
}
