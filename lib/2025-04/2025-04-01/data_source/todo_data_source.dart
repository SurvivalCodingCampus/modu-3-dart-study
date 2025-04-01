import 'dart:convert';
import 'dart:io';

import 'package:modu_3_dart_study/2025-04/2025-04-01/model/todo.dart';
import 'package:modu_3_dart_study/2025-04/data_source.dart';

class TodoDataSource implements DataSource<Todo> {
  @override
  Future<List<Todo>> load({
    String relativePath = '/lib/data/todos.json',
  }) async {
    File file = File(Directory.current.path + relativePath);
    List<Map<String, dynamic>> json = jsonDecode(await file.readAsString());

    return json.map((e) => Todo.fromJson(e)).toList();
  }
}
