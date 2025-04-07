import 'package:test/test.dart';
import 'package:modu_3_dart_study/assignments/2025-03-31/todo_solution/todo.dart';
import 'package:modu_3_dart_study/assignments/2025-03-31/todo_solution/todo_data_source_impl.dart';

void main() {
  const todoId = 1;
  const todoTitle = 'delectus aut autem';
  const todoCompleted = false;

  group('TodoDataSourceImpl', () {
    final dataSource = TodoDataSourceImpl();

    test('getTodo()', () async {
      final todo = await dataSource.getTodo();

      expect(todo, isA<Todo>());

      expect(todo.id, todoId);
      expect(todo.title, todoTitle);
      expect(todo.completed, todoCompleted);
    });

    test('getTodos()', () async {
      final dataSource = TodoDataSourceImpl();
      final todos = await dataSource.getTodos();

      expect(todos, isNotEmpty);
      expect(todos.first.id, equals(1));
      expect(todos.first.title, isNotEmpty);
    });
  });
}
