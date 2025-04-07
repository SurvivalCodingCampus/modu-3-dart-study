import 'dart:convert';
import 'dart:io';

import '../../solution1/data_source/todo_data_source.dart';
import '../../solution1/model/todo.dart';

class TodoDataSourceImpl implements TodoDataSource {
  @override
  Future<Todo> getTodo() async {
    String todoJsonText =
        File(
          'lib/2025-03-31/solution1/data_source/todo.json',
        ).readAsStringSync();
    Map<String, dynamic> todoJson = jsonDecode(todoJsonText);
    return Todo.fromJson(todoJson);
  }
}
