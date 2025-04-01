
import 'dart:convert';
import 'dart:io';

import 'package:modu_3_dart_study/2025-04-01/solution3/data_source/todo_data_source.dart';

class TodoDataSourceImpl implements TodoDataSource {
  final File file = File('lib/2025-04-01/solution3/todos.json');

  @override
  Future<List<Map<String, dynamic>>> getTodos() async {
    final List<dynamic> jsonList = jsonDecode(await file.readAsString());
    return jsonList
        .map((e) => e as Map<String, dynamic>) // 굳이 명시함
        .toList();
  }
}