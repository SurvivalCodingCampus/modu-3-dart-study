import 'package:test/test.dart';

import '../../../../../lib/assignments/2025-04-/2025-04-01/todo/data_source/local/todo_data_source_impl.dart';
import '../../../../../lib/assignments/2025-04-/2025-04-01/todo/repository/mock/mock_todo_repository_impl.dart';
import '../../../../../lib/assignments/2025-04-/2025-04-01/todo/repository/todo_repository.dart';
import '../../../../../lib/assignments/2025-04-/2025-04-01/todo/repository/todo_repository_impl.dart';

void main() {
  group('todo repo test', () {
    test('todo mock repo test', () async {
      final TodoRepository repo = MockTodoRepositoryImpl();
      final todos = await repo.getTodos();
      final completedTodos = await repo.getCompletedTodos();

      // 전체 길이 200
      expect(todos.length, equals(6));
      // completed인 데이터 길이 확인
      expect(completedTodos.length, equals(3));
    });

    test('todo repo test', () async {
      final TodoRepository repo = TodoRepositoryImpl(TodoDataSourceImpl());
      final todos = await repo.getTodos();
      final completedTodos = await repo.getCompletedTodos();

      // 전체 길이 200
      expect(todos.length, equals(200));
      // completed인 데이터 길이 확인
      expect(
        completedTodos.length ==
            todos.where((e) => e.completed).toList().length,
        equals(true),
      );
    });
  });
}
