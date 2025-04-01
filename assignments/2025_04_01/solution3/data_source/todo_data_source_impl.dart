import 'dart:convert';
import 'dart:io';

import 'todo_data_source.dart';

class TodoDataSourceImpl implements TodoDataSource {
  final jsonFile = File(
    'C:\\Users\\Ujun\\modu-3-dart-study\\assignments\\2025_04_01\\solution3\\todo.json',
  );
  @override
  Future<List<Map<String, dynamic>>> getTodos() async {
    final jsonString = await jsonFile.readAsString();

    final List todos = jsonDecode(jsonString);

    return todos.map((e) => e as Map<String, dynamic>).toList();
  }
}
