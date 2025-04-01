import 'dart:convert';
import 'dart:io';

import 'package:test/test.dart';

import '../../../../assignments/2025-03-31/src/solution/data_source/todo/todo_data_source_impl.dart';
import '../../../../assignments/2025-03-31/src/solution/model/todo/todo.dart';

void main() {
  final todo = Todo(
    userId: 1,
    id: 1,
    title: "delectus aut autem",
    completed: false,
  );
  group('Todo', () {
    test('역직렬화 테스트', () async {
      final jsonString =
          await File(
            'assignments/2025-03-31/src/solution/data_source/todo/todo.json',
          ).readAsString();

      final result = Todo.fromJson(jsonDecode(jsonString));

      expect(result, isA<Todo>());
      expect(result.userId, todo.userId);
      expect(result.id, todo.id);
      expect(result.title, todo.title);
      expect(result.completed, todo.completed);
    });

    test('TodoDataSourceImpl().getTodo() 테스트', () async {
      final result = await TodoDataSourceImpl().getTodo();

      expect(result, isA<Todo>());
      expect(result.userId, todo.userId);
      expect(result.id, todo.id);
      expect(result.title, todo.title);
      expect(result.completed, todo.completed);
    });

    test('TodoDataSourceImpl().getTodos() 테스트', () async {
      final todos = await TodoDataSourceImpl().getTodos();

      final result = todos.map((e) => e.toJson()).toList();

      final todosJson =
          File(
            'assignments/2025-03-31/src/solution/data_source/todo/todos.json',
          ).readAsStringSync();

      expect(result, jsonDecode(todosJson));
    });
  });
}
