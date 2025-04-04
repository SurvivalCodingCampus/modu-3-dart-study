import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:modu_3_dart_study/data_source/25-04-03/todo_data_source/todo_data_source.dart';
import '../../../model/25-04-03/todo.dart';

class TodoDataSourceImpl implements TodoDataSource {
  final http.Client client;
  TodoDataSourceImpl({required this.client});

  @override
  Future<Todo> getTodo(int id) async {
    final response = await client.get(
      Uri.parse('https://jsonplaceholder.typicode.com/todos/$id'),
    );
    if (response.statusCode == 200) {
      return Todo.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load todo');
    }
  }

  @override
  Future<List<Todo>> getTodos() async {
    final response = await client.get(
      Uri.parse('https://jsonplaceholder.typicode.com/todos'),
    );
    if (response.statusCode == 200) {
      return (json.decode(response.body) as List)
          .map((data) => Todo.fromJson(data))
          .toList();
    } else {
      throw Exception('Failed to load todos');
    }
  }
}
