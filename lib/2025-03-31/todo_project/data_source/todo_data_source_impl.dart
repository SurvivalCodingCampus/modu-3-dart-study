import 'dart:convert';
import 'dart:io';

import 'package:modu_3_dart_study/2025-03-31/todo_project/data_source/todo_data_source.dart';
import 'package:modu_3_dart_study/2025-03-31/todo_project/model/todo.dart';

class TodoDataSourceImpl implements TodoDataSource {
  final String filePath;

  TodoDataSourceImpl(this.filePath);

  @override
  Future<Todo> getTodo() async {
    // TODO: implement getTodo
    final file = File(filePath);
    final contents = await file.readAsString();
    final jsonData = jsonDecode(contents);

    return Todo.fromJson(jsonData);
  }
}