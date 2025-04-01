import 'dart:convert';
import 'dart:io';

import 'todo.dart';
import 'todo_data_source.dart';

class TodoDataSourceImpl implements TodoDataSource {
  final String path;
  TodoDataSourceImpl({required this.path});

  @override
  Future<Todo> getTodo() async {
    File file = File(path);
    try {
      final jsonMap = jsonDecode(await file.readAsString());
      return Todo.fromJson(jsonMap);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<Todo>> getTodos() async {
    File file = File(path);
    try {
      final List todosMapList = jsonDecode(await file.readAsString());
      final List<Todo> todosList =
          todosMapList.map((e) => Todo.fromJson(e)).toList();
      return todosList;
    } catch (e) {
      throw Exception(e);
    }
  }
}
