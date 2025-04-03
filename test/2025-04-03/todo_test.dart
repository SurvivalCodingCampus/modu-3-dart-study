import 'package:test/test.dart';

import '../../assignments/2025-04-03/data_source/mock/mock_todo_data_source_impl.dart';
import '../../assignments/2025-04-03/repository/todo_repository_impl.dart';

void main() {
  group('Todo Http 통신', () {
    final mockTodoDataSource = MockTodoDataSourceImpl();
    test('getTodos() - 성공 응답', () async {
      final todoRepository = TodoRepositoryImpl(mockTodoDataSource);

      final todos = await todoRepository.getTodos();

      expect(todos.length, 4);
      expect(todos.first.userId, 1);
      expect(todos.first.id, 1);
      expect(todos.first.title, '쭈꾸미샤브');
      expect(todos.first.body, '먹고싶다.');

      expect(todos.last.userId, 1);
      expect(todos.last.id, 4);
      expect(todos.last.title, '딸기케이크');
      expect(todos.last.body, '먹고싶다.');
    });

    test('getTodo() - 성공 응답', () async {
      final todoRepository = TodoRepositoryImpl(mockTodoDataSource);

      final todo = await todoRepository.getTodo(1);

      expect(todo.userId, 1);
      expect(todo.id, 1);
      expect(todo.title, '쭈꾸미샤브');
      expect(todo.body, '먹고싶다.');
    });
  });
}
