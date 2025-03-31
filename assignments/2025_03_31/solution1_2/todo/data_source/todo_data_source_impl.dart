import 'dart:convert';
import 'dart:io';

import '../todo.dart';
import 'todo_data_source.dart';

class TodoDataSourceImpl implements TodoDataSource {
  @override
  Future<Todo> getTodo() async {
    final jsonTodo = File('assets/json/todo.json');
    final jsonString = await jsonTodo.readAsString();

    final jsonData = jsonDecode(jsonString);
    return Todo.fromJson(jsonData);
  }

  @override
  Future<List<Todo>> getTodos() async {
    final jsonTodos = File('assets/json/todo_list.json');
    final jsonListString = await jsonTodos.readAsString();

    final List listFromJson = jsonDecode(jsonListString);

    List<Todo> todoList =
        listFromJson.map((todo) => Todo.fromJson(todo)).toList();

    return todoList;
  }
}
