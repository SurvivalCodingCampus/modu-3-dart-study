import 'dart:convert';
import 'dart:io';

import '../../model/todo/todo.dart';
import 'todo_data_source.dart';

class TodoDataSourceImpl implements TodoDataSource {
  @override
  Future<Todo> getTodo() async {
    final todoJson =
        File(
          'assignments/2025-03-31/src/solution/todo.json',
        ).readAsStringSync();
    final result = await jsonDecode(todoJson);
    return Todo.fromJson(result);
  }

  @override
  Future<List<Todo>> getTodos() async {
    final todosJson =
        File(
          'assignments/2025-03-31/src/solution/todos.json',
        ).readAsStringSync();

    List<dynamic> result = await jsonDecode(todosJson);

    result = result.map((e) => e as Map<String, dynamic>).toList();

    return result.map((e) => Todo.fromJson(e)).toList();
  }
}
