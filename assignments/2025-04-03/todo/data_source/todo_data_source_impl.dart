import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../model/todo.dart';
import 'todo_data_source.dart';

class TodoDataSourceImpl implements TodoDataSource {
  final String path = 'lib/data/todos.json';
  final http.Client client;
  TodoDataSourceImpl({client}) : client = client ?? http.Client();

  @override
  Future<List<Todo>> getTodos() async {
    final response = await client.get(
      Uri.parse('https://jsonplaceholder.typicode.com/todos'),
    );
    if (response.statusCode == 200) {
      final jsonList = jsonDecode(utf8.decode(response.bodyBytes)) as List;
      final todoList = jsonList.map((e) => Todo.fromJson(e)).toList();
      return todoList;
    }
    throw UnimplementedError();
  }

  @override
  Future<Todo> getTodo(int id) async {
    final response = await client.get(
      Uri.parse('https://jsonplaceholder.typicode.com/todos/$id'),
    );
    if (response.statusCode == 200) {
      return Todo.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
    }
    throw UnimplementedError();
  }

  @override
  Future<List<Map<String, dynamic>>> readTodos() async {
    String? jsonString = await File(path).readAsString();

    if (jsonString == '') {
      jsonString = await File('lib/data/backup.dat').readAsString();
    }

    final List jsonList = jsonDecode(jsonString);
    final List<Map<String, dynamic>> todos = List<Map<String, dynamic>>.from(
      jsonList,
    );
    return todos;
  }

  @override
  Future<void> writeTodos(List<Map<String, dynamic>> todos) async {
    String json = jsonEncode(todos);
    await File(path).writeAsString(json);
  }
}
