import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:modu_3_dart_study/2025-04/2025-04-03/data_source/todo_data_source.dart';
import 'package:modu_3_dart_study/2025-04/2025-04-03/model/todo.dart';

class TodoDataSourceImpl implements TodoDataSource {
  final http.Client _client;
  final String url;

  const TodoDataSourceImpl(this._client, {required this.url});

  @override
  Future<Todo> getTodo(int id) async {
    Uri parsed = Uri.parse('$url/todos/$id');
    http.Response response = await _client.get(parsed);

    if (response.statusCode != 200) {
      throw Exception('Failed to load todo');
    }

    if (response.body.isEmpty) {
      throw Exception('No todo found');
    }

    Map<String, dynamic> todo = jsonDecode(response.body);

    return Todo.fromJson(todo);
  }

  @override
  Future<List<Todo>> getTodos() async {
    Uri parsed = Uri.parse('$url/todos');
    http.Response response = await _client.get(parsed);

    if (response.statusCode != 200) {
      throw Exception('Failed to load todos');
    }

    List<dynamic> results = jsonDecode(response.body);

    return results.map((e) => Todo.fromJson(e)).toList();
  }
}
