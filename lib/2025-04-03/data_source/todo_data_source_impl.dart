import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../2025-04-01/model/todo.dart';
import 'todo_data_source.dart';

class TodoDataSourceImpl implements TodoDataSource {
  final http.Client _client;

  TodoDataSourceImpl() : _client = http.Client();

  @override
  Future<List<Todo>> getTodos() async {
    final res = await _client.get(
      Uri.parse('https://jsonplaceholder.typicode.com/todos'),
      headers: {'Accept-Charset': 'utf-8'},
    );

    if (res.statusCode == 200) {
      final list = jsonDecode(utf8.decode(res.bodyBytes)) as List;
      return list.map((e) => Todo.fromJson(e)).toList();
    } else {
      throw Exception('todos 불러오기 실패');
    }
  }

  @override
  Future<Todo> getTodo(int id) async {
    final res = await _client.get(
      Uri.parse('https://jsonplaceholder.typicode.com/todos/$id'),
      headers: {'Accept-Charset': 'utf-8'},
    );

    if (res.statusCode == 200) {
      final json = jsonDecode(utf8.decode(res.bodyBytes));
      return Todo.fromJson(json);
    } else {
      throw Exception('todo $id 불러오기 실패');
    }
  }
}
