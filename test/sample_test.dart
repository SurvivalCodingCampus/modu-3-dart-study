import 'package:modu_3_dart_study/2025-03-31/data_source/todo_list_data_source.dart';
import 'package:test/test.dart';


void main() {
  const todoId = 1;
  const todoTitle = 'delectus aut autem';
  const todoCompleted = false;

  group('TodoListDataSourceImpl - 과제 2', () {
    final dataSource = TodoListDataSourceImpl();

    test('getTodos() should return a List of Todo objects', () async {
      final todos = await dataSource.getTodos();
      print('Todos: ${todos.map((e) => e.toJson()).toList()}');
      expect(todos, isNotEmpty);
      expect(todos.length, greaterThan(1));
      expect(todos.first.id, todoId);
      expect(todos.first.title, todoTitle);
      expect(todos.first.completed, todoCompleted);
    });
  });
}
