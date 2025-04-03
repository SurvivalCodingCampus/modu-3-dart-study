import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:modu_3_dart_study/2025-04-03/data_source/todo_data_source.dart';
import 'package:modu_3_dart_study/2025-04-03/model/todo.dart';

class TodoDataSourceImpl implements TodoDataSource {
  final http.Client _client;
  final String _url;

  const TodoDataSourceImpl({required String url, required http.Client client})
    : _client = client,
      _url = url;

  @override
  Future<List<Todo>> getTodos() async {
    final response = await _client.get(Uri.parse(_url));
    if (response.statusCode == 200) {
      return (jsonDecode(response.body) as List)
          .map((e) => Todo.fromJson(e))
          .toList();
    } else {
      throw Exception('todos 로딩 실패');
    }
  }

  @override
  Future<Todo> getTodo(int id) async {
    final response = await _client.get(Uri.parse(_url));
    if (response.statusCode == 200) {
      return (jsonDecode(response.body) as List)
          .map((e) => Todo.fromJson(e))
          .where((e) => e.id == id)
          .toList()
          .first;
    } else {
      throw Exception('todo 로딩 실패');
    }
  }
}
