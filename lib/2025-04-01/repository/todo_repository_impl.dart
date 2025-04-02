import 'dart:convert';
import 'dart:io';

import 'package:modu_3_dart_study/2025-04-01/repository/todo_repository.dart';

import '../model/todo.dart';

class TodoRepositoryImpl implements TodoRepository {
  File file = File('lib/2025-04-01/remote/todo.json');

  Future<List<Todo>> _loadTodosFromJson() async {
    String jsonString = await file.readAsString();
    List<dynamic> jsonList = jsonDecode(jsonString);
    return jsonList
        .map((json) => Todo.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<List<Todo>> getTodos() async {

    return await _loadTodosFromJson();
  }

  @override
  Future<List<Todo>> getCompletedTodos() async {
    List<Todo> todos = await _loadTodosFromJson();
    return todos.where((todo) => todo.completed == true).toList();
  }
}
