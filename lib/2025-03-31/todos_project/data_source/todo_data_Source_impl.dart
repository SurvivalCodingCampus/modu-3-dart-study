import 'dart:convert';
import 'dart:io';

import 'package:modu_3_dart_study/2025-03-31/todos_project/data_source/todo_data_source.dart';
import 'package:modu_3_dart_study/2025-03-31/todos_project/model/todo.dart';

class TodoDataSourceImpl implements TodoDataSource {
  final String filePath;

  TodoDataSourceImpl(this.filePath);

  @override
  Future<List<Todo>> getTodos() async {
    final File file = File(filePath);
    final String contents = await file.readAsString();
    final List jsonData = jsonDecode(contents);
    return jsonData.map((todo) => Todo.fromJson(todo)).toList();
  }

}