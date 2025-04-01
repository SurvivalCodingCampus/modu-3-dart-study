import 'dart:convert';
import 'dart:io';
import '../models/todo.dart';

abstract interface class TodoSingleDataSource {
  Future<Todo?> getTodo();
}

class TodoSingleDataSourceImpl implements TodoSingleDataSource {
  final String jsonPath;

  TodoSingleDataSourceImpl({this.jsonPath = 'lib/2025-03-31/data/todo.json'});

  @override
  Future<Todo?> getTodo() async {
    try {
      final jsonString = await File(jsonPath).readAsString();
      final jsonMap = jsonDecode(jsonString);
      final todo = Todo.fromJson(jsonMap);

      return todo;
    } catch (e) {
      print('getTodo 실패: $e');
      return null;
    }
  }
}
