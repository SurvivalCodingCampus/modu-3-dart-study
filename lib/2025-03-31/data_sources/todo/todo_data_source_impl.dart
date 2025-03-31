import 'dart:convert';
import 'dart:io';

import 'package:modu_3_dart_study/2025-03-31/data_sources/todo/todo_data_source.dart';
import 'package:modu_3_dart_study/2025-03-31/models/todo.dart';

class TodoDataSourceImpl implements TodoDataSource {
  static final String root = Directory.current.path;

  @override
  Future<Todo> getTodo(String relativePath) async {
    File file = File(root + relativePath);
    Map<String, dynamic> json = jsonDecode(await file.readAsString());
    return Todo.fromJson(json);
  }

  @override
  Future<List<Todo>> getTodos(String relativePath) async {
    File file = File(root + relativePath);
    List<dynamic> json = jsonDecode(await file.readAsString());

    return json
        .cast<Map<String, dynamic>>()
        .map((e) => Todo.fromJson(e))
        .toList();
  }
}
