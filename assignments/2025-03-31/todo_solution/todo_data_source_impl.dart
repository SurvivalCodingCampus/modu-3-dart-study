import 'dart:convert';
import 'dart:io';

import 'todo.dart';
import 'todo_data_source.dart';

class TodoDataSourceImpl implements TodoDataSource {
  static const String todoJsoFilePath =
      '/Users/jilong/Desktop/workspace/flutter_modu/assignments/2025-03-31/todo_solution/todo.json';
  static const String todoListJsoFilePath =
      '/Users/jilong/Desktop/workspace/flutter_modu/assignments/2025-03-31/todo_solution/todoList.json';
  static const String url = 'https://jsonplaceholder.typicode.com/todos/1';

  @override
  Future<Todo> getTodo() async {
    try {
      final File jsonFile = File(todoJsoFilePath);
      String jsonFromFile = await jsonFile.readAsString();
      Map<String, dynamic> jsonMap = jsonDecode(jsonFromFile);
      Todo deserializedTodo = Todo.fromJson(jsonMap);
      print(deserializedTodo);

      return deserializedTodo;
    } on FormatException {
      throw FormatException('JSON 파싱 중 오류가 발생했습니다');
    } catch (e) {
      print(e);
      throw Exception('Error fetching Todo: $e');
    }
  }

  @override
  Future<List<Todo>> getTodos() async {
    try {
      final File jsonFile = File(todoListJsoFilePath);
      String jsonFromFile = await jsonFile.readAsString();

      List<dynamic> jsonList = jsonDecode(jsonFromFile);

      List<Todo> todos = jsonList.map((e) => Todo.fromJson(e)).toList();

      print(todos);
      return todos;
    } on FormatException {
      throw FormatException('JSON 파싱 중 오류가 발생했습니다');
    } catch (e) {
      print(e);
      throw Exception('Error fetching Todo: $e');
    }
  }
}

void main() async {
  final Todo todo = await TodoDataSourceImpl().getTodo();
  final List<Todo> todos = await TodoDataSourceImpl().getTodos();
}
