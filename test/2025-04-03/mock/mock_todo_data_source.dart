import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../assignments/2025-04-01/todo/data_source/todo_data_source.dart';

class MockTodoDataSource implements TodoDataSource {
  final http.Client _client;
  static const String todoListUrl =
      'https://jsonplaceholder.typicode.com/todos';
  static const String todoOneUrl =
      'https://jsonplaceholder.typicode.com/todos/1';

  MockTodoDataSource(this._client);

  @override
  Future<Map<String, dynamic>> getItem(String fileName, int id) async {
    final response = await _client.get(Uri.parse(todoOneUrl));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load todo');
    }
  }

  @override
  Future<List<Map<String, dynamic>>> getItems(String fileName) async {
    final response = await _client.get(Uri.parse(todoListUrl));
    if (response.statusCode == 200) {
      return (json.decode(response.body) as List)
          .map((data) => data as Map<String, dynamic>)
          .toList();
    } else {
      throw Exception('Failed to load todos');
    }
  }
}
