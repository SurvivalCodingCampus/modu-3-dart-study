import 'package:modu_3_dart_study/2025-04-03/data_source/mock_todo_data_source.dart';
import 'package:modu_3_dart_study/2025-04-03/repository/todo_repository_impl.dart';
import 'package:test/test.dart';

void main() {
  const expectedTodoCount = 2;
  const expectedTitle = '할 일 1';

  group('TodoRepositoryImpl - MockTodoDataSource 테스트', () {
    final repository = TodoRepositoryImpl(dataSource: MockTodoDataSource());

    test('getTodos 성공', () async {
      final todos = await repository.fetchTodos();

      print('✅ 총 ${todos.length}개의 todo를 불러왔습니다.');
      for (final todo in todos) {
        print('📝 [${todo.id}] ${todo.title} (완료 여부: ${todo.completed})');
      }

      expect(todos.length, expectedTodoCount);
      expect(todos.first.title, contains('할 일'));
    });

    test('getTodo 성공', () async {
      final todo = await repository.fetchTodoById(1);

      print('✅ ID 1인 todo를 성공적으로 불러왔습니다.');
      print('📝 제목: ${todo.title}, 완료 여부: ${todo.completed}');

      expect(todo.id, 1);
      expect(todo.title, expectedTitle);
    });

    test('getTodo 실패 - 없는 ID', () async {
      try {
        await repository.fetchTodoById(999);
        fail('❌ 예외가 발생하지 않았습니다.');
      } catch (e) {
        print('✅ 예외 발생 확인됨: $e');
        expect(e, isA<Exception>());
      }
    });
  });
}
