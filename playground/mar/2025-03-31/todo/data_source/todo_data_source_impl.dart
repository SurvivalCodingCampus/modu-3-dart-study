import 'dart:convert';
import 'dart:io';

import '../model/todo.dart';
import 'todo_data_source.dart';

class TodoDataSourceImpl implements TodoDataSource {
  @override
  Future<Todo> getTodo() async {
    final todoFile = File(r'playground/mar/2025-03-31/todo/todo.txt');
    final jsonString = await todoFile.readAsString();
    final jsonMap = jsonDecode(jsonString);

    return Todo.fromJson(jsonMap);
  }

  @override
  Future<List<Todo>> getListTodo() async {
    final listTodoFile = File(r'playground/mar/2025-03-31/todo/list_todo.txt');
    final listJsonString = await listTodoFile.readAsString();
    final List<dynamic> jsonList = jsonDecode(listJsonString);

    return jsonList.map((e) => Todo.fromJson(e)).toList();
  }
}
