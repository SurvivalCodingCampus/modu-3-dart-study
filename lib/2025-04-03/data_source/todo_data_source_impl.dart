import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../../2025-04-01/model/todo.dart';
import 'todo_data_source.dart';

class TodoDataSourceImpl implements TodoDataSource {
  static const header = {
    HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
  };
  final String _path;

  TodoDataSourceImpl({String path = 'https://jsonplaceholder.typicode.com'})
    : _path = path;

  @override
  Future<List<Todo>> getTodos() async {
    final http.Client client = http.Client();
    try {
      final res = await client.get(Uri.parse('$_path/todos'), headers: header);

      if (res.statusCode == 200) {
        final list = jsonDecode(utf8.decode(res.bodyBytes)) as List;
        return list.map((e) => Todo.fromJson(e)).toList();
      } else {
        throw Exception('todos 불러오기 실패');
      }
    } finally {
      client.close();
    }
  }

  @override
  Future<Todo> getTodo(int id) async {
    final http.Client client = http.Client();
    try {
      final res = await client.get(
        Uri.parse('$_path/todos/$id'),
        headers: header,
      );

      if (res.statusCode == 200) {
        final json = jsonDecode(utf8.decode(res.bodyBytes));
        return Todo.fromJson(json);
      } else {
        throw Exception('todo $id 불러오기 실패');
      }
    } finally {
      client.close();
    }
  }
}
