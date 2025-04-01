import 'package:test/test.dart';

import '../../../../assignments/2025-04-01/src/solution/data_source/todo_data_source_impl.dart';
import '../../../../assignments/2025-04-01/src/solution/model/todo.dart';
import '../../../../assignments/2025-04-01/src/solution/repository/todo_repository.dart';
import '../../../../assignments/2025-04-01/src/solution/repository/todo_repository_impl.dart';
import 'mock/mock_todo_data_source_impl.dart';
import 'mock/mock_two_todo_data_source_impl.dart';

void main() {
  group('Todo', () {
    test('문제 3번 - getTodos', () async {
      final TodoRepository repository = TodoRepositoryImpl(
        todoDataSource: TodoDataSourceImpl(),
      );

      final expected = await MockTodoDataSourceImpl().getTodos();

      final result = await repository.getTodos();

      for (int i = 0; i < expected.length; i++) {
        expect(result[i], isA<Todo>());
        expect(result[i].userId, expected[i]['userId']);
        expect(result[i].id, expected[i]['id']);
        expect(result[i].title, expected[i]['title']);
      }

      expect(result.length, expected.length);
    });

    test('문제 3번 - getCompletedTodos', () async {
      final TodoRepository repository = TodoRepositoryImpl(
        todoDataSource: MockTwoTodoDataSourceImpl(), // true 2개, false 2개
      );

      final result = await repository.getCompletedTodos();

      expect(result.length, 2);
    });
  });
}
