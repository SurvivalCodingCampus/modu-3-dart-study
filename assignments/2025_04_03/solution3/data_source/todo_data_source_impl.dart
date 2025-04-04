import 'dart:convert';

import 'todo_data_source.dart';
import 'package:http/http.dart' as http;

class TodoDataSourceImpl implements TodoDataSource {
  final http.Client client;

  TodoDataSourceImpl(this.client);

  @override
  Future<List<Map<String, dynamic>>> getTodos() async {
    final response = await client.get(
      Uri.parse('https://jsonplaceholder.typicode.com/todos'),
    );
    if (response.statusCode == 200) {
      return (jsonDecode(response.body) as List)
          .map((e) => e as Map<String, dynamic>)
          .toList();
    } else {
      throw Exception('Failed to load todos');
    }
  }

  @override
  Future<Map<String, dynamic>> getTodo(int id) async {
    final response = await client.get(
      Uri.parse('https://jsonplaceholder.typicode.com/todos/$id'),
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load todo');
    }
  }
}
