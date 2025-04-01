import 'package:test/test.dart';

import '../../assignments/2025-04-01/data_source/todo_data_source.dart';
import '../../assignments/2025-04-01/data_source/todo_data_source_impl.dart';
import '../../assignments/2025-04-01/model/todo.dart';
import '../../assignments/2025-04-01/repository/todo_repository.dart';
import '../../assignments/2025-04-01/repository/todo_repository_impl.dart';

void main() {
  group('Todo 테스트', () {
    test('Mock 데이터 테스트', () async {
      String path = 'assignments/2025-04-01/data_source/mock_todos.json';
      TodoDataSource todoDataSource = TodoDataSourceImpl(path: path);
      TodoRepository todoRepository = TodoRepositoryImpl(
        dataSource: todoDataSource,
      );
      List<Todo> allTodos = await todoRepository.getTodos();
      expect(allTodos.length, 1);
      List<Todo> completedTodos = await todoRepository.getCompletedTodos();
      expect(completedTodos.length, 1);
      expect(completedTodos[0].id, 200);
      expect(completedTodos[0].userId, 10);
      expect(completedTodos[0].title, 'test 타이틀');
    });

    test('본데이터 test', () async {
      String path = 'assignments/2025-04-01/data_source/todos.json';
      TodoDataSource todoDataSource = TodoDataSourceImpl(path: path);
      TodoRepository todoRepository = TodoRepositoryImpl(
        dataSource: todoDataSource,
      );
      List<Todo> allTodos = await todoRepository.getTodos();
      expect(allTodos.length, 200);
      List<Todo> completedTodos = await todoRepository.getCompletedTodos();
      expect(completedTodos.length, 90);
    });
  });
}
