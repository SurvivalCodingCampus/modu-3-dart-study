import 'package:test/test.dart';

import '../../../assignments/2025-03/2025-03-31/todo.dart';
import '../../../assignments/2025-03/2025-03-31/todo_data_source_impl.dart';

void main() {
  group('Todo 테스트', () {
    String path = 'assignments/2025-03-31/todo.json';
    TodoDataSourceImpl todoDataSourceImpl = TodoDataSourceImpl(path: path);
    test('getTodo 메소드 테스트', () async {
      Todo todo = await todoDataSourceImpl.getTodo();
      expect(todo.userId == 1, isTrue);
      expect(todo.id == 1, isTrue);
      expect(todo.title == 'delectus aut autem', isTrue);
      expect(todo.completed == false, isTrue);
      print(todo);
    });
  });
  group('Todos 테스트', () {
    String path = 'assignments/2025-03-31/todos.json';
    TodoDataSourceImpl todoDataSourceImpl = TodoDataSourceImpl(path: path);
    test('getTodos 메소드 테스트', () async {
      List<Todo> todos = await todoDataSourceImpl.getTodos();
      expect(todos[0].userId == 1, isTrue);
      expect(todos[0].id == 1, isTrue);
      expect(todos[0].title == 'delectus aut autem', isTrue);
      expect(todos[0].completed == false, isTrue);
      // print(todos);
      // print(todos.length);
    });
  });
}
