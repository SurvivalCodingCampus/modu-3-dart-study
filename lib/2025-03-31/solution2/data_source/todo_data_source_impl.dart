import 'dart:convert';
import 'dart:io';

import 'package:modu_3_dart_study/2025-03-31/solution2/data_source'
    '/todo_data_source.dart';
import 'package:modu_3_dart_study/2025-03-31/solution2/model/todo.dart';

class TodoDataSourceImpl implements TodoDataSource {
  @override
  Future<Todo> getTodo() async {
    String todoJsonText =
        await File(
          'lib/2025-03-31/solution1/data_source/todo.json',
        ).readAsString();
    Map<String, dynamic> todoJson = jsonDecode(todoJsonText);
    return Todo.fromJson(todoJson);
  }

  @override
  Future<List<Todo>> getTodos() async {
    List<Todo> todoList = [];

    String todoListJsonText =
        await File( 
          'lib/2025-03-31/solution2/data_source/todos.json',
        ).readAsString();

    List<dynamic> todoListConvert = jsonDecode(todoListJsonText);

    for (Map<String, dynamic> items in todoListConvert) {
      todoList.add(Todo.fromJson(items));
    }

    return todoList;
  }
}
