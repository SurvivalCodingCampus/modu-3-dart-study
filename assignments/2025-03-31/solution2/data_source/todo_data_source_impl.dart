import 'dart:convert';
import 'dart:io';

import '../../solution2/data_source/todo_data_source.dart';
import '../../solution2/model/todo.dart';

class TodoDataSourceImpl implements TodoDataSource {
  @override
  Future<Todo> getTodo() async {
    String todoJsonText =
        File(
          'lib/2025-03-31/solution1/data_source/todo.json',
        ).readAsStringSync();
    Map<String, dynamic> todoJson = jsonDecode(todoJsonText);
    return Todo.fromJson(todoJson);
  }

  @override
  Future<List<Todo>> getTodos() async {
    List<Todo> todoList = [];

    String todoListJsonText =
        File(
          'lib/2025-03-31/solution2/data_source/todos.json',
        ).readAsStringSync();

    List<dynamic> todoListConvert = jsonDecode(todoListJsonText);

    for (Map<String, dynamic> items in todoListConvert) {
      todoList.add(Todo.fromJson(items));
    }

    return todoList;
  }
}
