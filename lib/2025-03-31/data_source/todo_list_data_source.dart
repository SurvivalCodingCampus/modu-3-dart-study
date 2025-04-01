import 'dart:convert';
import 'dart:io';

import '../models/todo.dart';

abstract interface class TodoListDataSource {
  Future<List<Todo>> getTodos();
}

class TodoListDataSourceImpl implements TodoListDataSource {
  final String jsonPath;

  TodoListDataSourceImpl({
    this.jsonPath = 'lib/2025-03-31/data/todo_list.json',
  });

  @override
  Future<List<Todo>> getTodos() async {
    try {
      final String jsonString = await File(jsonPath).readAsString();
      final List<dynamic> jsonList = jsonDecode(jsonString) as List<dynamic>;
      final List<Todo> todos = jsonList.map((e) => Todo.fromJson(e)).toList();

      return todos;
    } catch (e) {
      print('getTodos 실패: $e');
      return <Todo>[]; // 빈 리스트 반환, 타입 명시
    }
  }
}
