import 'dart:convert';
import 'dart:io';

import '../model/todo.dart';

class TodoDataSource {
  final String path = 'assignments/2025-04-01/todos/assets/todos.json';

  Future<List<Todo>> getTodos() async {
    final file = File(path);
    final String fileContents = await file.readAsString();
    List<dynamic> jsonList = jsonDecode(fileContents);
    List<Todo> todoList = jsonList.map((e) => Todo.fromJson(e)).toList();
    return todoList;
  }
}
