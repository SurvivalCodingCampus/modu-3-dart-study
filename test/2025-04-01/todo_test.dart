import 'package:test/test.dart';
import 'package:modu_3_dart_study/assignments/2025-04-01/data_source/mock/mock_todo_data_source_impl.dart';
import 'package:modu_3_dart_study/assignments/2025-04-01/model/todo.dart';
import 'package:modu_3_dart_study/assignments/2025-04-01/repository/todo_repository_impl.dart';

void main() {
  final mockTodoDataSource = MockTodoDataSourceImpl();
  group('예제3) todos', () {
    test('todo 목록 가져오기', () async {
      final todoRepository = TodoRepositoryImpl(mockTodoDataSource);
      List<Todo> todos = await todoRepository.getTodos();

      expect(todos.length, 5);

      expect(todos[0].userId, 1);
      expect(todos[0].id, 1);
      expect(todos[0].title, 'delectus aut autem');
      expect(todos[0].completed, false);

      expect(todos[1].userId, 1);
      expect(todos[1].id, 2);
      expect(todos[1].title, 'quis ut nam facilis et officia qui');
      expect(todos[1].completed, false);

      expect(todos[2].userId, 1);
      expect(todos[2].id, 3);
      expect(todos[2].title, 'fugiat veniam minus');
      expect(todos[2].completed, false);

      expect(todos[3].userId, 1);
      expect(todos[3].id, 4);
      expect(todos[3].title, 'et porro tempora');
      expect(todos[3].completed, true);

      expect(todos[4].userId, 1);
      expect(todos[4].id, 5);
      expect(
        todos[4].title,
        'laboriosam mollitia et enim quasi adipisci quia provident illum',
      );
      expect(todos[4].completed, false);
    });

    test('todo 완료 목록 가져오기', () async {
      final todoRepository = TodoRepositoryImpl(mockTodoDataSource);
      List<Todo> todos = await todoRepository.getCompletedTodos();

      expect(todos.length, 1);

      expect(todos[0].userId, 1);
      expect(todos[0].id, 4);
      expect(todos[0].title, 'et porro tempora');
      expect(todos[0].completed, true);
    });
  });
}
