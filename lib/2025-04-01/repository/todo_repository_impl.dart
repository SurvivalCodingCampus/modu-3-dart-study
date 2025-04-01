import 'dart:convert';
import 'dart:io';

import 'package:modu_3_dart_study/2025-04-01/repository/todo_repository.dart';

import '../model/todo.dart';

class TodoRepositoryImpl implements TodoRepository {
  File file = File('lib/2025-04-01/remote/todo.json');

  @override
  Future<List<Todo>> getTodos() async {
    String jsonString = await file.readAsString();
    List<dynamic> jsonList = jsonDecode(jsonString);
    List<Todo> todos =
        jsonList
            .map((json) => Todo.fromJson(json as Map<String, dynamic>))
            .toList();
    return todos;
  }

  @override
  Future<List<Todo>> getCompletedTodos() async {
    String jsonString = await file.readAsString();
    List<dynamic> jsonList = jsonDecode(jsonString);
    List<Todo> todos =
        jsonList
            .map((json) => Todo.fromJson(json as Map<String, dynamic>))
            .where((todo) => todo.completed == true)
            .toList();
    return todos;
  }
}
