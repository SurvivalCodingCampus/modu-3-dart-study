import 'dart:convert';
import 'dart:io';

import 'package:modu_3_dart_study/2025-03-31/data_source/todo_data_source.dart';
import 'package:modu_3_dart_study/2025-03-31/model/todo.dart';

class TodoDataSourceImpl implements TodoDataSource{
  @override
  Future<Todo> getTodo() async {
    final File file = File('lib/2025-03-31/todo.json');
    final String fileString = file.readAsStringSync();
    final Map<String, dynamic> decodedJson = jsonDecode(fileString);

    return Todo.fromJson(decodedJson);
  }

  @override
  Future<List<Todo>> getTodos() async {
    final File file = File('lib/2025-03-31/todos.json');
    final String fileString = file.readAsStringSync();
    final List<dynamic> jsonList  = jsonDecode(fileString); // 다이나믹으로 밖에 안받아짐.

    return jsonList.map((e) => Todo.fromJson(e)).toList();
  }
}