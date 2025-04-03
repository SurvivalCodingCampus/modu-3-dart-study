import 'dart:convert';
import 'dart:io';

import 'todo_data_source.dart';

class TodoDataSourceImpl implements TodoDataSource {
  @override
  Future<List<Map<String, dynamic>>> getTodos() async {
    final file =
        await File(
          'assignments/2025-04-01/src/solution/data_source/local/todos.json',
        ).readAsString();

    final List todosList = jsonDecode(file);
    return todosList.map((e) => e as Map<String, dynamic>).toList();
  }
}
